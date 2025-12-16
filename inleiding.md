# Inleiding

Het ministerie van Infrastructuur en Waterstaat (IenW) heeft het Nationaal
Toegangspunt Mobiliteitsdata (NTM) gevraagd om een eerste aanzet te maken voor
de **Gegevenscatalogus Mobiliteitsdata**. Deze catalogus vormt een belangrijke
bouwsteen binnen het Digitaal Stelsel Mobiliteitsdata (DSM), waarin data uit
verschillende bronnen bij elkaar worden gebracht om mobiliteit slimmer,
efficiënter en duurzamer te organiseren.

De ontwikkeling van de gegevenscatalogus vindt plaats in nauwe samenhang met het
transponeringstraject van de Europese **ITS-richtlijn** (Intelligent Transport
Systems). Deze richtlijn verplicht lidstaten tot het beschikbaar stellen van
specifieke mobiliteitsdata, en de vertaling ervan naar de Nederlandse context is
in volle gang. Afstemming met dit traject is essentieel voor een consistente
uitvoering.

## Doel en functie van de gegevenscatalogus

De Gegevenscatalogus Mobiliteitsdata heeft als doel om datasets die binnen de
scope van het DSM vallen, op een eenduidige en gestandaardiseerde manier te
beschrijven. Dit gebeurt inclusief informatie over definitie, kwaliteit,
toepassingsgebied, verplichtingen en verantwoordelijke partijen. Door dit op een
gestandaardiseerde wijze vast te leggen, wordt helderheid geboden aan
bronhouders, toezichthouders en gebruikers over welke data vereist zijn, onder
welke condities, en wie waarvoor verantwoordelijk is.

De gegevenscatalogus zal op termijn gekoppeld worden aan het nationale register
mobiliteitsdata van NTM. Zo ontstaat inzicht in de beschikbaarheid en de
voortgang van datasets, en kan gericht worden ondersteund waar nodig. De
tijdelijke DSM-datatabel fungeert in deze fase als overbrugging totdat de
gegevenscatalogus operationeel is.

<figure id="Figuur_1">
<img src="data/images/Gegevenscatalogus_in_context.png" alt="">
<figcaption>Architectuurplaat van de gegevenscatalogus in de context van wetgeving en uitvoering</figcaption>
</figure>

## Van prototype naar standaard

In dit project wordt een eerste **prototype** van de gegevenscatalogus
gerealiseerd, gericht op een beperkt aantal geselecteerde datasets die vallen
onder de ITS-richtlijn. Tegelijkertijd wordt geëvalueerd of het initiële ontwerp
geschikt is voor verdere uitbouw richting een volwaardige, schaalbare en veilige
oplossing.

**Begrippen en modellen**

De gegevenscatalogus bevat naast datasetbeschrijvingen ook een begrippenkader
voor het domein mobiliteitsdata. Dit bestaat uit:

-   Een **begrippenmodel** conform de Nederlandse standaard NL-SBB (MIM-niveau
    1);

-   Een **conceptueel informatiemodel** (MIM-niveau 2);

-   En de feitelijke **gegevenscatalogus**, waarin per dataset gegevens worden
    vastgelegd zoals:

    -   *Wat:* Definitie en kwaliteitsafspraken;

    -   *Waarom:* Wettelijke grondslag of DSM-afspraak;

    -   *Waar:* Geografische scope (routes, knooppunten, gebieden);

    -   *Wanneer:* Termijnen van verplichting;

    -   *Wie moet:* Verantwoordelijke bronhouder;

    -   *Wie bepaalt:* Governance;

    -   *Hoe:* Landelijke voorziening of dienst.

## Onderwerp en toepassingsgebied

Mobiliteitsdata omvat alle informatie die relevant is voor het optimaliseren van
vervoer van mensen en goederen. Dit varieert van statische data over
infrastructuur tot dynamische, realtime data over verkeersstromen, drukte of
afzettingen. De gegevenscatalogus sluit daarbij aan op ontwikkelingen in het
Europese programma **Mobiliteits Data Space**, waarin mobiliteitsdata als
cruciale grondstof voor innovatie en dienstverlening wordt beschouwd.

## Leeswijzer

Dit document is als volgt opgebouwd:

-   **Hoofdstuk 2** beschrijft de **ontwerpprincipes** die ten grondslag liggen
    aan de opzet van de Gegevenscatalogus Mobiliteitsdata. Deze principes vormen
    het fundament voor de keuzes in structuur, standaardisatie en samenhang
    binnen het Digitaal Stelsel Mobiliteitsdata.

-   **Hoofdstuk 3** gaat in op de **modelleurkeuzes**: de afwegingen en
    uitgangspunten die zijn gemaakt bij het modelleren van begrippen,
    informatiestructuren en datasets, onder andere op basis van het MIM en de
    NL-SBB-standaard.

-   **Hoofdstuk 4 en verder** bevatten de **conceptuele beschrijvingen van
    gegevenstypen** zoals benoemd in de ITS-regelgeving, aangevuld met een
    inventarisatie van relevante Nederlandse datasets. Per gegevenstype wordt
    uitgewerkt welke data beschikbaar (moet) zijn, wat de herkomst is, en onder
    welke condities deze data deel uitmaken van het DSM.

De opbouw helpt de lezer om stap voor stap van het grotere plaatje naar de
concrete invulling te gaan. Elk hoofdstuk is op zichzelf te lezen, maar samen
geven ze een compleet beeld van hoe de data is opgebouwd en hoe de onderdelen
binnen het mobiliteitsdomein met elkaar samenhangen.
