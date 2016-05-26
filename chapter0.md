---
title: 'Unipept'
subtitle: 'Computational Exploration of Metaproteome Data'
author: 'Bart Mesuere'

lang: "en"

link-citations: true
citation-style: bib.cls

titleDelim: ""
figureTemplate: "<span class='figure-title'>$$figureTitle$$&nbsp;$$i$$</span> $$t$$"
figPrefix:
  - "figure"
  - "figures"
tableTemplate: "<span class='table-title'>$$tableTitle$$&nbsp;$$i$$</span> $$t$$"
tblPrefix:
  - "table"
  - "tables"
secPrefix:
  - "section"
  - "sections"
listingTemplate: "<span class='listing-caption'><span class='listing-title'>$$listingTitle$$&nbsp;$$i$$</span> $$t$$</span>"
lstPrefix:
  - "listing"
  - "listings"
---

# Preface {- .front-matter data-running-title='Preface'}

Het dankwoord, het begin van een boek, maar toch ook een beetje het einde. De meest gelezen pagina's van een doctoraat. Maar waarom eigenlijk? Een van de weinige stukjes tekst in dit boek waar een glimp kan worden opgevangen van de man of vrouw achter het doctoraat? De enige pagina's die begrijpbaar zijn voor iedereen? Omdat het boek er meestal mee begint en men daarna afhaakt? Of toch gewoon uit *zou ik vermeld worden*-nieuwsgierigheid?

Als doctorandus zijn dit misschien wel de moeilijkste pagina's om te schrijven. Je bent het beu en wil het boek naar de drukker sturen, maar tegelijk wil je niemand vergeten te bedanken, wat origineel uit de hoek komen en als het even kan ook wat grappig zijn. Ik doe zoals elke goede informaticus die vast zit met een probleem: Google openen. "*How to write an original preface*", "*Top 10 acknowledgements*", "*Auto generate acknowledgements*", "*Origin of Lorem Ipsum*", &hellip;. Weinig resultaat, maar zoals vaak wel twee uur tijd verspild op Wikipedia. Wist je trouwens dat de olifant, kangoeroe, en zeekoe de enige zoogdieren zijn die meerdere keren van gebit wisselen tijdens hun leven?

Leuke dankwoorden beginnen vaak met het bedanken van belangrijke personen die slechts indirect een grote invloed gehad hebben. Bij deze wens ik de Oromo te bedanken voor het ontdekken van de koffie (wist je trouwens dat het woord *coffee* van koffie komt, en niet andersom), Alan Turing voor zijn werk in de theoretische informatica (en misschien wel de allereerste bioinformaticus?), en professor Frank De Clerck die alles *triviaal* deed lijken. Ook schrij&shy;vende voorbeelden, merci Douglas Adams en Steven Moffat, en een sarcastische bedanking mogen uiteraard niet ontbreken. Bedankt aan mijn vroegere wiskundeleerkracht Dorine "informatica aan de unief dat zal niet lukken, en burgerlijk ingenieur zeker niet" Claeys.

Laat ik nu toch ook maar de mensen bedanken die er echt toe deden. In de eerste plaats denk ik dan aan mijn promotor Peter Dawyndt zonder wie dit doctoraat niet mogelijk was. Niettegenstaande proteomics voor ons beide onbekend terrein was aan het begin van dit project, zijn we er toch in geslaagd om op relatief korte termijn een mooie tool te ont&shy;wikkelen die ook effectief gebruikt wordt. Dit ook dankzij Peter Vandamme en Bart Devreese die ons, zeker in het begin, met veel geduld wegwijs gemaakt hebben in de uitdagingen en noden in dit toch wel complexe veld.

Eveneens een dikke merci aan de thesisstudenten die ik de afgelopen jaren begeleid heb: Toon, Tom, Felix, Kevin en Stijn. Jullie werk was een meerwaarde voor het project. Daarnaast hebben vele anderen, direct of indirect, bijgedragen aan het succes van Unipept. Bedankt Griet, Maarten, Lieven, Jens, Cizar, Henning en Lennart.

Leve ook het chatkanaal en de leden van de studenten&shy;vereniging Zeus WPI. Jullie expertise, tips, en feedback waren van onschatbare waarde en hebben me uren tijd bespaard. Jullie afleiding en interessante discussies hebben me dan weer uren tijd gekost.

