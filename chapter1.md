# Proteomics for computer scientists {.chapter .content-start  data-running-title='Proteomics for computer scientists'}

Biology can be a daunting subject for computer scientists. As people who are used to everything being deterministic and logical, the real world can be disappointingly unpredictable. Biological lingo and jargon can also be a real barrier in the communication between computer scientists and biologists. This chapters aims to be a gentle introduction in the (micro)biology and biochemistry that is needed to understand this thesis.

## Life {data-running-title='Life'}

### The origin of life
A good starting point to explain what life is, would be to start with its origin. Unfortunately, this origin of life is not something we know for sure. The origin of life of an active research area that tries to form hypothesis that take into account the biological, chemical as well as geophysical aspects.

##### Spontaneous generation
Before the nineteenth century, it was generally believed that life could generate spontaneously out of non-living matter [@Balme1962].<span class="aside">This theory is known as *spontaneous generation*.</span> Maggots, for example, could arise from dead flesh and crocodiles could form  from logs rotting at the bottom of a pond according to the Greek philosopher Aristotle. During the seventeenth century, it gradually became clear that this belief was false and the theory that each living organism comes from a pre-existing living organism was adopted for visible organisms.

At the time, there was a strong suspicion of the existence of organisms that aren't visible to the naked eye. In 1676, Antoni van Leeuwenhoek was the first to observe these microorganisms using a self-made microscope [@Gest2004]. The origin of these organisms were not clear and it wasn't until 1859, when Louis Pasteur did a series of famous experiments that proved that microbial life couldn't spontaneously originate from a sterile nutrient broth, that the theory of spontaneous generation was refuted [@Schwartz2001].

With spontaneous generation off the table, it took several years before a new theory was formulated. In 1924, Alexander Oparin speculated that the presence of oxygen in the atmosphere prevents the formation of the organic molecules that serve as building blocks for the evolution of life. This led Oparin to conclude that although spontaneous generation is not possible under the current circumstances, it did occur at least once a very long time ago when atmospheric oxygen was sparse. He argued that in an oxygenless environment, a mix of organic compounds could indeed form by means of sunlight. These molecules could then cluster into more complex droplets and by merging and splitting, a sort of basic chemical evolutionary pressure that favors integrity emerges [@Oparin1953]. Even today, Oparin's theory is still used as a starting point for many origin of life theories.

##### Evolutionary timeline
To better understand its origin, it is worth taking a look at the oldest known life forms. One of the earliest evidences of life is found in the form of stromatolites [@Garwood2012].<span class="aside">Stromatolite literally means *layered rock*.</span> Stromatolites are solid, rock-like structures that are formed by cyanobacteria, a type of aquatic bacteria that obtains energy through photosynthesis. Cyanobacteria can form colonies and capture sediments using a sticky, mucus-like surface layer. These sediments can react with water to form a thin layer of limestone. Over time, the limestone accumulates and forms a stromatolite [@Riding1999]. The earliest of these geological formations that contain fossilized cyanobacteria date to over 3.5 billion years ago [@Schopf2002]. At that time, there was almost no free oxygen in earth's atmosphere. By producing oxygen as a byproduct of converting carbon dioxide and water into sugar during photosynthesis, Cyanobacteria contributed significantly to the oxygenation of the atmosphere. This led to the Great Oxygenation Event some 2.5 billion years ago [@Flannery2012].

1.8 billion years ago, the first eukaryotic cells start to appear [@Knoll2006]. These are still unicellular organisms, but unlike prokaryotes, they contain cell organelles (such as a nucleus and mitochondria) enclosed by membranes. These organisms probably originated from several prokaryotic cells engulfing each other. Until now, the reproduction of organisms happened asexually through mitosis in which a cell divides into two genetically identical cells. Around 1.2 billion years ago, Eukaryotic cell started to also reproduce sexually through meiosis [@Bernstein2012]. In meiosis, cell division produces daughter cells each containing half the genetic material of the parent cell. Two of these haploid cells can then fuse to create a new cell that contains the combined genetic material.

According to @Butterfield2000, sexual reproduction was critical for the success of the eukaryotes because it allowed for complex multicellularity. The first multicellular organism is believed to have originated more then 800 million years ago. 50 million years later, the first protozoa emerged, a group of unicellular eukaryotic organisms that exhibit advanced behavior such as motility and predation.

An interesting side effect of the rising atmospheric oxygen levels, is that high in the atmosphere, the oxygen molecules started interacting with each other under influence of the sun's ultraviolet (UV) radiation to form ozone molecules.  Around 600 million years ago, a thin layer of ozone had built up around the earth, protecting it from irradiation by the sun's UV light. Until now, life was limited to water, but this reduced radiation allowed for the colonization of the land [@Battistuzzi2004].

The combination of these events led to a period of increased evolutionary speed known as the Cambrian explosion. Starting around 580 million years ago for a period of 70 to 80 million years, the rate of diversification accelerated significantly [@Marshall2006]. Most of the major animal phyla appeared during that period such as fungi, sponges, corals, crustaceans, sea cucumbers, etc. This period of rapid evolution was followed by the nascency of the first vertebrates (485 million years ago), the first primitive plants (434 million years ago), the first spiders and scorpions (420 million years ago), the first tetrapod on land (395 million years ago) and the first dinosaurs (225 million years ago)[@Lowe2013].

