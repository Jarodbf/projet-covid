"use strict";

document.addEventListener("DOMContentLoaded", voirPersonnes);

let reponseP;
function voirPersonnes()
{

    let xhr = new XMLHttpRequest();
    xhr.open('get', 'getPersonne', true); // donnée par le serveur sql
    xhr.onload = affiche;
    xhr.send();
    function affiche() {

        reponseP = JSON.parse(this.responseText);
        let elHtml = "";
        let elForm = "";
        for(let i of reponseP)
        {
                elHtml += "<tr>";
                elHtml += "<th>" + i.idPersonne + "</th>";
                elForm += "<option value=\"" + i.idPersonne  + "\">" + i.nomPersonne + " " + i.prenomPersonne + "</option>";
                elHtml += "<th>" + i.prenomPersonne + "</th>";
                elHtml += "<th>" + i.nomPersonne + "</th>";
                elHtml += "<th>" + i.naissanceDate + "</th>";
                elHtml += "</tr>";
        }
        document.getElementById("personneTestCovid").innerHTML = elForm;
        document.getElementById("tbodyPersonnes").innerHTML = elHtml; // affiche les autres acteurs
    }
}
function ajouterPersonne(formulaire)
{
    let xhr = new XMLHttpRequest();
    console.log(formulaire.naissance.value);
    //let ville = formulaire.ville.value;
    //console.log(formulaire.codePostal.value);
    //let codePostal = formulaire.codePostal.value;
    xhr.open('GET', 'writePersonne?nom=' + formulaire.nom.value + "&prenom=" + formulaire.prenom.value + "&naissance=" + formulaire.naissance.value + "&sexe=" + formulaire.sexe.value, true); // donnée par le serveur sql
    xhr.onload = voirPersonnes();
    xhr.send();

	return false;

}
function ajouterTestCovid(formulaire)
{
    let xhr = new XMLHttpRequest();
    xhr.open('GET', 'writeTest?personne=' + formulaire.personneTestCovid.value + "&resultat=" + formulaire.resultatTestCovid.value + "&effect=" + formulaire.dateTestCovid.value + "&expiration=" + formulaire.dateExpirationTestCovid.value, true); // donnée par le serveur sql
    xhr.onload = voirPersonnes();
    xhr.send();

    return false;

}
