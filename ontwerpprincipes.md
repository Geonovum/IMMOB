# Ontwerpprincipes

De Gegevenscatalogus Mobiliteitsdata is een kerninstrument binnen het Digitaal
Stelsel Mobiliteitsdata (DSM) en vormt de brug tussen juridische begrippen uit
wet- en regelgeving en informatiekundige concepten in mobiliteitsdatasets. Deze
gegevenscatalogus is een onderdeel van de bredere gegevenscatalogus
Mobiliteitsdata en richt zich op de gegevenstypen over realtime
verkeersinformatie voor intelligenten transport systemen (ITS). De catalogus
staat niet op zichzelf: zij is één van meerdere representaties van een
onderliggend informatiemodel. De volgende ontwerpprincipes liggen ten grondslag
aan dit informatiemodel en de daaruit afgeleide gegevenscatalogus.

## Centraal informatiemodel basis

De kern van deze gegevenscatalogus is het centraal beheerde informatiemodel. Dit
model fungeert als enige bron van waarheid waarin alle relevante kennis – zoals
juridische begrippen, datasets, relaties en bronnen – samenkomt. Het
informatiemodel is opgezet om een eenduidige verbinding te leggen tussen formele
juridische termen uit Europese [wet- en
regelgeving](https://github.com/NAPCORE/Data-dictionary/blob/main/DR%20(EU)%202022-670.md)
en informatiekundige concepten in Nederlandse mobiliteitsdatasets. Hierdoor
ontstaat een gemeenschappelijk, consistent en betrouwbaar begrippenkader.

## Verbinding tussen wetgeving en data

Het informatiemodel legt expliciete relaties tussen formele termen uit Europese
en nationale regelgeving
([ITS-richtlijn](https://github.com/NAPCORE/Data-dictionary/blob/main/DR%20(EU)%202022-670.md))
en informatiekundige concepten die in Nederlandse mobiliteitsdatasets voorkomen.
Zo ontstaat een gedeeld begrippenkader dat wetgeving, beleid en data effectief
met elkaar verbindt.

## Gebruiksvriendelijkheid en modelgedreven aanpak

Om deze verbinding effectief en breed toepasbaar te maken, is het ontwerp zowel
gebruiksvriendelijk als modelgedreven. Dit betekent dat het informatiemodel:

-   toegankelijk is voor verschillende doelgroepen, zoals beleidsmedewerkers,
    dataspecialisten, juristen en ontwikkelaars, met heldere, visueel
    begrijpelijke representaties en toegankelijke terminologie;

-   technisch robuust is, zodat uit de centrale kennisbron automatisch
    verschillende representaties en artefacten worden gegenereerd, zoals
    gegevenscatalogi, begrippenkaders, mapping-tabellen en machineleesbare
    technische bestanden in gestandaardiseerde formaten (bijvoorbeeld SKOS,
    RDF/Turtle, API-specificaties en JSON-schema’s).

Dankzij deze aanpak is de gegevenscatalogus slechts één van meerdere
verschijningsvormen van het onderliggende informatiemodel. Vanuit dezelfde
centrale kennislaag kunnen verschillende presentaties worden afgeleid, afgestemd
op specifieke gebruikstoepassingen en doelgroepen, wat flexibiliteit, samenhang
en toekomstbestendigheid garandeert.

## Schaalbare en modulaire opzet

De methodiek is schaalbaar en modulair: nieuwe gegevenstypen uit regelgeving en
datasets uit de praktijk kunnen eenvoudig worden toegevoegd. Dit maakt het
informatiemodel wendbaar en geschikt voor doorontwikkeling en uitbreiding.

## Ondersteuning van IST en SOLL

Het informatiemodel ondersteunt het modelleren van zowel de huidige situatie
(IST/baseline) als toekomstige situaties (SOLL/target). Dit is essentieel voor
het begeleiden van transities, zoals:

-   vervanging van het Nationaal Wegenbestand door een opvolger;

-   overgang naar nieuwe versies van datasets;

-   fasering van juridische verplichtingen in de tijd.

## Beheerbaar en herleidbaar hergebruik

De gegevenscatalogus is ontworpen voor duurzaam beheer en gericht op efficiënt
hergebruik van bestaande termen, klassen en eigenschappen uit brondatasets,
informatiemodellen en wetgeving. Waar mogelijk worden bestaande definities en
structuren hergebruikt, met expliciete verwijzing naar de bron. Dit bevordert
consistentie, transparantie en interoperabiliteit binnen het mobiliteitsdomein.

Tegelijkertijd is het beheer zo ingericht dat wijzigingen in bronmodellen of
regelgeving met minimale inspanning kunnen worden verwerkt. Omdat wijzigingen
herleidbaar zijn tot hun oorsprong, kan snel worden vastgesteld welke onderdelen
van de catalogus aangepast moeten worden. Automatische synchronisatie met
bronmodellen wordt nagestreefd, zodat de catalogus actueel blijft en meebeweegt
met ontwikkelingen in het datalandschap – zonder concessies te doen aan
stabiliteit of betrouwbaarheid.
