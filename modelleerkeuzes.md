# Modelleurkeuzes

De modellering van het kennismodel voor de Gegevenscatalogus Mobiliteitsdata is
gebaseerd op een aantal bewuste modelleurkeuzes. Deze keuzes vloeien voort uit
de ontwerpprincipes en zorgen voor een consistente, herleidbare en
toekomstbestendige kennislaag die wet- en regelgeving verbindt met
mobiliteitsdatasets. Hieronder worden de belangrijkste modelleerkeuzes
toegelicht.

## Centrale beheeromgeving in UML

Het kennismodel wordt centraal beheerd in een UML-omgeving, vormgegeven in
Enterprise Architect. In deze omgeving worden verschillende lagen van het model
opgebouwd en beheerd:

-   Een conceptueel model van de gegevenstypen uit de ITS-regelgeving, gebaseerd
    op interpretatie en vertaling van de tekstuele regelgeving naar
    informatiekundige concepten;

-   Conceptuele/logische modellen van mobiliteitsdatasets;

-   Onderliggende basismodellen zoals NEN3610, datatypen uit MIM en ISO, en
    aanvullende metamodelcomponenten voor grondslag, kwaliteit en relaties,
    gebaseerd op het MIM, het NL-SBB-profiel en eventuele aanvullende
    projectspecifieke eisen..

## Hergebruik en reverse engineering

Waar mogelijk worden bestaande UML-modellen van datasets hergebruikt. Indien
geen model beschikbaar is, wordt via reverse engineering een conceptueel model
opgesteld conform MIM:

-   Conceptuele benamingen worden gebruikt als klasse- en attribuutnamen;

-   Technische benamingen uit de datasets worden opgenomen in het alias-veld;

-   In visualisaties kan worden gewisseld tussen weergave van conceptuele of
    technische terminologie, afhankelijk van doelgroep en toepassing.

## Verbindend kennismodel

Het kennismodel fungeert als brug tussen juridische concepten en
informatiekundige structuren. Daartoe worden expliciete relaties gelegd tussen:

-   Concepten in het model van de ITS-regelgeving;

-   Concepten in de modellen van mobiliteitsdatasets.

Deze relaties vormen de kern van het gedeelde begrippenkader.

## Modelleren volgens MIM-niveau 2

Het gehele kennismodel wordt opgebouwd volgens MIM-niveau 2, waarmee een
conceptueel model wordt gedefinieerd. Dit wordt uitgebreid met:

-   Grondslaginformatie (herkomst, juridische basis, beher- en
    uitvoeringsrollen);

-   Kwaliteitseigenschappen (betrouwbaarheid, volledigheid, actualiteit);

-   Semantische relaties conform het NL-SBB-metamodel.

## Modellering van IST en SOLL

Het model ondersteunt de modellering van zowel de huidige (IST) als de
toekomstige (SOLL) situatie:

-   Transities worden gemodelleerd via een Keuze-relatie;

-   De Keuze kan zowel verwijzen naar een huidige als naar een toekomstige
    versie van een concept;

-   Bij implementatie van de nieuwe situatie kan deze relatie eenvoudig worden
    vervangen door een directe link naar het nieuwe concept.

## Datasetkeuze voor de basislagen

Voor geometrie en wegkenmerken is gekozen voor:

-   IST: het Nationaal Wegen Bestand (NWB), waarvan op basis van de
    productspecificatie een MIM-conform model is gemaakt;

-   SOLL: de Wegenkenmerkregistratie (WKR), waarvoor een conceptueel model
    beschikbaar is uit het Mercator-project.

Beide modellen zijn as-is opgenomen. Er worden binnen het kennismodel geen
aanpassingen of verbetersuggesties gedaan op deze modellen. Ook andere bronnen
voor geometrie zijn mogelijk, zoals VILD (voor wegwerkzaamheden).

## Afbakening van mobiliteitsdatasets

De eerste fase richt zich op modellering van de volgende mobiliteitsdatasets:

-   Maximumsnelheden

-   Wegwerkzaamheden

-   Afsluitingen

-   Gewicht, lengte, breedte, hoogte en aslast

-   Milieuzones en zero-emissiezones

-   Rijrichtingen

-   Veiligheidsgerelateerde berichten (selectie volgt)

-   Locaties van geïdentificeerde ‘access nodes’ voor alle geplande modaliteiten
    (zoals haltes)

-   Verkeerscirculatieplannen

## Modellering van relaties met «trace»

De verbinding tussen regelgeving en data wordt gelegd met «trace»-relaties:

-   In UML wordt dit gedaan met een Dependency met het stereotype «trace»;

-   Elke trace heeft een bron (regelgevingsconcept) en doel (datasetconcept);

-   De relatie wordt zoveel mogelijk gelegd op het niveau van attribuut of
    domeinwaarde;

-   De richting is van wetgeving naar dataset, omdat dit de informatievraag het
    beste ondersteunt.

## Genereren van modelgedreven representaties

Vanuit het centrale kennismodel worden automatisch verschillende representaties
gegenereerd, zoals:

-   Een HTML-weergave voor opname in de Gegevenscatalogus;

-   Een SKOS-bestand voor opname in het Begrippenkader;

-   Mappingtabellen ten behoeve van traceerbaarheid en afleiding.

## Modelleringsregels bij ontbrekende links

Als een wetgevingsconcept niet voorkomt in een dataset of model:

-   Wordt het UML-element gemarkeerd met scope Private (zichtbaar als -);

-   Dit geldt zowel voor objecten, attributen als domeinwaarden.

Indien een dataset een conceptueel element toestaat, maar dit in de praktijk
niet instantiëert:

-   Wordt de relatie tussen wetgeving en dataset opgenomen;

-   De trace krijgt ook scope Private, om het verschil tussen potentieel en
    feitelijk gebruik te markeren.

## Detailkeuzes in modellering

Naast de hierboven beschreven hoofdlijnen zijn er op verschillende punten
specifieke detailkeuzes gemaakt om de modellering consistent, beheersbaar en
toepasbaar te houden. Deze keuzes betreffen onder andere naamgeving,
visualisatie, metadatering, en interpretatie van wetsteksten in relatie tot
datasets. Hieronder volgt een overzicht van deze specifieke detailkeuzes.

-   Rijstrook kan niet los bestaan van Weglink, dus daarom compositie-relatie
    ‘bestaat uit’.

-   In DATEXII Wegwerkzaamheden heeft een Situation een locatie-referentie. De
    locatie referentie wordt gelegd via VILD-mapping. In het kennismodel wordt
    de geometrie van Wegwerkzaamheden daarom gerelateerd aan LocationReference
    uit DATEXII.
