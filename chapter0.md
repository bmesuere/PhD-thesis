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
# Summary {- .front-matter data-running-title='Summary'}

Over the period of evolution, we human beings have coevolved an intricate symbiosis with microorganisms that inhabit our gastrointestinal tract. These microorganisms are responsible for maintaining a healthy gut environment, they aid in digestion of our food and our immune system and they guard us against invading pathogens. In addition, some diseases, such as Crohn's disease, are somehow correlated to the composition of the gut microbiota. Although we are dependent on microorganisms for normal gut functioning, much remains to be learned about microbial processes in the gut that are carried out by this huge community of largely unexplored microbial cells that can amount to numbers as great as 10<sup>11</sup> per gram of faeces.

Recently, we have been aided by the development of molecular tools that enable us to determine the composition of microorganisms inhabiting the intestine without having to cultivate them. In addition to the increasing amounts of information about the identities of microorganisms in the gut from our own studies and others, there have been a limited number of studies of the functional genes in the entire gut microbial metagenome, using sequencing based metagenomics approaches.

A next step is to determine what genes are actually expressed and the function of the gut microbiota in different states of health and disease. Shotgun metaproteomics is one approach that can be used to determine what proteins were expressed in an environmental sample. As of today, this technique is still in its infancy, but given the rapid technological developments and based on the results of the first analyses, we can nevertheless consider this to be a very promising technique.

Microorganisms drive most of the chemical transformations crucial to sustaining life on Earth. Their ability to inhabit almost every environmental niche proves they possess an incredible diversity of physiological capabilities. However, little is known about the majority of the millions of microbial species that are predicted to exists, given that we are able to grow only an estimated 1% of these organisms under lab conditions. The emerging disciplines of metagenomics and metaproteomics take advantage of the current generation of sequencing technologies to recover genetic material and active proteins directly from environmental samples. These new approaches provide us with a “new kind of microscope” that is revolutionizing our understanding of the diversity and ecology of environmental communities. However, the computational and statistical tools to analyze metagenomics and metaproteomics data are clearly lagging behind the developments in sequencing technology.

In this thesis, we present an online web portal called Unipept that combines advanced algorithms, novel statistical methods and interactive visualizations for the analysis of metagenomics and metaproteomics data sets. It will equip the new microscope with more powerful lenses, enabling researchers to better zoom in on who is living in complex environmental communities, what they are doing there and how they are doing it.

The first introductory chapter is aimed at bringing computer scientists up to speed with the necessary biochemical and (micro)biological background. Next, we present the Unipept web application as a tool for the diversity analysis of complex metaproteome samples. Chapter 3 builds on that by introducing two new ways to access the analysis tools offered by Unipept: a web-based API and a set of command line tools.

Chapter 4 covers the peptidome analysis part of the Unipept ecosystem. The Unique Peptide Finder is introduced as a new way to discover unique peptides that can be used as biomarkers in targeted metaproteomics, while Peptidome Clustering can be used to investigate the relatedness of organisms. These two tools are built on the same foundations using advanced JavaScript features to offer interactive visualizations and high-performance client-side calculations.

Chapter 5 tells the story of Unipept from a computer scientist's point of view. The chapter reconstructs the development timeline of Unipept including the technical design choices and failed experiments.

The last chapter explores ongoing and potential future extensions to Unipept, including a new metagenomics pipeline, the addition of functional analysis features, and additions to the Unique Peptide Finder.

# Samenvatting {- .front-matter data-running-title='Samenvatting'}

In de loop der tijd zijn wij, mensen, samen met de micro-organismen die ons maag-darmkanaal bewonen, geëvolueerd naar een ingewikkelde symbiose. Deze micro-organismen zijn verantwoordelijk voor het handhaven van een gezonde darmomgeving. Ze helpen bij de vertering van ons voedsel en helpen ons immuunsysteem om ons te beschermen tegen ziekteverwekkers. Bovendien zijn sommige ziekten, zoals de ziekte van Crohn, op een of andere manier gecorreleerd aan de samenstelling van de darmflora. Hoewel we afhankelijk zijn van micro-organismen voor een normale darmfunctie, kan er nog veel geleerd worden over de microbiële processen die in onze darmen plaatsvinden.

Recent ontwikkelde moleculaire technieken laten toe om de samenstelling van de micro-organismen die onze darmen bevolken te bepalen, zonder ze te hoeven kweken in een labo. Naast de toenemende hoeveelheid aan gegevens over de identiteit van micro-organismen in de menselijke darm, zijn er eveneens een beperkt aantal studies die de genen van het humane metagenoom in kaart brengen.

Een volgende stap is het bepalen van welke genen daad&shy;werkelijk tot expressie komen en waarin de functie van de darmflora verschilt in gezonde en zieke toestand. Een techniek die hiervoor gebruikt kan worden is shotgun metaproteomics. Alhoewel deze techniek vandaag de dag nog in zijn kinderschoenen staat, lijken de eerste resultaten veelbelovend.