Uiteraard wil ik ook mijn vakgroep TWIST bedanken die de werkdagen de moeite waard maakten dankzij de discussies in de koffiepauzes, de spelletjes- en K3-avonden, de filosofische gesprekken over mayonaise van de Aldi tijdens de restolunches en zo veel meer. Gaande van gedeelde interesses in Doctor Who, Zelda, Star Wars, Age of Empires, dino's en gekleurde bollen, over het leegspuiten van flessen cava en circulaire vergaderingen, tot het samen begeleiden van vakken, jullie verdienen het allemaal om <span class="no-hyphen">hier</span> vermeld te worden. Toch zou ik er graag enkele mensen uitpikken die er al van bij het begin bij waren. Een dikke merci aan mede-Tardisbouwer Davy, kousencontroleur Virginie, en alwetende Nico.

Jaren geleden belandde ik als 16-jarige op Home <span class="no-hyphen">Boudewijn</span>. Ik had toen nooit kunnen dromen in welke fantastische omgeving ik zou terecht komen. Tijdens de blok in de bar blijven slapen, illegaal netwerkkabels op het dak leggen, SABAM aan de deur zetten, frigo's uitkuisen met zoutzuur, het zijn maar enkele stoten die we uitgehaald hebben en de basis voor een vriendschap die nu, vele jaren later, nog verder blijft duren. Bedankt allemaal en dat er nog veel Ardennenreisjes mogen volgen. In het bijzonder nog een extra bedankje aan PhD-buddies Simon en Bert die altijd klaar stonden met advies en een luisterend oor waren als het even te veel werd.

Als laatste ook een grote dankjewel aan mijn grootste supporters, mijn familie. Jullie waren er altijd voor me, ook toen mijn eerste bachelor niet van een leien dakje liep, ik soms wat slechtgezind was tijdens de examens, of als ik weer eens in het weekend moest werken. Merci, mama, papa, Pieter, Koen, levende knuffelbeesten Twix, Boris, Jules, en uiteraard ook Cath. Bedankt voor alles.

Het dankwoord, het einde van een werk, maar toch ook een beetje een begin.

# Summary {- .front-matter data-running-title='Summary'}

Microorganisms drive most of the chemical transformations crucial to sustaining life on Earth. Their ability to inhabit almost every environmental niche proves they possess an incredible diversity of physiological capabilities. However, little is known about the majority of the millions of microbial species that are predicted to exists, given that we are able to grow only an estimated 1% of these organisms under lab conditions. The emerging disciplines of metagenomics and metaproteomics take advantage of the current generation of sequencing technologies to recover genetic material and active proteins directly from environmental samples. These new approaches provide us with a “new kind of microscope” that is revolutionizing our understanding of the diversity and ecology of environmental communities. However, the computational and statistical tools to analyze metagenomics and metaproteomics data are clearly lagging behind the developments in sequencing technology.

In this thesis, we present an online web portal called Unipept that combines advanced algorithms, novel statistical methods and interactive visualizations for the analysis of metagenomics and metaproteomics data sets. It will equip the new microscope with more powerful lenses, enabling researchers to better zoom in on who is living in complex environmental communities, what they are doing there and how they are doing it.

The first introductory chapter is aimed at bringing computer scientists up to speed with the necessary biochemical and (micro)biological background. Next, we present the Unipept web application as a tool for the diversity analysis of complex metaproteome samples. Chapter 3 builds on that by introducing two new ways to access the analysis tools offered by Unipept: a web-based API and a set of command line tools.

Chapter 4 covers the peptidome analysis part of the Unipept ecosystem. The Unique Peptide Finder is introduced as a new way to discover unique peptides that can be used as biomarkers in targeted metaproteomics, while Peptidome Clustering can be used to investigate the relatedness of organisms. These two tools are built on the same foundations using advanced JavaScript features to offer interactive visualizations and high-performance client-side calculations.

Chapter 5 tells the story of Unipept from a computer scientist's point of view. The chapter reconstructs the development timeline of Unipept including the technical design choices and failed experiments.

The last chapter explores ongoing and potential future extensions to Unipept, including a new metagenomics pipeline, the addition of functional analysis features, and additions to the Unique Peptide Finder.

# Samenvatting {- .front-matter data-running-title='Samenvatting'}

Micro-organismen zijn verantwoordelijk voor de meeste chemische transformaties die cruciaal zijn voor het behoud van het leven op Aarde. Hun vermogen om op bijna elke plaats op Aarde, hoe extreem ook, aanwezig te zijn, bewijst dat ze een ongelooflijke diversiteit aan fysiologische mogelijkheden bezitten. Er is echter weinig bekend over de meerderheid van de miljoenen soorten bacteriën die verondersteld worden te bestaan. We zijn namelijk in staat om naar schatting slechts 1% van alle bestaande bacteriën te kweken in laboratoriumomstandigheden. De opkomende metagenomics en metaproteomics disciplines kunnen gebruik maken van de huidige generatie sequeneringstechnologie om genetisch materiaal en actieve eiwitten rechtstreeks te bepalen vanuit omgevingsstalen. Deze nieuwe benaderingen bieden ons een "nieuw soort microscoop" die een revolutie teweeg brengt in ons inzicht in de diversiteit en ecologie van microbiële ecosystemen. De computationele en statistische tools om de grote hoeveelheden metagenomics en metaproteomics gegevens te analyseren blijven echter duidelijk achter op de snelle ontwikkelingen op vlak van sequeneringstechnologie.

