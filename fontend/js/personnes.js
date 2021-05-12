"use strict";

document.addEventListener("DOMContentLoaded", voirPersonnes);

let reponse;
function voirPersonnes()
{

    let xhr = new XMLHttpRequest();
    xhr.open('get', 'getPersonne', true); // donnée par le serveur sql
    xhr.onload = affiche;
    xhr.send();
    function affiche() {

        reponse = JSON.parse(this.responseText);
        let elHtml = "<tr>";

        for(let i of reponse)
        {

                elHtml += "<th>" + i.idPersonne + "</th>";
                elHtml += "<th>" + i.prenomPersonne + "</th>";
                elHtml += "<th>" + i.nomPersonne + "</th>";
                //elHtml += "<th>" + i.naissanceDate + "</th>";

        }
		elHtml += "</tr>";
        document.getElementById("listeVilles").innerHTML = elHtml; // affiche les autres acteurs
    }
}
function ajouterVille(formulaire)
{
    let xhr = new XMLHttpRequest();
    //console.log(formulaire.ville.value);
    let ville = formulaire.ville.value;
    //console.log(formulaire.codePostal.value);
    let codePostal = formulaire.codePostal.value;
    xhr.onload = testVille();
    xhr.open('GET', 'writeVille?ville=' + ville + "&codePostal=" + codePostal, true); // donnée par le serveur sql
    xhr.send();

    function testVille()//test si ville déjà rentrer
    {
        for (let i of reponse)
        {
            if (ville == i.nomVille)
            {
                return 1;//ville déjà entrée
            }
        }
    }
	//voirVilles();

}