A<span class="aside">This event is known as the *Cretaceous-Paleogene extinction event*.</span> massive comet impact some 66 million years ago had catastrophic effects on life on earth: over 75 percent of all existing animal species was wiped out including all non-avian dinosaurs [@Renne2013;@Jablonski1994]. The change in the environment and the eradication of many dominant groups let other organisms take their place. An example of this is the elimination of dinosaurs in favor of the mammals. One of these new type of mammals were the primates (60 million years ago) out of which the great apes (hominids; 18 million years ago) and eventually the humans (*Homo*; 2.5 million years ago) and modern humans (*Homo sapiens*; 250&thinsp;000 years ago) formed [@Goodman1998].

### Taxonomy
Life on earth is extremely varied, even more so that one would initially think. The group of beetles, for example, is incredibly diverse with over 400&thinsp;000 species and gigantic compared to the number of mammals of which only 5&thinsp;500 are known [@Hammond1992]. The number of described species easily exceeds 1 million and it is estimated that we have only managed to document a small fraction. Estimates for the total number of species range from 5 million to over 100 million. A recent statistical analysis estimates that the total number of non-bacterial species is 8.7 million [@Mora2011] with thousands of additional bacterial species.

Aristotle (384&ndash;322 BC) was one of the first to start naming and organizing living organisms [@Mayr1982]. He used a simple system with two groups: plants and animals. Organisms were put into classes based on their physical appearance and shape. This branch of science of naming and classifying organisms is called taxonomy and was relatively uneventful for the next 2000 years.

It wasn't until Carl Linnaeus (1707&ndash;1778), that taxonomy broke new ground. With the publication of the Systema Naturae [@Linnaeus1758], he introduced a standardized naming system for organisms. Next to a new naming system, he also introduced a new tree-like classification system. In his taxonomy, there are three kingdoms (plants, animals and minerals) that are each divided into several classes [@Fig:ch1fig4]. These classes are then subdivided further in orders, families, genera and species, each having their own name. The name of a species consists of two parts of which the first part refers to the parent genus. Although his system had numerous flaws, *minerals* can hardly be called living organisms and his class of *vermes* was a grab bag of organisms fitting nowhere else, the basic ideas of the Linnaean system are still used in today's systems.

