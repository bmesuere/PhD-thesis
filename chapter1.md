# Proteomics for computer scientists {.chapter .content-start  data-running-title='Proteomics for computer scientists'}

Biology can be a daunting subject for computer scientists. As people who are used to everything being deterministic and logical, the real world can be disappointingly unpredictable. Biological lingo and jargon can also be a real barrier in the communication between computer scientists and biologists. This chapters aims to be a gentle introduction in the (micro)biology and biochemistry that is needed to understand this thesis.

## Life on Earth{data-running-title='Life on Earth'}

A good starting point to explain what life is, would be to start with its origin. Unfortunately, this origin of life is not something we know for sure. The origin of life is an active research area that tries to form hypothesis that take into account the biological, chemical as well as geophysical aspects.

##### Spontaneous generation
Before the nineteenth century, it was generally believed that life could generate spontaneously out of non-living matter [@Balme1962].<span class="aside">This theory is known as *spontaneous generation*.</span> Maggots, for example, could arise from dead flesh and crocodiles could form from logs rotting at the bottom of a pond according to the Greek philosopher Aristotle. During the seventeenth century, it gradually became clear that this belief was false and the theory that each living organism comes from a pre-existing living organism was adopted for visible organisms.

At the time, there was a strong suspicion of the existence of organisms that aren't visible to the naked eye. In 1676, Antoni van Leeuwenhoek was the first to observe these microorganisms using a self-made microscope (@Fig:ch1fig5; @Gest2004). The origin of these organisms was not clear and it wasn't until 1859, when Louis Pasteur did a series of famous experiments (@Fig:ch1fig6) that proved that microbial life couldn't spontaneously originate from a sterile nutrient broth, that the theory of spontaneous generation was refuted [@Schwartz2001].