In deze thesis stellen we de webapplicatie Unipept voor. Deze applicatie combineert geavanceerde algoritmen, nieuwe statistische methoden en interactieve visualisaties om metagenomics en metaproteomics data te analyseren. Unipept rust onze figuurlijke microscoop uit met nieuwe krachtige lenzen die onderzoekers toelaten om dieper in te zoomen op welke organismen aanwezig zijn in complexe ecosystemen, wat ze er doen en hoe ze dat doen.

Het eerste inleidende hoofdstuk probeert om informatici de nodige biochemische en (micro)biologische kennis bij te brengen om de rest van het onderzoek te begrijpen. Vervolgens introduceren we Unipept als een tool om de biodiversiteit van complexe omgevingsstalen te analyseren. Het derde hoofdstuk bouwt hierop verder door twee alternatieve manieren voor te stellen om toegang te krijgen tot de analyseresultaten van Unipept: een API en een commandolijntoepassing.

Hoofdstuk 4 behandelt het peptidoomanalyseluik van Unipept. De *Unique Peptide Finder* is een nieuwe manier om unieke peptiden te ontdekken die kunnen gebruikt worden als biomerkers in *targeted* metaproteomics. De *Peptidome Clustering* toepassing kan gebruikt worden om de verwantschap tussen organismen te onderzoeken. Deze twee toepassingen gebruiken een gemeenschappelijke technische basis die steunt op geavanceerde JavaScript functies die een performante toepassing met interactieve visualisaties toelaten.

Hoofdstuk 5 vertelt het verhaal van Unipept vanuit het standpunt van een informaticus. Dit hoofdstuk reconstrueert de geschiedenis van de ontwikkeling van Unipept met aandacht voor de technische keuzes en mislukte expe&shy;ri&shy;men&shy;ten.

Het laatste hoofdstuk beschrijft toekomstige uitbreidingen van Unipept. Voorbeelden hiervan zijn een nieuwe pipeline om metagenomics data te verwerken, de mogelijkheid om naast de biodiversiteit ook de functies van de eiwitten in kaart te brengen en enkele uitbreidingen op de *Unique Peptide Finder*.

# List of publications {- .front-matter data-running-title='List of publications'}

Tsilia, Varvara, Bart Devreese, Ilse De Baenst, **Bart Mesuere**, Andreja Rajkovic, Mieke Uyttendaele, Tom Van De Wiele, and Marc Heyndrickx. 2012. “Application of MALDI-TOF mass spectrometry for the detection of enterotoxins produced by pathogenic strains of the Bacillus cereus group.” *Analytical and Bioanalytical Chemistry* 404 (6-7): 1691–1702.<span class="hidden">@Tsilia2012</span>

**Mesuere, Bart**, Bart Devreese, Griet Debyser, Maarten Aerts, Peter Vandamme, and Peter Dawyndt. 2012. “Unipept: Tryptic peptide-based biodiversity analysis of metaproteome samples.” *Journal of Proteome Research* 11 (12): 5773–80. <span class="hidden">@Mesuere2012</span>

**Mesuere, Bart**, Griet Debyser, Maarten Aerts, Bart Devreese, Peter Vandamme, and Peter Dawyndt. 2015. “The Unipept metaproteomics analysis pipeline.” *Proteomics* 15 (8): 1437–42. <span class="hidden">@Mesuere2015</span>

Debyser, Griet, **Bart Mesuere**, Lieven Clement, Jens Van de Weygaert, Pieter Van Hecke, Gwen Duytschaever, Maarten Aerts, Peter Dawyndt, Kris De Boeck, Peter Vandamme, and Bart Devreese. 2015. “Faecal proteomics: A tool to investigate dysbiosis and inflammation in patients with cystic fibrosis.” *Journal of Cystic Fibrosis* 15 (2): 242–50. <span class="hidden">@debyser2015</span>

**Mesuere, Bart**, Toon Willems, Felix Van der Jeugt, Bart Devreese, Peter Vandamme, and Peter Dawyndt. 2016. “Unipept web services for metaproteomics analysis.” *Bioinformatics* (in press). <span class="hidden">@Mesuere2016</span>