![The classification of animals in the classes of mammals (quadrupedia), birds (aves), amphibians (amphibia), fish (pesces), insects (insecta) and vermes ("animals of slow motion, soft substance, able to increase their bulk and restore parts which have been destroyed, extremely tenacious of life, and the inhabitants of moist places.") as described in the Systema Naturae [@Linnaeus1758].](images/ch1fig4.png){#fig:ch1fig4}

##### evolution
- "With Darwin's theory, a general acceptance that classification should reflect the Darwinian principle of common descent quickly appeared. Tree of Life representations became popular in scientific works, with known fossil groups incorporated."
- "With the modern evolutionary synthesis of the early 1940s, an essentially modern understanding of evolution of the major groups was in place. The evolutionary taxonomy being based on Linnaean taxonomic ranks, the two terms are largely interchangeable in modern use."
- in recent years, reorganized based on gene analysis
- controversy and discussion
- dozens of levels
- common tree of descent is the basis for the taxonomy
- estimation of when 2 species diverged = last time they had a common ancestor
- the more similar, the more recent


- we use NCBI taxonomy (not best, but contains all kingdoms)

### DNA/RNA/proteins
- much variation in species
- at the core, very similar
- start from cell contents?

Since all know life forms on earth share common molecular mechanisms, this is a big indication that they all descend from a common ancestor. "Bacteria develop primitive forms of photosynthesis which at first did not produce oxygen.[25] These organisms generated Adenosine triphosphate by exploiting a proton gradient, a mechanism still used in virtually all organisms."

todo: revisit first section with information from hunter

## Proteomics {data-running-title='Proteomics'}
- definition

This section should cover:

* Basics on Proteomics including peptide identification
* Basics on metaproteomics

Inspiration from:

* TPA case study: basic proteomics and trypsin
* MPA case study: basic metaproteomics

Because most proteins are simply to large to be analyzed using a mass spectrometer, they are usually cleaved into smaller peptides before the actual MS analysis takes place. In practice, most proteomics studies achieve such a cleavage by adding trypsin to a protein sample. Trypsin is a serine protease found in the digestive system of humans and many other vertebrates, where it helps to digest food proteins. The enzyme has a very specific function — it only cleaves peptide chains at the carboxyl side of the amino acids lysine (represented by the letter `K`) or arginine (represented by the letter `R`). As a result, it is commonly used in biological research during proteomics experiments to digest proteins into peptides for mass spectrometry analysis, e.g., in-gel digestion.

High-performance liquid chromatography (HPLC) is a chromatographic technique used to separate the components in a mixture, to identify each component, and to quantify each component. When combined with shotgun tandem mass spectrometric methods, the active proteins within a biological sample may be determined. A trypsin digest is used to cleave the proteins in a sample downstream to every `K` (lysine) or `R` (arginine), except when followed by `P` (proline). The individual components that result after the cleavage step are called tryptic peptides. The amino acid sequence of these tryptic peptides may then be determined by means of mass spectrometry. However, most devices have a detection limit that only allows to determine the amino acid sequence of peptides having a length between 5 and 50 amino acids ([@Fig:ch1fig1]).

![Tryptic digestion is a necessary step in protein absorption as proteins are generally too large to be absorbed through the lining of the small intestine. Trypsin predominantly cleaves proteins at the carboxyl side (or "C-terminal side") of the amino acids lysine (`K`) and arginine (`R`) except when either is bound to a C-terminal proline (`P`).](images/ch1fig1.png){#fig:ch1fig1}

By searching for all proteins that contain a particular tryptic peptide that was sequenced from an environmental sample, we can get insight into the biodiversity and functionality of the biological sample. The Unipept web application supports biodiversity analysis of large and complex metaproteome samples using tryptic peptide information obtained from shotgun MS/MS experiments. Its underlying index structure is designed to quickly retrieve all occurrences of a tryptic peptide in UniProt entries.

![General outline of the Unipept workflow for taxonomic identification of tryptic peptides. For a given tryptic peptide, all UniProt entries having an exact match of the peptide in the protein sequence are found. Unipept then computes the lowest common ancestor (LCA) of the taxonomic annotations extracted from the matched UniProt entries, based on a cleaned up version of the NCBI Taxonomy. All intermediate results are shown for the sample tryptic peptide <span class="sequence">enfvy[il]ak</span> (isoleucine and leucine equated), leading to an LCA in the phylum Streptophyta. Arrows at the bottom show which processing steps are available as functions in the Unipept API and the Unipept CLI.](images/ch1fig2.png){#fig:ch1fig2}

Over the period of evolution, we human beings have co-evolved an intricate symbiosis with microorganisms that inhabit our gastrointestinal tract. These microorganisms are responsible for maintaining a healthy gut environment, they aid in digestion of our food and our immune system and they guard us against invading pathogens. In addition, some diseases, such as Crohn's disease, are somehow correlated to the composition of the gut microbiota. Although we are dependent on microorganisms for normal gut functioning, much remains to be learned about microbial processes in the gut that are carried out by this huge community of largely unexplored microbial cells that can amount to numbers as great as 10<sup>11</sup> per gram of faeces.

Recently, we have been aided by the development of molecular tools that enable us to determine the composition of microorganisms inhabiting the intestine without having to cultivate them. In addition to the increasing amounts of information about the identities of microorganisms in the gut from our own studies and others, there have been a limited number of studies of the functional genes in the entire gut microbial metagenome, using sequencing based metagenomics approaches.

A next step is to determine what genes are actually expressed and the function of the gut microbiota in different states of health and disease. Shotgun proteomics (@Fig:ch1fig3) is one approach that can be used to determine what proteins were expressed in an environmental sample. As of today, this technique is still in its infancy, but given the rapid technological developments and based on the results of the first analyses, we can nevertheless consider this to be a very promising technique.

![Shotgun metaproteomics approach used to identify microbial proteins in human faecal samples. Taken from @Verberkmoes2009.](images/ch1fig3.jpg){#fig:ch1fig3}


## Unipept {data-running-title='Unipept'}
This section should cover:

* What we did and why we did it
* Overview of the chapters

Inspiration from:

* layman’s summary FWO

Microorganisms drive most of the chemical transformations crucial to sustaining life on Earth. Their ability to inhabit almost every environmental niche proves they possess an incredible diversity of physiological capabilities. However, little is known about the majority of the millions of microbial species that are predicted to exists, given that we are able to grow only an estimated 1% of these organisms under lab conditions. The emerging disciplines of metagenomics and metaproteomics take advantage of the current generation of sequencing technologies to recover genetic material and active proteins directly from environmental samples. These new approaches provide us with a “new kind of microscope” that is revolutionizing our understanding of the diversity and ecology of environmental communities. However, the computational and statistical tools to analyze metagenomics and metaproteomics data are clearly lagging behind the developments in sequencing technology. To counter this, researchers at Ghent University are developing an online web portal called Unipept that combines advanced algorithms, novel statistical methods and interactive visualizations for the analysis of metagenomics and metaproteomics data sets. It will equip the new microscope with more powerful lenses, enabling researchers to better zoom in on who is living in complex environmental communities, what they are doing there and how they are doing it. To validate that Unipept has important applications across the fields of environmental, clinical and evolutionary microbiology, it is used to study shifts in the gut microbiota of patients suffering from cystic fibrosis (also known as mucovisidosis), the most common genetic disease in people from Caucasian origin that mostly affects the lungs and for which no cure exists today.

<span class="todo">something about:

* CF?
* metagenomics?
</span>
