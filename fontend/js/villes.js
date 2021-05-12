"use strict";

document.addEventListener("DOMContentLoaded", voirVilles);

let reponse;
function voirVilles()
{

    let xhr = new XMLHttpRequest();
    xhr.open('get', 'getVille', true); // donnée par le serveur sql
    xhr.onload = affiche;
    xhr.send();
    function affiche() {

        reponse = JSON.parse(this.responseText);
        let elHtml = "";

        for(let i of reponse)
        {

                elHtml += "<li>" + i.villeCp + " - " + i.nomVille + "</li>";

        }
        document.getElementById("listeVilles").innerHTML = elHtml; // affiche les autres acteurs
    }
}
function ajouterVille(formulaire)
{
    let xhr = new XMLHttpRequest();
    console.log(formulaire.ville.value);
    let ville = formulaire.ville.value;
    console.log(formulaire.codePostal.value);
    let codePostal = formulaire.codePostal.value;
    let url = 'writeVille?ville=' + ville + "&codePostal=" + codePostal;
	console.log(url);
	xhr.open('GET', url, true); // donnée par le serveur sql
    xhr.onload = voirVilles();
	xhr.send();
	
	return false;

}