Micro-organismen zijn verantwoordelijk voor de meeste chemische transformaties die cruciaal zijn voor het behoud van het leven op Aarde. Hun vermogen om op bijna elke plaats op Aarde, hoe extreem ook, aanwezig te zijn, bewijst dat ze een ongelooflijke diversiteit aan fysiologische mogelijkheden bezitten. Er is echter weinig bekend over de meerderheid van de miljoenen soorten bacteriën die verondersteld worden te bestaan. We zijn namelijk in staat om naar schatting slechts 1% van alle bacteriën te kweken in laboratoriumomstandigheden. De opkomende metagenomics en metaproteomics disciplines kunnen gebruik maken van de huidige generatie sequeneringstechnologie om genetisch materiaal en actieve eiwitten rechtstreeks te bepalen vanuit omgevingsstalen. Deze nieuwe benaderingen bieden ons een "nieuw soort microscoop" die een revolutie teweeg brengt in ons inzicht in de diversiteit en ecologie van microbiële ecosystemen. De computationele en statistische tools om de grote hoeveelheden metagenomics en metaproteomics gegevens te analyseren blijven echter duidelijk achter op de snelle ontwikkelingen op vlak van sequeneringstechnologie.

In deze thesis stellen we de webapplicatie Unipept voor. Deze applicatie combineert geavanceerde algoritmen, nieuwe statistische methoden en interactieve visualisaties om metagenomics en metaproteomics data te analyseren. Unipept rust onze figuurlijke microscoop uit met nieuwe krachtige lenzen die onderzoekers toelaten om dieper in te zoomen op welke organismen aanwezig zijn in complexe ecosystemen, wat ze er doen en hoe ze dat doen.

Het eerste inleidende hoofdstuk probeert om informatici de nodige biochemische en (micro)biologische kennis bij te brengen om de rest van het onderzoek te begrijpen. Vervolgens introduceren we Unipept als een tool om de biodiversiteit van complexe omgevingsstalen te analyseren. Het derde hoofdstuk bouwt hierop verder door twee alternatieve manieren voor te stellen om toegang te krijgen tot de analyseresultaten van Unipept: een API en een commandolijntoepassing.

Hoofdstuk 4 behandelt het peptidoomanalyse luik van Unipept. De *Unique Peptide Finder* is een nieuwe manier om unieke peptiden te ontdekken die kunnen gebruikt worden als biomerkers in *targeted* metaproteomics. De *Peptidome Clustering* toepassing kan gebruikt worden om het verwantschap tussen organismen te onderzoeken. Deze twee toepassingen gebruiken een gemeenschappelijke technische basis die steunt op geavanceerde JavaScript functies die een performante toepassing met interactieve visualisaties toelaten.

Hoofdstuk 5 vertelt het verhaal van Unipept vanuit het standpunt van een informaticus. Dit hoofdstuk reconstrueert de geschiedenis van de ontwikkeling van Unipept met aandacht voor de technische keuzes en mislukte experimenten.

Het laatste hoofdstuk beschrijft toekomstige uitbreidingen van Unipept. Voorbeelden hiervan zijn een nieuwe pipeline om metagenomics data te verwerken, de mogelijkheid om naast de biodiversiteit ook de functies van de eiwitten in kaart te brengen en enkele uitbreidingen op de *Unique Peptide Finder*.

# List of publications {- .front-matter data-running-title='List of publications'}

Tsilia, Varvara, Bart Devreese, Ilse De Baenst, **Bart Mesuere**, Andreja Rajkovic, Mieke Uyttendaele, Tom Van De Wiele, and Marc Heyndrickx. 2012. “Application of MALDI-TOF mass spectrometry for the detection of enterotoxins produced by pathogenic strains of the Bacillus cereus group.” *Analytical and Bioanalytical Chemistry* 404 (6-7): 1691–1702.<span class="hidden">@Tsilia2012</span>

**Mesuere, Bart**, Bart Devreese, Griet Debyser, Maarten Aerts, Peter Vandamme, and Peter Dawyndt. 2012. “Unipept: Tryptic peptide-based biodiversity analysis of metaproteome samples.” *Journal of Proteome Research* 11 (12): 5773–80. <span class="hidden">@Mesuere2012</span>

**Mesuere, Bart**, Griet Debyser, Maarten Aerts, Bart Devreese, Peter Vandamme, and Peter Dawyndt. 2015. “The Unipept metaproteomics analysis pipeline.” *Proteomics* 15 (8): 1437–42. <span class="hidden">@Mesuere2015</span>

Debyser, Griet, **Bart Mesuere**, Lieven Clement, Jens Van de Weygaert, Pieter Van Hecke, Gwen Duytschaever, Maarten Aerts, Peter Dawyndt, Kris De Boeck, Peter Vandamme, and Bart Devreese. 2015. “Faecal proteomics: A tool to investigate dysbiosis and inflammation in patients with cystic fibrosis.” *Journal of Cystic Fibrosis*. <span class="hidden">@debyser2015</span>

**Mesuere, Bart**, Toon Willems, Felix Van der Jeugt, Bart Devreese, Peter Vandamme, and Peter Dawyndt. 2016. “Unipept web services for metaproteomics analysis.” *Bioinformatics*. <span class="hidden">@Mesuere2016</span>
