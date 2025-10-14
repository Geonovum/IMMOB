# UML naar NL-SBB JSON-LD Viewer

Dit is de handleiding voor het omzetten van een UML-model (XMI) naar een NL-SBB gebaseerde JSON-LD. Het resulterende JSON-LD bestand dient als basis voor het genereren van de **link graph** in de viewer.

De viewer is te benaderen via: [https://geonovum.github.io/IMMOB/viewer/](https://geonovum.github.io/IMMOB/viewer/)

Klik [hier](https://geonovum.github.io/IMMOB/viewer/?uri_id=https%3A%2F%2Fdocs.geostandaarden.nl%2Fmobiliteit%2Fid%2Fbegrip%2FVoertuigenergiestation) voor de direct link naar het begrip **Voertuigenergiestation**.

---

## Werkwijze

### Stap 1: Exporteer UML naar XMI
- Exporteer het UML-model naar een XMI-bestand (versie 1.1).
- **Belangrijk:** Doe dit op het **hoogste niveau van het Package**.  
  - Alleen elementen in dit package worden in de link graph getoond.  
  - Elementen die niet in de XMI zitten, verschijnen niet in de viewer.  
  - De relaties tussen elementen worden bepaald op basis van GUID’s in de XMI.  
  - Zorg dat ook alle «traces» naar externe modellen, zoals **DATEX2** en **NWB** elementen, aanwezig zijn in de XMI.

---

### Stap 2: Converteer XMI naar JSON-LD
- Voer een **XSLT-transformatie** uit op het XMI-bestand met behulp van `xmi2nlsbb.xsl`.  
- Het resultaat is een bestand `model.json`.

#### Optie 1: Gebruik Oxygen XML Editor
- Open `xmi2nlsbb.xsl` en het XMI-bestand in Oxygen.
- Voer de transformatie uit via de ingebouwde XSLT-functionaliteit.

#### Optie 2: Gebruik Saxon via de opdrachtregel
- **Download Saxon HE (Home Edition)** voor Windows:
  - [Saxon-HE GitHub-repository](https://github.com/Saxonica/Saxon-HE)
  - [Saxon op SourceForge](https://sourceforge.net/projects/saxon/)
- **Zorg ervoor dat Java is geïnstalleerd** op je systeem.
- Open een opdrachtprompt en voer de volgende opdracht uit:
  ```bash
  java -jar saxon-he-12.5.jar -s:xmi-bestand.xmi -xsl:xmi2nlsbb.xsl -o:model.json

--- 

### Stap 3: Voeg JSON toe aan de viewer

- Plaats model.json in de map viewer in de GitHub-repository.
Bijvoorbeeld:

IMMOB/
  └── viewer/
       └── model.json


- Commit en push de wijzigingen naar GitHub.

- Open de viewer in je browser; deze werkt nu automatisch met het nieuwe model.json.

---
### Opmerkingen

- Controleer altijd of het XMI alle benodigde elementen bevat voordat je de transformatie uitvoert.
- De viewer gebruikt de JSON-LD structuur voor het tekenen van de link graph en het leggen van relaties.
