# A short history of Unipept {.chapter data-running-title='A short history of Unipept'}

This chapter tells the story of Unipept from a developer's point of view. The first section deals with Unipept before it was a web application. Section two goes into detail about the individual versions of the Unipept web application. The last section handles the Unipept command line tools.

<div class="todo">
Find a place to talk about:

* development process
* github(\@UGent)
</div>

## Before the web application {data-running-title='Before the web application'}

The first attempt at creating a tool for peptide analysis was a stand-alone  application written in Java. The data source for this application was the set of  complete bacterial RefSeq genomes. After downloading all genbank files containing the protein sequences, the files were fed through a data processing pipeline. The processing consisted of performing an in-silico trypsin digest on the protein sequences and storing all peptides with a length between 8 and 50 amino acids.

Initially, the peptides were stored using a patricia trie. <span class="aside">Unlike in a normal trie, in a patricia trie, parent nodes having only a single child are collapsed into a single node. This reduces the size of the data structure, especially in sparse trees.</span> A trie, or prefix tree, is a data structure where an ordered tree is used to efficiently search for keys (in our case tryptic peptides) and retrieve the associated values (in our case taxon id's). While information retrieval is very fast, this approach has two major problems: the entire dataset must fit into memory and it's not trivial to store the data structure to disk. This means that all source data must be reprocessed every time the program is run.

Both problems were solved by storing the data in a MySQL database instead of a patricia trie. By default, MySQL uses the hard drive to store data and only uses memory for temporary tables and caches. This not only allowed us to process the source data once and have permanent access afterwards, but also enabled more flexible data access through the use of SQL queries. The downsides are slightly slower data access and fairly slower index construction.

At that time, there were 1190 complete bacterial RefSeq genomes spanning 860 species. Using the MySQL database, it took 21 hours to parse these genomes and create the index. This resulted in a database of 7 GB of which half was used for indexes. The database contained information on 34.4 million distinct peptides that each occurred in 1.57 genomes on average. 90.7% of all peptides only occurred within a single species, 5.8% occurred within two species.

<p style="display:none" class='pre-small-image image-screenshot'> </p> ![The initial PeptideInfo Java application, when searching for the peptide <span class='small-caps'>AAALAYAK</span>. The peptide was found in 3 of the 4 *Staphylococcus aureus* genomes and in a *Staphylococcus pasteuri* genome. Note that the database only contained a test set of 8 genomes at the moment of the screenshot.](images/ch6fig2.png){#fig:ch6fig2}

After creating a fast index mapping peptides on taxonomic nodes, there are two  research questions that emerge: in which species does a given peptide occur, and which peptides only occur within a given species. To answer the first question, a Java application with a graphical user interface was created.<span class="aside">This PeptideInfo application later evolved into the Unipept tryptic peptide analysis.</span> As shown in @Fig:ch6fig2, the user could enter a tryptic peptide in the text area, click the search button and a report was generated listing all species in which the peptide was found. The application also listed the number of genomes in which the peptide was found in case multiple genomes of a species were available.

The second question, which peptides can be used to uniquely identify a certain species, was harder to answer. The database was not optimized for this and the queries took too long to wrap everything into a desktop application.<span class="aside">A solution to this question was later provided by the Unipept unique peptide finder.</span> Instead, a collection of scripts and queries was created to explore the potential of the data. @Fig:ch6fig1 shows the promising results of such analysis on the available genomes of *Staphylococcus aureus* subsp. *aureus*, *Clostridium botulinum* and *Campylobacter*. These results show that there is a large number of species-specific peptides and a surprisingly low number of genus-specific peptides. This means that there is a great potential to use peptides as a way to identify organisms.

![A poster presenting the results of the precursor of Unipept at the 4th International Symposium on Proteome Analysis in Antwerp, Belgium in December 2010.](images/ch6fig1.png){#fig:ch6fig1}

## The Unipept web application {data-running-title='The Unipept web application'}

Each section covers a major or minor version of Unipept by first listing the changes introduced in that version by means of an extended changelog. Next, a few highlights are discussed in more detail.

### Unipept version 0.1 &ndash; 0.4

After creating a database-backed mapping from peptide sequences to organisms, the use of Java for the client application was reevaluated. The main advantages were familiarity with the programming language, good performance and, at least theoretically, cross-platformness.<span class="aside">Users would also have to set up a local database, still requiring platform-specific solutions.</span> This was offset by drawbacks such as the need for installation of the application, the difficulty to distribute updates and the need to run your own database as a user. Because the target audience of Unipept is non-technical users and we had an agile development style in mind, the disadvantages outweighed the benefits.

In the end, we chose to rebuild the client as a web application using the Ruby on Rails framework ([@Fig:ch6fig3]). The main reason for choosing for a web application was the low threshold for users to start using the application and the ease with which new versions can be deployed. This client-server architecture also completely shifts the technical burden away from the user. The choice for Ruby on Rails was a bit of a risk since we had no previous experience with it, but the framework looked promising and was becoming popular very fast.

<p style="display:none" class='image-screenshot'> </p> ![The homepage of version 0.1 of the Unipept web application.](images/ch6fig3.png){#fig:ch6fig3}

Unipept version 0.1 was a straightforward reimplementation of the existing PeptideInfo tool. As can be seen in @Fig:ch6fig4, the user could submit a tryptic peptide in a search form to which the application responded with an overview in which species the peptide was found. The only noteworthy change to the old application was the inclusion of not only the complete RefSeq genomes, but also the draft genomes.

<p style="display:none" class='image-screenshot'> </p> ![Web-based reimplementation of the PeptideInfo tool. The analysis for the peptide <span class='small-caps'>AAALAYAK</span> is shown.](images/ch6fig4.png){#fig:ch6fig4}

After reaching feature parity in version 0.1, work began on adding new features. Where the initial single peptide search only listed the species in which a peptide was found, version 0.2 introduced the concept of the lowest common ancestor (LCA).<span class="aside todo">The LCA is discussed in more detail in section ###.</span> To efficiently calculate the LCA, the complete lineage of every organism is needed. Until then, the hierarchical information of the taxonomy tree was not easily accessible. Each of the records in the taxonomy table represented a single taxonomic node containing, among other things, the taxon id of its parent. To retrieve all ancestors<span class="aside">With ancestor, we mean all parent nodes in the taxonomic tree, not evolutionary ancestors.</span> of a given organism, we needed to recursively query the database for the parent node until we reached the root. A solution to this problem was to calculate the lineage for each organism during database construction, and then store that path to root in a dedicated table. To accommodate for a variable number of ancestors, a fixed structure was used, using only the so called named ranks. This precalculated table containing the 28 possible ancestors for every organism made it possible to efficiently calculate LCAs.

0.2:

* multi search
* visualisations

Other topics:

* 0.3
* 0.4
* Switch from RefSeq genomes to UniProt

### Unipept version 1.0

#### D3.js?

### Unipept version 1.1 &ndash; 1.3

**1.1**

* new website design
* news box on home page
* performance improvement of the sunburst visualization in Firefox

**1.2**

> The focus of Unipept version 1.2 was on performance improvements. This results in massive improvements in page load time due to optimized queries and faster JSON generation.

**1.3**

* Switched to twitter bootstrap for the user interface
* Added full screen visualisations for supported browsers
* Visualisations can now be saved as images
* Updated to UniProt release 2012_07

#### Bootstrap

#### Saving images

#### Full screen

### Unipept version 1.4
+- 40 commits

* Added tryptic peptides with length between 5 and 8 to the database
* Added support for missed cleavages

#### Missed cleavages

### Unipept version 1.5
+- 200 commits

* Add support for PRIDE datasets
* Add dataset loading from url
* Add multi-peptide results download from the results page
* Add new layout for news page
* Fix layout issue with single peptide page

### Unipept version 2.0
+- 800 commits

* Add the unique peptide finder
* Add GO and EC cross references to database
* Invalidate "metagenome" NCBI taxa
* Tweak the lineage invalidation
* Code spring cleaning
* Rewrite of backend scripts
* Add search settings to the batch run script
* Switch from JS animations to CSS animations where possible
* Add a timeout before filtering the tree on the multi result page
* Fix bug when attempting to load a pride dataset without entering an id
* Fix bug where only 1 number was shown in the tree on the multi result page
* Fix bug where downloading results from results page didn't behave as expected
* Fix bug where the sizes of the slices in the sunburst were not correct
* Update bootstrap to 2.3.1
* Update rails to 3.2.13
* Update D3 to 3.3.8
* Update html2canvas to 0.4.1

#### Unique Peptide Finder

#### Code cleaning?

### Unipept version 2.1
+- 250 commits

* Minor redesign of most of the pages
* Add retina image assets
* Add CSV export for data in the unique peptides graph
* Add SVG export for the sunburst and unique peptides graphs
* Improve all file download flows
* Improve dragging performance on unique peptides graph
* Replace the tree on multi-peptides result page with own implementation
* Rewrite the complete pancore JavaScript code
* Remove new relic monitoring
* Remove Qbaka error handling
* Fix a bug where the download button stayed disabled after downloading the results on the multi-peptide page
* Fix a bug with using full screen mode on the unique peptide page
* Fix a bug where dragging a node triggered a popover in some browsers
* Update to Bootstrap 3.0.3
* Update to D3 3.3.10

#### JavaScript

### Unipept version 2.2

* Add peptidome similarity feature
* Add myGenomes feature to peptidome analysis
* Add full screen support for IE11
* Add links to the bioproject webpage in the peptide finder graph tooltips and genomes table
* Add an option to disable individual lines in the unique peptide finder by clicking on the legend labels
* Add an option to use fixed colors for the sunburst graph allowing to compare the results of multiple samples
* Add rails errors log via email
* Make most of the logging optional by using settings
* Improve the design of the genomes table
* Improve the loading of the unique sequences in the unique peptide finder
* Less clutter in the peptide finder graph by abbreviating names
* Fix a bug where the genome size was not shown by default
* Fix a bug causing the LCA to be root in some cases in the unique peptide finder
* Fix a bug where the custom drag cursor wasn't shown in Internet Explorer
* Fix a bug where matching children weren't shown while filtering on the multi peptides result page
* Fix a crash when trying to sort without genomes
* Fix an issue with the full screen view of the peptide finder graph
* Fix an issue where the download dialog didn't disappear by pressing the escape key
* Update to capistrano 3
* Update bootstrap to 3.1.1
* Update D3.js to 3.4.6
* Update ruby to 2.1
* Update rails to 4.1.1

#### Peptidome similarity

#### My genomes

### Unipept version 2.3

* Add treeview to the multi-peptide analysis result page (#381)
* Add ec numbers and go terms to the single peptide analysis result page (#368)
* Add links to PRIDE and PeptideAtlas on the single peptide analysis result page (#122)
* Add the option to add multiple genomes at a time to the my genomes feature (#390)
* Add copy to clipboard buttons where appropriate (#386)
* Add the option to add unlimited genomes to the my genomes feature by switching to indexedDB storage (#390)
* Add a progress bar to the multi-peptide analysis page (#68)
* Improve the multi-peptide analysis input parsing  by stripping #-symbols (#115)
* Improve the design by removing most of the gradients and drop shadows
* Improve the stability of the clustered order (#387)
* Fix a bug where filtering the selection tree of the peptidome analysis was case sensitive where it shouldn't be (#377)
* Fix a bug where loading the /organisms page resulted in an error (#374)
* Fix a bug where only loading 'my genomes' into the peptidome analysis caused an error (#369)
* Fix a bug where having 2 genomes with the same name caused the phylogenetic tree to crash (#376)
* Fix an issue where some image assets failed to load (#372)
* Fix a small inaccuracy with the UPGMA calculation (#378)
* Update bootstrap to 3.2
* Update D3.js to 3.4.8

#### Treeview

#### Copy to clipboard

#### My genomes revisited

### Unipept version 2.4

* Add an API and documentation (#397)
* Add tests for the ruby on rails app (#412)
* Add a reset button to the visualisations (#423)
* Add the new treeview to the tryptic peptide analysis page (#393)
* Improve the organisation of the tryptic peptide analysis page (#392)
* Improve phylogenetic tree export by hiding internal nodes (#364)
* Improve the LCA calculation code by rewriting everything in java (#384, #398)
* Rename single peptide analysis to tryptic peptide analysis (#392)
* Rename multi peptide analysis to metaproteomics analysis (#392)
* Fix the database to account for bigger uniprot accession numbers (#239)
* Fix the database to account for bigger EMBL and Refseq cross references (#417)
* Update rails to 4.1.4
* Update D3 to 3.4.11

#### API

#### tests

#### LCA in Java

### Unipept version 2.5

* Rewrite Treemap with D3 (#428)
* Rewrite all Metaproteomics Analysis visualisation code (#453)
* Add a new full screen mode to the Metaproteomics Analysis results page with improved functionality (#453)
* Add breadcrumb navigation to the treemap (#78)
* Add breadcrumb navigation to the sunburst (#453)
* Add the option to shift-click a node in the treeview to expand all children (#395)
* Add color highlights on mouseover to the sunburst graph (#438)
* Add insdc and refseq cross references to the pept2prot api (#452)
* Add a publications page (#454)
* Improve the performance of the metaproteomics result page by reducing the page size (#61)
* Improve the sunburst image export by excluding the faded sunburst arcs from the exported image (#439)
* Incremental PRIDE dataset loading with progress bar (#440)
* Improve the tree on the TPA results page by using the number of hits instead of the number of leafs to scale the nodes + include a tooltip (#404)
* Achieve 100% test coverage (#442)
* Fix an issue with incorrect treemap bounding box (#30)
* Fix an issue with the top navigation being on 2 lines when helvetica and arial aren't installed (#430)
* Fix an issue with overlapping nodes in the new tree visualisation (#388)
* Fix an issue with header rows being imported in the database (#441)
* Fix an issue with the 'new version'-message appearing in the CLI
* Fix an issue where a serif font was used for the image export of clustered genomes (#425)
* Fix an issue where removing a genome while a genome was being removed, crashed the unique peptide finder (#418)
* Fix an issue where negative taxon id's could be returned by the API (#455)
* Update rails to 4.1.8
* Update D3 to 3.5.3
* Update bootstrap to 3.3.2

#### D3 treemap

#### Full screen?

### Unipept version 3.0

* Redesign (#520)
* Use Assemblies instead of Bioprojects for the proteomes (#460)
* Automatically resume a previous peptidome analysis (#416)
* Add draft genomes to the peptidome analysis (#353)
* Add command line documentation (#410)
* Add type strain info to the proteomes (#491)
* New table based method of selecting proteomes (#472)
* Remove drag and drop for proteome selection (#419)
* Shift + click now always expands the treeview, both on the TPA and MPA results page. (#395, #476)
* Use autoprefixer for css (#463)
* Refactored the JavaScript code to use promises were possible (#464)
* Use notifications to indicate progress (#474)
* Add protein names to the tryptic peptide analysis results (#465)
* Add protein names to the API output (#519)
* Add the possibility to leave an email address on encountering an error (#494)
* Include the UniProt version in the footer
* Rewrite of the uniprot parser using make files and berkeley DB (#424)
* Add copy to clipboard button for Tryptic Peptide Analysis (#466)
* Add open in UniProt button for Tryptic Peptide Analysis (#466)
* Fix an issue where the names of "My proteomes" were incorrectly abbreviated in some cases (#483)
* Fix an issue where IndexedDB was broken in Safari (#489)
* Fix an issue where the input order was not preserved for the taxonomy API call (#490)
* Fix a bug where the my proteomes popover wouldn't open once a pancore popover was shown (#472)
* Fix a bug where the pancore popover was still present after a remove all (#484)
* Fix an issue where text was selected during drag-to-reorder in the pancore graph (#472)
* Fix an issue where a few JavaScript errors were shown when loading the TPA tree
* Fix an issue where the application crashed when a user submitted non-ascii characters in the multi-peptide analysis (#493)
* Update rails to 4.2.3
* Update D3 to 3.5.5
* Update bootstrap to 3.3.5

#### peptidome

#### Promises and ES6

#### CLI?

#### redesign

#### UniProt reduction

### What's next?

* Docker

## The Unipept command line tools {data-running-title='The Unipept command line tools'}