![Drawing from 1756 by English naturalist Henry Baker of microscopes owned by Antoni van Leeuwenhoek.](images/ch1fig5.jpg){#fig:ch1fig5}

With spontaneous generation off the table, it took several years before a new theory was formulated. In 1924, Alexander Oparin speculated that the presence of oxygen in the atmosphere prevents the formation of the organic molecules that serve as building blocks for the evolution of life. This led Oparin to conclude that although spontaneous generation is not possible under the current circumstances, it did occur at least once a very long time ago when atmospheric oxygen was sparse. He argued that in an oxygenless environment, a mix of organic compounds could indeed form by means of sunlight. These molecules could then cluster into more complex droplets by merging and splitting. This led to a sort of basic chemical evolutionary pressure that favors integrity [@Oparin1953]. Even today, Oparin's theory is still used as a starting point for many origin of life theories.

![Schematic of the experimental setup used by Louis Pasteur in his experiments on alleged spontaneous generation as published in *Mémoire sur les corpuscules organisés qui existent dans l'atmosphère: examen de la doctrine des générations spontanées* [@Pasteur1862].](images/ch1fig6.jpg){#fig:ch1fig6}

##### Evolutionary timeline
To better understand its origin, it is worth taking a look at the oldest known life forms. One of the earliest evidences of life is found in the form of stromatolites [@Garwood2012].<span class="aside">Stromatolite literally means *layered rock*.</span> Stromatolites are solid, rock-like structures that are formed by cyanobacteria, a type of aquatic bacteria that obtains energy through photosynthesis. Cyanobacteria can form colonies and capture sediments using a sticky, mucus-like surface layer. These sediments can react with water to form a thin layer of limestone. Over time, the limestone accumulates and forms a stromatolite [@Riding1999]. The earliest of these geological formations that contain fossilized cyanobacteria date to over 3.5 billion years ago [@Schopf2002]. At that time, there was almost no free oxygen in Earth's atmosphere. By producing oxygen as a byproduct of converting carbon dioxide and water into sugar during photosynthesis, Cyanobacteria contributed significantly to the oxygenation of the atmosphere. This led to the Great Oxygenation Event some 2.5 billion years ago [@Flannery2012].

1.8 billion years ago, the first eukaryotic cells start to appear [@Knoll2006]. These are still unicellular organisms, but unlike prokaryotes, they contain cell organelles (such as a nucleus and mitochondria) enclosed by membranes. These organisms probably originated from several prokaryotic cells engulfing each other. Until now, the reproduction of eukaryotic organisms happened asexually through mitosis in which a cell divides into two genetically identical cells. Around 1.2 billion years ago, eukaryotic cells started to also reproduce sexually through meiosis [@Bernstein2012]. In meiosis, cell division produces daughter cells each containing half the genetic material of the parent cell. Two of these haploid cells can then fuse to create a new cell that contains the combined genetic material (@Fig:ch1fig8).

According to @Butterfield2000, sexual reproduction was critical for the success of the eukaryotes because it allowed for complex multicellularity. The first multicellular organism is believed to have originated more then 800 million years ago. 50 million years later, the first protozoa emerged, a group of unicellular eukaryotic organisms that exhibit advanced behavior such as motility and predation.

![Comparison between the different cell reproduction strategies. Binary fission is used by all prokaryotes and results into two identical parts. Mitosis and meiosis are cell division techniques used by eukaryotes with mitosis producing identical diploid cells and meiosis produces haploid cells. Image by the CK-12 Foundation under the CC BY-NC 3.0 license.](images/ch1fig8.png){#fig:ch1fig8}

An interesting side effect of the rising atmospheric oxygen levels, is that high in the atmosphere, the oxygen molecules started interacting with each other under influence of the sun's ultraviolet (UV) radiation to form ozone molecules.  Around 600 million years ago, a thin layer of ozone had built up around the Earth, protecting it from irradiation by the sun's UV light. Until now, life was limited to water, but this reduced radiation allowed for the colonization of the land [@Battistuzzi2004].

The combination of these events led to a period of increased evolutionary speed known as the Cambrian explosion. Starting around 580 million years ago for a period of 70 to 80 million years, the rate of diversification accelerated significantly [@Marshall2006]. Most of the major animal phyla appeared during that period such as jellyfish, crustaceans, arachnids, worms, etc. This period of rapid evolution was followed by the nascence of the first vertebrates (485 million years ago), the first primitive plants (434 million years ago), the first spiders and scorpions (420 million years ago), the first tetrapod on land (395 million years ago) and the first dinosaurs (225 million years ago; @Lowe2013).

A<span class="aside">This event is known as the *Cretaceous-Paleogene extinction event*.</span> massive comet impact some 66 million years ago had catastrophic effects on life on Earth: over 75 percent of all existing animal species was wiped out including all non-avian dinosaurs [@Renne2013;@Jablonski1994]. The change in the environment and the eradication of many dominant groups let other organisms take their place. An example of this is the elimination of dinosaurs in favor of the mammals. One of these new type of mammals were the primates (60 million years ago) out of which the great apes (hominids; 18 million years ago) and eventually the humans (*Homo*; 2.5 million years ago) and modern humans (*Homo sapiens*; 250&thinsp;000 years ago) formed [@Goodman1998].

![Timeline showing the history of life on Earth.](images/ch1fig7.png){#fig:ch1fig7}

## Taxonomy {data-running-title='Taxonomy'}
Life on Earth is extremely varied, even more so than one would initially think. The group of beetles, for example, is incredibly diverse with over 400&thinsp;000 species and gigantic compared to the number of mammals of which only 5&thinsp;500 are known [@Hammond1992]. The number of described species easily exceeds 1 million and it is estimated that we have only managed to document a small fraction. Estimates for the total number of species range from 5 million to over 100 million. A recent statistical analysis estimates that the total number of non-bacterial species is 8.7 million [@Mora2011] with thousands of additional bacterial species.

Aristotle (384&ndash;322 BC) was one of the first to start naming and organizing living organisms [@Mayr1982]. He used a simple system with two groups: plants and animals. Organisms were put into classes based on their physical appearance and shape. This branch of science of naming and classifying organisms is called taxonomy and was relatively uneventful for the next 2000 years.

##### Linnaean taxonomy
It wasn't until Carl Linnaeus (1707&ndash;1778), that taxonomy broke new ground. With the publication of the *Systema Naturæ* [@Linnaeus1758], he introduced a standardized naming system for organisms. Next to a new naming system, he also introduced a new hierarchical classification system. In his taxonomy, there are three kingdoms (plants, animals and minerals) that are each divided into several classes [@Fig:ch1fig4]. These classes are then subdivided further in orders, families, genera and species, each having their own name. The name of a species consists of two parts of which the first part refers to the parent genus. Although his system had numerous flaws, *minerals* can hardly be called living organisms and his class of *vermes* was a grab bag of organisms fitting nowhere else, the basic ideas of the Linnaean system are still used in today's systems.

![The classification of animals in the classes of quadrupedia (mammals), aves (birds), amphibia (amphibians), pesces (fish), insecta (insects) and vermes ("animals of slow motion, soft substance, able to increase their bulk and restore parts which have been destroyed, extremely tenacious of life, and the inhabitants of moist places.") as described in the *Systema Naturæ* [@Linnaeus1758].](images/ch1fig4.png){#fig:ch1fig4}

##### Evolutionary taxonomy
Towards the end of the eighteenth century, the idea formed to translate the Linnaean taxonomy, a system that produced systematic lists, into a tree-like organization of plants and animals.<span class="aside">When we talk about ancestors in the rest of this thesis, such as in *Lowest Common Ancestor*, we mean a higher node in the taxonomy tree and not an evolutionary ancestor.</span> After the publication of Charles Darwin's theory of evolution in *On the Origin of Species* [@Darwin1859], it gradually became accepted that the classification should reflect Darwin's principle of common descent. The ensuing evolutionary taxonomy resulted in the generation of a tree of life that also included known fossil groups. The recent advent of DNA sequencing and analysis completed the transition from a taxonomy based entirely on morphology to one based on evolutionary history (phylogeny).

These recent advances don't mean that there is a single, official taxonomy containing all species. On the contrary, each domain has its own classification system. The Angiosperm Phylogeny Group III system [@Bremer2009], for example, is used for flowering plants and the List of Prokaryotic names with Standing in Nomenclature (LPSN) by Euzéby [@Euzeby1997] is the authority for prokaryotes. In our application, we don't wish to limit us to a single domain, which is why we use the NCBI Taxonomy database [@Federhen2012]. The NCBI Taxonomy is a nomenclature and classification repository that contains organism names and taxonomic lineages for all sequences in the databases of the International Nucleotide Sequence Database Collaboration (INSDC). Since the data used in our application also originates from INSDC databases, cross-references are ubiquitous.

## Molecular building blocks {data-running-title='Molecular building blocks'}
Although life on Earth is incredibly diverse, all organisms share fundamental molecular mechanisms. In almost all organisms, the basic unit of energy is adenosine triphosphate (ATP), structural and functional roles are fulfilled by proteins and DNA (and RNA) carries the genetic information. In this section, we will take a closer look at the latter two.

##### DNA
Deoxyribonucleic acid, or DNA, is a molecule that contains most of the genetic information that is needed for the development and functioning of all living organisms. The molecule is contained of a long chain of many nucleotides.<span class="aside">Each of our chromosomes is a single DNA molecule.</span> As can be seen in @Fig:ch1fig9, each nucleotide is composed of three main parts: a phosphate group, a 5-carbon sugar (deoxyribose) and one of four nitrogen-containing bases: adenine (A), thymine (T), cytosine (C) or guanine (G). Since the phosphate group and sugar are the same for every nucleotide, a DNA molecule can be described by the sequence of its bases.

![The structure of a DNA molecule. Two complementing strands form a double helix structure. Each nucleotide consists of a deoxyribose sugar and a phosphate group at the outside of the helix and a nitrogen-containing base at the inside. The two complementing bases are joined with hydrogen bonds. Image by the CK-12 Foundation under the CC BY-NC 3.0 license.](images/ch1fig9.png){#fig:ch1fig9}

In 1962, James Watson and Francis Crick (@Fig:ch1fig10) together with Maurice Wilkins won the Nobel Prize in Physiology or Medicine for their discovery of the molecular structure of DNA. Nine years before, they, together with Rosalind Franklin (@Fig:ch1fig11), determined that DNA is made of two strands of nucleotides that form a double helix [@Watson1953]. The nucleotides in the two-stranded spiral have their sugar and phosphate groups on the outside and their bases connecting on the inside. Not all bases can connect with each other: adenine always binds with thymine and cytosine always binds with guanine. This means that if one of the two strands is known, the complementary strand can be determined. For example, if the sequence of a strand contains <span class="sequence">acctgtc</span>, the complementary section will be <span class="sequence">tggacag</span>.

<p style="display:none" class='pre-small-image pre-ch1fig11'> </p> !["Photograph 51": X-ray diffraction image of crystallized DNA taken by Rosalind Franklin in 1953. The fuzzy X in the middle of the molecule indicates a helical structure.](images/ch1fig11.jpg){#fig:ch1fig11}

![James Watson and Francis Crick posing next to their double helix model in 1953. Photo taken by Antony Barrington Brown.](images/ch1fig10.jpg){#fig:ch1fig10}

In eukaryotes, such as humans, DNA occurs in linear chromosomes while in most prokaryotes, such as bacteria, DNA occurs in circular chromosomes. All the chromosomes in the cell of an organism make up its genome. The size of the genome varies enormously across the tree of life. Viruses, for example, typically have a genome size of a few thousand base pairs [@Fiers1976], the human genome has 3.2 billion base pairs spread across 46 chromosomes [@Venter2001] and some plants have a genome of over 150 billion base pairs [@Pellicer2010].

The genetic information itself is contained within genes. A gene is a part of the chromosome that encodes for a protein or a functional RNA. Not all of the DNA of an organism is part of a gene. In prokaryotes, 80-90% of the genome consists of coding DNA [@Koonin2010], but in eukaryotes this is many times lower. In humans, for example, over 98% of the genome is non-coding [@Elgar2008]. This non-coding DNA used to be called *junk DNA*, but recent research has shown that at least part of the non-coding DNA is biochemically active and performs regulatory functions [@Pennisi2012].

##### Gene expression
When a protein is made based on the information from a gene, we say that the gene is expressed. During the transcription phase of gene expression, a copy of the DNA sequence is made by RNA polymerase, creating messenger RNA. The protein-coding region of the messenger RNA is then translated into a protein (@Fig:ch1fig13).

Ribonucleic acid (RNA) and DNA are both nucleic acids and share a lot of properties. Both are assembled as a chain of nucleotides, but unlike DNA, RNA mostly occurs as a single-strand. They both have the same phosphate group, but differ in sugar component<span class="aside">As the name suggests, DNA uses deoxyribose, RNA uses ribose.</span> and possible bases. In DNA, the complementing base of adenine is thymine, whereas in RNA, it is uracil (U).

Many types of RNA exist<span class="aside">Other types include small nuclear RNA and small interfering RNA.</span> with the messenger RNA (mRNA), ribosomal RNA (rRNA) and transport RNA (tRNA) playing an important role in gene expression. The transcription phase starts by an RNA polymerase enzyme binding to the DNA molecule and opening up the double helix. The RNA polymerase then begins mRNA synthesis by matching bases that complement the DNA strand. If the DNA sequence is <span class="sequence">atccga</span>, for example, the resulting mRNA sequence will be <span class="sequence">uaggcu</span>. Once transcription is finished, the constructed mRNA is released in the cell.

![Overview of gene expression in prokaryotes. DNA is first transcribed to messenger RNA in the nucleus. After transport out of the nucleus, protein synthesis begins with the help of a ribosome and transport RNA by translating nucleotide triplets to amino acids.](images/ch1fig13.png){#fig:ch1fig13}

In the next phase, the mRNA binds to one of the ribosomes in the cell. A ribosome is a cell organelle that is responsible for translating the mRNA into a protein and consists of two subunits that are made from rRNA and proteins. The small subunit binds to the mRNA and reads the sequence. Each nucleotide triplet of the mRNA sequence is called a codon and can bind to a single type of transport RNA holding an amino acid. The large ribosomal subunit binds to the tRNA and connects the attached amino acid to the growing protein chain. The type of amino acid that is attached to the tRNA depends on the sequence of the codon binding site and is uniquely defined (@Fig:ch1fig12). This way, once the mRNA is bound to the ribosome, there is only a single protein translation possible.

##### Proteins
Proteins are large molecules that perform many different functions in living organisms. They can serve as enzyme, have a structural function or even transport other molecules. As mentioned in the previous section, the building blocks of proteins are amino acids. There are 20 naturally occurring amino acids, each having a three-letter and a one-letter abbreviation (@Tbl:ch1tbl1). The one-letter abbreviations are also sometimes called the protein alphabet and are generally used to describe the sequence of the amino acids of a protein. Since proteins are formed by chains of amino acids, the order of them uniquely describes the protein. Shorter chains of amino acids are called peptides.

![RNA codon table showing the mapping from three-letter RNA codons to amino acids. For example, the RNA codon <span class="small-caps">aac</span> encodes the amino acid asparagine that is abbreviated as Asn or N. Different condons can result in the same amino acid, for example leucine has six possible codons, while tryptophan has only one.](images/ch1fig12.png){#fig:ch1fig12}

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | amino acid&nbsp;&nbsp;&nbsp; | long<br>abbreviation | short<br>abbreviation | average<br>molecular mass
:----- | :--------- | :------- | :------- | ---------------:
&nbsp; | Alanine | Ala | A | 89.09 Da
&nbsp; | Arginine | Arg | R | 174.20 Da
&nbsp; | Asparagine | Asn | N | 132.12 Da
&nbsp; | Aspartic acid | Asp | D | 133.10 Da
&nbsp; | Cysteine | Cys | C | 121.15 Da
&nbsp; | Glutamic acid | Glu | E | 147.13 Da
&nbsp; | Glutamine | Gln | Q | 146.15 Da
&nbsp; | Glycine | Gly | G | 75.07 Da
&nbsp; | Histidine | His | H | 155.16 Da
&nbsp; | Isoleucine | Ile | I | 131.17 Da
&nbsp; | Leucine | Leu | L | 131.17 Da
&nbsp; | Lysine | Lys | K | 146.19 Da
&nbsp; | Methionine | Met | M | 149.21 Da
&nbsp; | Phenylalanine | Phe | F | 165.19 Da
&nbsp; | Proline | Pro | P | 115.13 Da
&nbsp; | Serine | Ser | S | 105.09 Da
&nbsp; | Threonine | Thr | T | 119.12 Da
&nbsp; | Tryptophan | Trp | W | 204.23 Da
&nbsp; | Tyrosine | Tyr | Y | 181.19 Da
&nbsp; | Valine | Val | V | 117.15 Da

: Overview of all naturally occurring amino acids with long abbreviation, short abbreviation and molecular weight. Notice that leucine and isoleucine have the same weight. {#tbl:ch1tbl1}


## Metaproteomics {data-running-title='Metaproteomics'}

- proteomics is the study of proteomes
- the complete set of proteins expressed by an organism is called a proteome
- multiple methods: antibodies and with mass spectrometers, will focus on the last

##### Mass spectrometry
- 3 steps
  - ionisation (and fragmentation) (several techniques: electron spray, maldi)
  - "analysis" (find correct word for this) using a magnetic field that separates the ionized fragmentation (several techniques?)
  - detection (several techniques: TOF, find other technique)
- add image to explain this
- results is m/z spectra (add image)

##### Proteomics
- in normal proteomics, 2 main ways to do things: top down and bottom up
- first separate the proteins using liquid chromatrography (? gels?)
- then add trypsin (add image for tryptic digest?)
- put them in mass spec
- optain many spectra
- add image. maybe  https://en.wikipedia.org/wiki/File:Mass_spectrometry_protocol.png
- look up: is tandem MS also used in normal proteomics?
- 2 ways to identify peptides: de novo, using search engine. Mention mascot, sequest,... Mention UniProt! -> move to separate section?


##### Metaproteomics
- in metaproteomics, we study all proteins of a single environmental sample. Examples are soil, marine, gut,...
- more complex, also called shotgun metaproteomics (look up: are there other kinds of metaproteomics?) "Characterization of protein mixtures using HPLC/MS is also called shotgun proteomics"
- different experimental procedure
  - first add trypsin
  - separate peptides using LC step (for example HPLC)
  - using tandem mass spec to generate spectra. The first MS step doesn't fragment the peptides and only separates them, the second step fragments the peptides.
- add image that shows the procedure

![Shotgun metaproteomics approach used to identify microbial proteins in human faecal samples. Taken from @Verberkmoes2009.](images/ch1fig3.jpg){#fig:ch1fig3}

========


- top down & bottom up -> bottom up: "The proteins may first be purified by a method such as gel electrophoresis resulting in one or a few proteins in each proteolytic digest. Alternatively, the crude protein extract is digested directly, followed by one or more dimensions of separation of the peptides by liquid chromatography coupled to mass spectrometry, a technique known as shotgun proteomics.[3][4] By comparing the masses of the proteolytic peptides or their tandem mass spectra with those predicted from a sequence database or annotated peptide spectral in a peptide spectral library, peptides can be identified and multiple peptide identifications assembled into a protein identification."


Because most proteins are simply too large to be analyzed using a mass spectrometer, they are usually cleaved into smaller peptides before the actual MS analysis takes place. In practice, most proteomics studies achieve such a cleavage by adding trypsin to a protein sample. Trypsin is a serine protease found in the digestive system of humans and many other vertebrates, where it helps to digest food proteins. The enzyme has a very specific function — it only cleaves peptide chains at the carboxyl side of the amino acids lysine (represented by the letter `K`) or arginine (represented by the letter `R`). As a result, it is commonly used in biological research during proteomics experiments to digest proteins into peptides for mass spectrometry analysis, e.g., in-gel digestion.

High-performance liquid chromatography (HPLC) is a chromatographic technique used to separate the components in a mixture, to identify each component, and to quantify each component. When combined with shotgun tandem mass spectrometric methods, the active proteins within a biological sample may be determined. A trypsin digest is used to cleave the proteins in a sample downstream to every `K` (lysine) or `R` (arginine), except when followed by `P` (proline). The individual components that result after the cleavage step are called tryptic peptides. The amino acid sequence of these tryptic peptides may then be determined by means of mass spectrometry. However, most devices have a detection limit that only allows to determine the amino acid sequence of peptides having a length between 5 and 50 amino acids ([@Fig:ch1fig1]).

![Tryptic digestion is a necessary step in protein absorption as proteins are generally too large to be absorbed through the lining of the small intestine. Trypsin predominantly cleaves proteins at the carboxyl side (or "C-terminal side") of the amino acids lysine (`K`) and arginine (`R`) except when either is bound to a C-terminal proline (`P`).](images/ch1fig1.png){#fig:ch1fig1}

By searching for all proteins that contain a particular tryptic peptide that was sequenced from an environmental sample, we can get insight into the biodiversity and functionality of the biological sample. The Unipept web application supports biodiversity analysis of large and complex metaproteome samples using tryptic peptide information obtained from shotgun MS/MS experiments. Its underlying index structure is designed to quickly retrieve all occurrences of a tryptic peptide in UniProt entries.


## Unipept {data-running-title='Unipept'}
This section should cover:

* What we did and why we did it
* Overview of the chapters

Inspiration from:

* layman’s summary FWO

Over the period of evolution, we human beings have co-evolved an intricate symbiosis with microorganisms that inhabit our gastrointestinal tract. These microorganisms are responsible for maintaining a healthy gut environment, they aid in digestion of our food and our immune system and they guard us against invading pathogens. In addition, some diseases, such as Crohn's disease, are somehow correlated to the composition of the gut microbiota. Although we are dependent on microorganisms for normal gut functioning, much remains to be learned about microbial processes in the gut that are carried out by this huge community of largely unexplored microbial cells that can amount to numbers as great as 10<sup>11</sup> per gram of faeces.

Recently, we have been aided by the development of molecular tools that enable us to determine the composition of microorganisms inhabiting the intestine without having to cultivate them. In addition to the increasing amounts of information about the identities of microorganisms in the gut from our own studies and others, there have been a limited number of studies of the functional genes in the entire gut microbial metagenome, using sequencing based metagenomics approaches.

A next step is to determine what genes are actually expressed and the function of the gut microbiota in different states of health and disease. Shotgun proteomics (@Fig:ch1fig3) is one approach that can be used to determine what proteins were expressed in an environmental sample. As of today, this technique is still in its infancy, but given the rapid technological developments and based on the results of the first analyses, we can nevertheless consider this to be a very promising technique.

Microorganisms drive most of the chemical transformations crucial to sustaining life on Earth. Their ability to inhabit almost every environmental niche proves they possess an incredible diversity of physiological capabilities. However, little is known about the majority of the millions of microbial species that are predicted to exists, given that we are able to grow only an estimated 1% of these organisms under lab conditions. The emerging disciplines of metagenomics and metaproteomics take advantage of the current generation of sequencing technologies to recover genetic material and active proteins directly from environmental samples. These new approaches provide us with a “new kind of microscope” that is revolutionizing our understanding of the diversity and ecology of environmental communities. However, the computational and statistical tools to analyze metagenomics and metaproteomics data are clearly lagging behind the developments in sequencing technology. To counter this, researchers at Ghent University are developing an online web portal called Unipept that combines advanced algorithms, novel statistical methods and interactive visualizations for the analysis of metagenomics and metaproteomics data sets. It will equip the new microscope with more powerful lenses, enabling researchers to better zoom in on who is living in complex environmental communities, what they are doing there and how they are doing it. To validate that Unipept has important applications across the fields of environmental, clinical and evolutionary microbiology, it is used to study shifts in the gut microbiota of patients suffering from cystic fibrosis (also known as mucovisidosis), the most common genetic disease in people from Caucasian origin that mostly affects the lungs and for which no cure exists today.

<span class="todo">something about:

* CF?
* metagenomics?
</span>
