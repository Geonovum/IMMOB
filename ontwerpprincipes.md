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
juridische termen en betekenis uit Europese richtlijn (Directive) [ITS-richtlijn](http://data.europa.eu/eli/dir/2010/40/2023-12-20), de hieraan gekoppelde gedelegeerde richtlijnen (Delegated regulations):
- [Real Time Traffic Information System (RTTI)](https://eur-lex.europa.eu/eli/reg_del/2022/670/oj)
- [Multimodal Traffic Information System (MMTIS)](http://data.europa.eu/eli/reg_del/2024/490/oj)
- [Safety Related Trafiic Information System (SRTI)](http://data.europa.eu/eli/reg_del/2013/886/oj) 
- [Safe and Secure Truck Parking (SSTP)](http://data.europa.eu/eli/reg_del/2013/885/oj)

en informatiekundige concepten in Nederlandse mobiliteitsdatasets. Hierdoor
ontstaat een gemeenschappelijk, consistent en betrouwbaar begrippenkader.

## Verbinding tussen wetgeving en data

De context van de modellering is de ITS wetgeving. Voor de inhoudelijke input van de gegevenssets en daarop gebaseerde modellen is de door [NAPCORE](https://napcore.eu/) opgestelde [NAPCORE Data dictionary](https://napcore.eu/its-data-dictionary/) gebruikt. Met deze data dictionary heeft NAPCORE voor de aan de aan de ITS-richtlijn gekoppelde RTTI, MMTIS, SRTI en SSTP de gegevenstypen voorzien van definities en waar mogelijk een beschrijving van de minimale verplichtingen voor het delen van informatie. De NAPCORE data dictionary voorziet hiermee in een gegevens view op de ITS en gedelegeerde richtlijnen.

Het IMMOB en daarmee deze gegevenscatalogus gebruikt de NAPCORE data dictionary als informatiebasis voor de ontwikkeling van het IMMOB informatiemodel door gegevenstypen over te nemen en te voorzien van attributen en relaties. Zo ontstaat een begrippenkader dat wetgeving, beleid en data effectief met elkaar verbindt.

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
