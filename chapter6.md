# A short history of Unipept {.chapter data-running-title='A short history of Unipept'}

This chapter tells the story of Unipept from a developer's point of view. The first section deals with Unipept before it was a web application. Section two goes into detail about the individual versions of the Unipept web application. The last section handles the Unipept command line tools.

## Before the web application {data-running-title='Before the web application'}

The first attempt at creating a tool for peptide analysis was a stand-alone  application written in Java. The data source for this application was the set of  complete bacterial RefSeq genomes. First, all files containing the proteomes were downloaded in the GenBank flat file format. These files were then fed through our data processing pipeline. The processing consisted of parsing the files using BioJava [@Prlic2012], performing an in-silico trypsin digest on the protein sequences and storing all peptides with a length between 8 and 50 amino acids.

##### Storing the data
Initially, the peptides were stored using a patricia trie. <span class="aside">Unlike in a normal trie, in a patricia trie, parent nodes having only a single child are collapsed into a single node. This reduces the size of the data structure, especially in sparse trees.</span> A trie, or prefix tree, is a data structure where an ordered tree is used to efficiently search for keys (in our case tryptic peptides) and retrieve the associated values (in our case taxon id's). While information retrieval is very fast, this approach has two major problems: the entire dataset must fit into memory to achieve optimal performance and it's not straightforward to both reliably and efficiently store the data structure to disk. This effectively means that all source data must be reprocessed every time the program is run.

Both problems were solved by storing the data in a MySQL database instead of a patricia trie. By default, MySQL uses the hard drive to store data and only uses memory for temporary tables and caches. This not only allowed us to process the source data once and have permanent access afterwards, but also enabled more flexible data access through the use of SQL queries. The downsides are slightly slower data access and fairly slower index construction.

At that time, there were 1190 complete bacterial RefSeq genomes spanning 860 species. Using the MySQL database, it took 21 hours to parse these genomes and create the index. This resulted in a database of 7 GB of which half was used for indexes. The database contained information on 34.4 million distinct peptides that each occurred in 1.57 genomes on average. 90.7% of all peptides only occurred within a single species, 5.8% occurred within two species.

<p style="display:none" class='pre-small-image image-screenshot'> </p> ![The initial PeptideInfo Java application, when searching for the peptide <span class='small-caps'>AAALAYAK</span>. The peptide was found in 3 of the 4 *Staphylococcus aureus* genomes and in a *Staphylococcus pasteuri* genome. Note that the database only contained a test set of 8 genomes at the moment of the screenshot.](images/ch6fig2.png){#fig:ch6fig2}

##### Exploring the data
After creating a fast index mapping peptides on taxonomic nodes, there are two  research questions that emerge: in which species does a given peptide occur, and which peptides only occur within a given species. To answer the first question, a Java application with a graphical user interface was created.<span class="aside">This PeptideInfo application later evolved into the Unipept tryptic peptide analysis.</span> As shown in @Fig:ch6fig2, the user could enter a tryptic peptide in the text area, click the search button and a report was generated listing all species in which the peptide was found. The application also listed the number of genomes in which the peptide was found in case multiple genomes of a species were available.

The second question, which peptides can be used to uniquely identify a certain species, was harder to answer. The database was not optimized for this and the queries took too long to wrap everything into a desktop application.<span class="aside">A solution to this question was later provided by the Unipept unique peptide finder.</span> Instead, a collection of scripts and queries was created to explore the potential of the data. @Fig:ch6fig1 shows the promising results of such analysis on the available genomes of *Staphylococcus aureus* subsp. *aureus*, *Clostridium botulinum* and *Campylobacter*. These results show that there is a large number of species-specific peptides and a surprisingly low number of genus-specific peptides. This means that there is a great potential to use tryptic peptides as a way to identify organisms.

Because there was an immediate need for a tool to help analyze the gut microbiota of patients with cystic fibrosis for a joint research project <span class="todo">add reference to JCF paper</span>, we decided to first further develop the PeptideInfo application.

![A poster presenting the results of the precursor of Unipept at the 4th International Symposium on Proteome Analysis in Antwerp, Belgium in December 2010.](images/ch6fig1.png){#fig:ch6fig1}

## The Unipept web application {data-running-title='The Unipept web application'}

After creating a database-backed mapping from peptide sequences to organisms, the use of Java for the client application was reevaluated. The main advantages were familiarity with the programming language, good performance and, at least theoretically, cross-platformness.<span class="aside">Users would also have to set up a local database, still requiring platform-specific solutions.</span> This was offset by drawbacks such as the need for installation of the application, the difficulty to distribute updates and the need to run your own database as a user. Because the target audience of Unipept is non-technical users and we had an agile development style in mind, the disadvantages outweighed the benefits.

### Unipept version 0.1 &ndash; 0.4

##### Unipept version 0.1
In the end, we chose to rebuild the client as a web application using the Ruby on Rails framework ([@Fig:ch6fig3]). The main reason for choosing for a web application was the low threshold for users to start using the application and the ease with which new versions can be deployed. This client-server architecture also completely shifts the technical burden away from the user. The choice for Ruby on Rails was a bit of a risk since we had no previous experience with it, but the framework looked promising and was becoming popular very fast.

<p style="display:none" class='image-screenshot'> </p> ![The homepage of version 0.1 of the Unipept web application.](images/ch6fig3.png){#fig:ch6fig3}

Unipept version 0.1 was a straightforward reimplementation of the existing PeptideInfo tool. As can be seen in @Fig:ch6fig3 and @Fig:ch6fig4, the user could submit a tryptic peptide in a search form to which the application responded with an overview in which species the peptide was found. The only noteworthy change to the old application was the inclusion of not only the complete RefSeq genomes, but also the draft genomes.

<p style="display:none" class='image-screenshot'> </p> ![Web-based reimplementation of the PeptideInfo tool. The analysis for the peptide <span class='small-caps'>AAALAYAK</span> is shown.](images/ch6fig4.png){#fig:ch6fig4}

##### Unipept version 0.2
After reaching feature parity with the Java client in version 0.1, work began on adding new features. Where the initial single peptide search only listed the species in which a peptide was found, version 0.2 introduced the concept of the lowest common ancestor (LCA).<span class="aside">The LCA is discussed in more detail in @sec:ch2-SPA.</span> To efficiently calculate the LCA, the complete lineage of every organism is needed. Until then, the hierarchical information of the taxonomy tree was not easily accessible. Each of the records in the taxonomy table represented a single taxonomic node containing, among other things, the taxon id of its parent. To retrieve all ancestors<span class="aside">With ancestor, we mean all parent nodes in the taxonomic tree, not evolutionary ancestors.</span> of a given organism, we needed to recursively query the database for the parent node until we reached the root. A solution to this problem was to calculate the lineage for each organism during database construction,<span class="aside">Unfortunately, it turned out that the unnamed ranks also contain important information, especially in plants.</span> and then store that path to root in a dedicated table. To accommodate for a variable number of ancestors, a fixed structure was used, using only the so-called named ranks. This precalculated table containing the 28 possible ancestors for every organism made it possible to efficiently calculate LCAs.

This lineage data was used to improve the single peptide analysis page ([@Fig:ch6fig5]). Instead of simply listing the species in which the peptide was found, it now shows all organisms, the common lineage of these organisms and the lowest common ancestor. The result is also visualized by drawing a simple treeview of the relevant section of the taxonomy tree.

<p style="display:none" class='image-screenshot'> </p> ![Result page of the single peptide analysis in Unipept version 0.2 for peptide <span class='small-caps'>EVAEAAQEK</span>.](images/ch6fig5.png){#fig:ch6fig5}

The next main feature of Unipept became the multi-peptide analysis ([@Fig:ch6fig6]). This feature allowed a user to submit a list of tryptic peptides from a metaproteomics experiment instead of just a single peptide. Listing all occurrences for each tryptic peptide would produce a long and cluttered list of information. Instead, only the LCA of each of the submitted peptides was used. These results were aggregated per taxonomic node into some kind of hierarchical frequency table. Clicking on a node in this table revealed the peptides associated with that taxonomic node. The same information was displayed as in interactive treemap using the JavaScript InfoVis Toolkit (http://philogb.github.io/jit/), a JavaScript visualization framework.

<p style="display:none" class='image-screenshot'> </p> ![Result page of the multi-peptide analysis in Unipept version 0.2. The page shows the result of the analysis of Sample 7 as defined by @Verberkmoes2009.](images/ch6fig6.png){#fig:ch6fig6}


##### Unipept version 0.3
For Unipept version 0.3, we changed our protein data source from the RefSeq genomes to the UniProt Knowledgebase [@Wu2006]. UniProtKB consists of two parts, Swiss-Prot and TrEMBL, containing millions of protein entries, including proteins from complete and reference proteomes. Our Java pipeline iterates over the xml version of UniProt <span class='aside'>We implemented a SAX parser because of its streaming property and the huge size of our data file.</span> to extract the protein entries and additional metadata such as organism information and various cross references. These additional data are stored in an updated database schema. Switching from RefSeq to UniProt not only yielded more protein data, but also richer annotations.

From a user's point of view, there were two small additions in Unipept 0.3. The list of organisms in which the tryptic peptides occurs ([@Fig:ch6fig5]) was replaced by a table. This table not only includes the organism name of the matched UniProt entry, but also the complete lineage of that organism (@Fig:ch6fig8). The second addition was that of a list of all peptides that could not be matched by Unipept on the multi-peptide analysis result page. These peptides are accompanied by a link to immediately start a BLASTp search for them.

<p style="display:none" class='pre-small-image'> </p> ![The lineage table that was added in the single peptide analysis result page in Unipept version 0.3](images/ch6fig8.png){#fig:ch6fig8}

##### Unipept version 0.4
Until Unipept 0.4, we always replaced all occurrences of isoleucine (I) by leucine (L) during initial processing.<span class='aside'>Isoleucine and leucine are isobaric amino acids and therefore hard to tell apart in MS experiments.</span> While this makes sense for proteomics data, it makes it impossible to optionally discern between them in a search because that data simply is not present in the database. One could of course store the original sequence in the database and make the substitution at runtime, but this would have a, potentially severe, negative performance impact. When searching for a peptide with $x$ Is or Ls, we would have to combine the result of searching for all possible I/L-combinations, meaning $2^x$ sequences. Instead, we chose to both store the original sequence and the "equated" version. This way, we can offer the user the choice if he wants to differentiate between I and L or not. The only disadvantage is the doubled storage space that is needed to store the sequence and its index in the database.

A second database change in version 0.4 was the caching of the LCA calculation. Individual LCA calculation is quite fast due to the table-based lineage approach, but when performing a multi-peptide search, calculating the LCA for each of the potentially thousands of input peptides can take some time. Since the LCA doesn't change if the rest of the data isn't changed, it makes sense to store the result after it's been calculated the first time.<span class='aside'>Later versions of Unipept pre-compute the LCA for each peptide as part of the parsing step.</span> Because we now give the user the choice of equating isoleucine and leucine and because this influences the outcome of the LCA, a value for both settings must be stored separately. Note that this is the first time that the rails application writes something to the database. Until now, only read access was needed.

Another change to the database in Unipept 0.4 was the need to store the validity of taxa.<span class='aside'>The reasons for and effects of the taxonomy cleanup are discussed in @sec:ch2-SPA.</span> This was done by adding an extra column to the taxa table containing a binary value. While suitable for checking the validity of a single taxon, this solution was not sufficient for an efficient LCA calculation which only uses data from the lineage table. Therefore, the taxon validity data had to be included in the lineage table in a way that invalid taxa could easily be ignored during LCA calculation. Our solution was to multiply the invalid taxon id's by -1 before storing them in the lineage table. Although this solution looks like a kludge, it has many benefits: it's easy to ignore these taxa during LCA calculation by ignoring negative taxon id's, it's possible to discern between invalid taxa and missing values, it has a minimal performance impact and it's possible to retrieve the original taxon id by simply taking its absolute value. The invalidation itself is done during the initial parsing.

<p style="display:none" class='image-screenshot'> </p> ![Home page of Unipept 0.4 showing additional documentation and the availability sample datasets.](images/ch6fig9.png){#fig:ch6fig9}

In the competitive field of bioinformatics, it's important to make the threshold to start using your application as low as possible. Being a web application already eliminates a cumbersome installation step and providing easy access to test data further lowers the barrier. We selected three diverse metaproteomics projects and added one-click access to their data to the Unipept home page ([@Fig:ch6fig9]). Other new features introduced in version 0.4 include the addition of a CSV export option and the display of the full organism names in the single peptide analysis results table instead of the taxon id's.

### Unipept version 1.0

After the release of Unipept 0.4, everything was prepared to release the first production-ready version. This means that the main focus was on bug fixes, layout tweaks and more documentation. The only new feature was the inclusion of the sunburst graph, a new visualization that had been in development for a while but wasn't ready yet for release with Unipept 0.4.

During the development of version 1.0, Ghent University deployed GitHub Enterprise.<span class="aside">GitHub Enterprise is a self-hosted version of the public GitHub.com website.</span> This allowed all students and researchers to create an unlimited number of (private) repositories to manage their programming projects free of charge. Since the Unipept team was very much in favor of offering GitHub Enterprise as a university-wide repository hosting service, we immediately switched over as a pilot user. This switch resulted in a more professional development approach and the adoption of several best-practices.

##### The flow branching model
The most profound change was the adoption of the flow branching model ([@Fig:ch6fig7]) instead of working on a single branch. Flow uses two core branches: `develop` and `master`. All new development work should happen on `develop`, while `master` always reflects a production-ready state. Once enough work is done on `develop` to justify a new release, the branch is merged into `master`, a version tag is created and the new version can be deployed on the production servers.

Next to these two core branches, two types of temporary, supporting branches are used: feature branches and hotfix branches. As the name implies, feature branches are used to experiment and develop new features without interfering with other development. They always start by branching of `develop` and are merged back into `develop` when the feature is finished. A hotfix branch is used to fix a critical bug in the current production version. When such bug is discovered, a new branch is started from `master`, the bug gets fixed and the hotfix branch gets merged into both `master` and `develop` resulting in a new release.

The flow branching model also suggests using release branches before creating a new release and merging changes into `master`. This release branch can be used for final testing, documentation generation, last-minute bug fixes and other release-oriented tasks without interrupting continuing work on `develop`. Because Unipept development is mostly a one-man operation, this type of branch was not really useful for us.

![Schematic overview of the flow branching model. Image created by Vincent Driessen](images/ch6fig7.png){#fig:ch6fig7}

##### Issues, pull requests &amp; releases
The flow guidelines note that feature branches typically only exist in developer repos and are only pushed to the main repository when the feature is finished. This is not something we agree with, on the contrary, we encourage pushing feature branches as early as possible to be able to create a pull request. A pull request was originally meant to be a way to submit modifications to an open source project. On GitHub, any branch can be used to create a pull request. This creates some sort of timeline view of the branch, containing all commits and comments chronologically. In the Unipept repository, we use these discussion views to document the development of the feature by commenting with motivations for design choices, benchmark results, screenshots, task lists, etc. Other benefits of using pull requests over simple branches are that they can be labeled, are searchable and can be linked to. Branches also eventually get deleted, pull requests are never deleted, only closed or merged.

Another GitHub feature that helped the management of the project is the extensive use of issues.<span class='aside'>The Unipept repository used over 500 issues for around 3000 commits.</span> Issues is the central bug tracker of GitHub that can be used for bug reports, but also to keep track of ideas for features and other tasks. Each issue gets assigned an incremental numeric identifier after creation. This id can then be used to reference the respective issue in commit messages and throughout the GitHub website. Just like pull requests, issues can also be labeled and assigned to milestones. We always create milestones for the next several Unipept versions and by assigning issues to them, we create a coarse roadmap. This way, the list of all open issues for the next milestone release can serve as a todo list. When all issues for a milestone are closed (or moved to the next milestone), a new Unipept version is released. The list of closed issues for that milestone can then be used to create a changelog. From version 1.0, this changelog is published on both GitHub and the Unipept website.

After a new version is released, it must also be deployed on the Unipept production servers. To automate this process and minimize downtime, we use a tool called Capistrano (http://capistranorb.com/). Capistrano uses our GitHub repository to automatically download the latest version of the code to the server, it updates the dependencies and takes care of asset generation. By default, our Capistrano configuration deploys the `master` branch on production machines and the `develop` branch on our test servers.

##### D3.js
The only new feature in Unipept 1.0 is the inclusion of a new type of visualization: the sunburst graph (@Fig:ch6fig10). The sunburst is an interactive multi-level pie chart where the center represents the root node with several concentric rings around it. These rings are divided into slices representing the child nodes in the taxonomic hierarchy of the aligning more central slice. The size of the slices corresponds to the number of peptides having an LCA equal to that taxonomic node or any of its children.

<p style="display:none" class='image-screenshot'> </p> ![Part of the results page of the multi-peptide analysis in Unipept 1.0 showing the newly added sunburst diagram.](images/ch6fig10.png){#fig:ch6fig10}

<span class="aside">D3 is short for Data-Driven Documents.</span>The sunburst graph was implemented using D3.js [@Bostock2011], a JavaScript framework to create dynamic, interactive data visualizations in web browsers. D3 doesn't come with pre-built charts and visualizations, but requires you to build them yourself. To help with this, it includes several helper methods such as functions to draw axes, map data from a domain to a different range, or calculate complex layouts. The main drawback of D3 is its steep learning curve, but once you've got it figured out, you have ultimate control over the design, animations and interactions of your visualization.

The main idea of D3 is to bind data to the DOM<span class='aside'>DOM stands for Document Object Model, a convention for working with elements in HTML and XML documents.</span> of a web page and then use that data to apply data-driven transformations. For example, you could represent a dataset as a set of circles, where a categorical property of each datapoint controls the color of the circle, a nominal property controls its radius and another its position. When new data becomes available, the bound data can be updated and the corresponding transformations can adapt using an animated transition. While D3 is mostly used in combination with SVG graphics, it works with any HTML element.

For the sunburst graph, the input is a hierarchical JSON object generated by the Ruby on Rails middleware.<span class='aside'>The sunburst data format is similar to the treemap format, but is generated separately. Both formats are unified in Unipept 2.5.</span> Each `node` object contains information on a single taxonomic node, such as name, rank and number of associated peptides, and a list of children. These children are its taxonomic descendants and are also `node` objects. This hierarchical data structure is processed by the D3 partition layout algorithm to convert the hierarchical data and the number of peptides to a set of $x$- and $y$-coordinates. These coordinates are then used as angles and radii to draw the diagram using SVG elements.

### Unipept version 1.1 &ndash; 1.5 {#sec:ch6-missed-cleavage}

Unipept 1.0 can be seen as a minimum viable product; it contained all basic features the are needed to be a useful research tool, but not much more. This is also reflected by the fact that the first Unipept article [@Mesuere2012] was based on that version. Its release was followed by a number of smaller updates over the next 6 months. With the exception of support for missed cleavages, no major new features were added. Instead, the focus was on improving the existing application by paying more attention to design, usability and performance.

##### Unipept version 1.1
The most visible change of Unipept 1.1 was the reworked design ([@Fig:ch6fig11]). The navigation on the left was dropped in favor of a smaller navigation bar in the header of each page. Since a fixed-width page design was used, this left more space for the actual content, something that was especially beneficial for the visualizations. Another change was the addition of news items to inform users of new features and database updates. A news box was added to the home page in which the latest news item was shown.

From a technical point of view, the biggest change was the update from rails 3.0 to rails 3.2. This update introduced the rails asset pipeline in Unipept. The asset pipeline is a framework to manage CSS and JavaScript resources in a web application. Concretely, this means that when deploying your application to a production environment, your assets are "compiled". During this compilation step, all CSS files of your application are bundled into a single file whilst removing unnecessary white-space. Similarly, all JavaScript files are bundled into one file which is then minified. As the name implies, minification tries to make the input file as small as possible by removing white-space and comments, and by renaming variables and functions to shorter names. The advantage of using the asset pipeline is that as a developer, you can use as many files as you want to organize your code without suffering from the related impact on performance.

<p style="display:none" class='image-screenshot'> </p> ![The home page of Unipept 1.1.](images/ch6fig11.png){#fig:ch6fig11}

##### Unipept version 1.2
Unipept 1.2 contained no visible changes and solely focused on performance improvements. As mentioned in a previous side note, both the treemap and sunburst visualizations use a JSON object as their data source. These two similar JSON objects are first created as a single Ruby root node object that contains all data for the two visualizations. Since the desired output format is slightly different for both, they must be generated separately which involves a few back and forth conversion to the JSON format.<span class='aside'>The initial root object is essentially deep copied by serialization.</span> These conversion steps accounted for a majority of the 2500 ms page load time. Swapping out the default Ruby JSON parser for OJ, a JSON parser optimized for speed, reduced loading time to only 500 ms.

A second set of performance improvements consisted of optimizing all queries for performance and applying eager loading where possible. Eager loading is a Ruby on Rails mechanism where associated records are loaded in as few queries as possible. For example, retrieving all UniProt entries in which a given peptide occurs can be done in a single query. If we afterwards want to fetch information on the associated taxonomy records,<span class='aside'>This is called the N+1 query problem: doing one initial query + one for each of the N associations.</span> we need one query per UniProt entry. If we know in advance that we will need the taxonomy data, we can use eager loading to fetch that data while doing the initial query using only a single extra query.

##### Unipept version 1.3
Unipept 1.3 further tweaked the user interface of the website by using Twitter Bootstrap ([@Fig:ch6fig12]).<span class="aside">The project is no longer associated with Twitter and is now called Bootstrap.</span> Bootstrap is a popular, open source front-end framework to create web applications. It contains HTML and CSS templates, for example for typography, icons, forms, etc., and a number of JavaScript powered components such as modal dialogs and tooltips. The main benefit of using Bootstrap is that it speeds up front-end development because of its ready-made components that don't require any additional styling to create an ok-looking, but somewhat generic, web page.

<p style="display:none" class='image-screenshot'> </p> ![The home page of Unipept 1.3, the first release to use Bootstrap.](images/ch6fig12.png){#fig:ch6fig12}

A second focus area of Unipept 1.3 was to improve the usability of the visualizations by implementing a fullscreen mode and by allowing users to export the visualizations as an image. The Fullscreen API in browsers is a *living standard* which means that it is still in active development and by no means a finalized standard. As a result, it's impossible for browsers to adhere to the standard since there is none. All major browsers do have their own implementation of a fullscreen API, but unfortunately they are not mutually-compatible and incompatible with the latest draft of the spec. To reliably implement fullscreen support, we had to write our own mini API containing the necessary functions as a compatibility layer. This compatibility layer then called different internal functions depending on which browser (version) was used. The downside of this approach is that to maintain compatibility, we had to keep an eye on browsers changing their implementation.

At the time, Unipept contained two types of visualizations: the treeview and treemap are based on the canvas element, while the sunburst uses the svg element. Exporting them as images required a different approach for each. The solution for the canvas visualizations was very simple: the canvas API contains a `toDataURL`-method that returns the contents of the canvas as a image. The svg API has no similar alternative and required a server-side solution. When the user clicks the *save image* button, the contents of the svg element gets sent to the server. There,<span class='aside'>Imagemagick is a set of command line utilities for manipulating images.</span> Imagemagick gets called to rasterize the vector graphic and the resulting image gets Base64 encoded and sent back to the client as a data-url. Although these two procedures are very different in nature, they happen invisible to the user.

##### Unipept version 1.4
Unipept 1.4 was released as a response to some of the review remarks of the initial Unipept article [@Mesuere2012]. Up until now, our processing pipeline only stored peptides with a length between 8 and 50 amino acids. At the request of one of the reviewers, this was expanded to a length between 5 and 50. Other than an increased database size, this had no implications on the application.

A second request was the addition of missed cleavage handling. When trypsin is added to a protein sample, it hasn't got a 100% success rate. Sometimes it misses a cleavage site, resulting in peptides consisting of two or more tryptic parts. Since Unipept only keeps an index of tryptic peptides, these composite peptides cannot be found using Unipept. A pragmatic solution to this is to do an in-silico tryptic digest after the peptide has been submitted to Unipept and to search for the two or more separate parts. This technique has no negative performance impact en will never produce incorrect results since the matched peptides were genuinely present in the sample. It is however not the most accurate solution, because we don't take into account the fact that the separate parts of the peptide occur adjacently and in the same protein.

The easiest solution to this would be to not only store tryptic peptides, but also peptides with one or more missed cleavages. The big drawback is that the database size would grow exponentially, depending on how many missed cleavages we wanted to support. Since this is not desirable, we came up with a better solution which we call advanced missed cleavage handling. We still do an in silico digest of the submitted peptide, but instead of returning the various parts as separate peptides, we recombine the results. Since the separate parts occur in the same peptide, we only want UniProt entries where each of the parts occur. The first step in the recombination is thus to take the intersection of the sets of matched UniProt entries for the separate peptide parts. We now have a reduced set of UniProt entries that potentially contain our composite peptide. The second step is to account for the locality since the separate parts occur adjacently. We do this by performing a full text search on the composite peptide in each of the protein sequences of the reduced set of Uniprot entries and only retaining those entries with a match. The LCA for the composite peptide is then calculated as normally from the remaining UniProt entries. The biggest downside of this approach is that it takes some time to do the extra calculations, which is why the advanced missed cleavage handling is disabled by default. The big advantage is that it works for any number of missed cleavages.

##### Unipept version 1.5
The main feature of Unipept 1.5 was support for loading datasets from PRIDE<span class='aside'>PRIDE stands for PRoteomics IDEntifications.</span>, a public data repository for proteomics data. When a user enters the id of a PRIDE experiment into the Unipept website, the Unipept server fetches the corresponding dataset from PRIDE using BioMart and then sends the peptides back to the user. Data access through BioMart proved very cumbersome and unnecessary difficult. To request data using the BioMart API, one must construct an xml file containing the desired input and output using a special tool. The generated file must then be URL-encoded and added to the request-URL as a parameter. The PRIDE BioMart was retired in November 2014 and replaced by the much more user-friendly PRIDE web services. Support for these web services was added in Unipept 2.4.2.

### Unipept version 2.0
Where Unipept 1.0 can be seen as a minimal version of Unipept, Unipept 1.5 can be seen as a more complete version. Now that the dust had settled down, it was a good time to review some of the implementation choices and refactor the code. From Unipept 2.0 onwards we aimed for bigger releases, containing at least one big new feature, every four to six months. The big feature of Unipept 2.0 was the addition of the unique peptide finder.

##### Spring cleaning
Ruby on Rails is a web application framework using the Model-View-Controller (MVC) principle. MVC is a software pattern for implementing user interfaces that is traditionally used in desktop applications. In this pattern, the application consists of three kinds of components with well-defined interactions between them. A model is used to store data, a controller manipulates the data in the model and a view shows the data of the model. In web applications, the pattern is implemented by letting (a method of) the controller handle incoming requests. The controller can then use models to process the request and prepare data for use in the view. This view consists of template that gets rendered as a response, for example an HTML page. Models are generally supported by an object-relational mapping (ORM), a system to connect the objects of an application to tables in a relational database. This ORM allows easy access to the properties and relationships of objects in an application that are stored in a database, without writing SQL statements.

In previous version of Unipept, models were underused and most of the logic was present in the controllers. Additionally, the logic contained lots of SQL queries. To improve reuse of code, much of the business logic was shifted from the controllers to the models in Unipept 2.0.<span class='aside'>A principle that's know as fat models, skinny controllers.</span> The numerous queries were eliminated by making use of the ORM features of Ruby on Rails. These improvements reduce the number of code adjustments that are needed when, for example, the database schema changes.

A database change in Unipept 2.0 is support for the storage of additional UniProt cross references. Until then, only NCBI and EMBL cross references were stored. These were expanded with EC numbers [@Bairoch2005] and Gene Ontology annotations [@Ashburner2000] with the purpose of adding a functional analysis component to Unipept. A second change was the addition of information about the completed RefSeq genomes. This could be done by adding a single table containing the mapping from BioProject identifiers to the existing UniProt cross references.

##### Unique peptide finder
The unique peptide finder ([@Fig:ch6fig13])<span class="aside">See chapter 3 for more information on the unique proteome.</span> introduced in Unipept 2.0 is the biggest new feature in Unipept history. The associated pull request consists of almost 300 commits spanning a ten month period. The initial idea for this feature was to replicate something like the microbial core and pan-genome [@Medini2005], but based on the peptide contents of the genomes. Computationally, this comes down to computing unions and intersections for a list of sets, each containing 50&thinsp;000 to 150&thinsp;000 short strings. Performance-wise, doing these calculations server-side makes sense. The data is locally accessible from the database, set operations in Ruby are relatively performant and only the results need to be transmitted over the network to the user. The downside is that when embedded in an interactive web application, we would have to give up some flexibility because adding a new genome to the analysis would mean that all previous calculations need to be redone. This is because keeping track of the state of every user on the server is not feasible.

<p style="display:none" class='image-screenshot'> </p> ![The unique peptide finder as introduced in Unipept 2.0.](images/ch6fig13.png){#fig:ch6fig13}

Shifting all calculations client-side would allow for a more interactive application but involved some challenges: the complete contents of all selected genomes must be transferred to the user, JavaScript has no built-in Set datatype,<span class='aside'>Support for sets was added in ES2015, an updated JavaScript standard finalized in June 2015.</span> and JavaScript is single-threaded meaning that the browser becomes unresponsive during computations. The absence of a real set forced us to think out of the box to efficiently implement the union and set operations. we ultimately decided to use arrays instead and to iterate over them to determine the common elements. If both arrays are sorted, this can be done in a single pass in $O(n+m)$ time where $n$ and $m$ are the length of the arrays. This is comparable to the theoretical complexity if both were sets instead of sorted arrays. The sorting comes at no extra cost because this is how the entries are returned by the database.

This implementation made us realize that the actual peptide contents of each genome is not needed in the browser to calculate the unions and intersections. Something to uniquely identify the peptides is all that's necessary and the primary keys of the `sequences` database table perfectly fit the bill. The switch from using the actual peptides to using their numerical identifiers had several benefits. Because integers take up much less space than strings, the problem of transferring the genomes from the server to the client was mostly solved: the new representation is only 150 KB in size for a single bacterial genome. This reduced size benefit is also applicable to the memory needed to store the genomes in the user's browser. A third benefit is that comparing integers is more efficient than strings, making the solution even faster.

With the first two challenges solved, the only remaining issue was the single-threadedness of JavaScript. All JavaScript code on a web page executes in a single thread which means that for example, the page can't react to button clicks while another calculation is going on. The JavaScript engine keeps a queue of all work that needs to be done and only starts working on the next item when the previous work is finished. To achieve the perception of a smooth, jank<span class='aside'>Jank is any perceived stutter while using an application and has a negative impact on the user experience.</span> free application, a JavaScript developer must make sure that the workloads added to the queue are sufficiently small. Rendering a fluent animation requires a constant frame rate of 60 frames per second or one frame per 16 ms. This means that while an animation is playing, you must make sure that all scheduled work can be execute in under 16 ms or the next frame will be missed resulting in jank. Another example is the responsiveness of the application when interacting with user interface elements. User experience research shows that users expect a response from direct manipulation within 100 ms [@Miller1968]. This means that any calculations for a response must be done within that time budget.

Performing all required calculations within the given time budgets would mean setting up an advanced scheduling system to split up the work. Such solution would rapidly become a complex, hard to maintain, and therefore undesirable affair. Modern browsers offer an alternative solution in the form of web workers. Web workers are mechanism in which JavaScript code can be run in a background thread. Although it might look like it, this is no real multi-threadedness. The code running in the web worker runs entirely separate from the main JavaScript thread. It has no access to the DOM or shared memory access. The only way to communicate between the worker thread and the main thread is by using a simple message passing system. In our case, the time-consuming computations can easily be separated from the rest of the application and communication between both parts is minimal which is why we chose to implement a solution using web workers.

##### Single-page application
Once all back-end problems were solved, the design of the application itself could be finalized. The unique peptide finder was designed as a single-page application. This means that the web page behaves as a traditional desktop application without reloading the page or using any page navigations. The user interface itself consists of three main parts: a collapsible tree view containing all available genomes, a table containing all genomes that were added to the analysis and the pan-core graph itself. All three components use D3 to generate HTML and SVG elements.

The collapsible tree to add genomes to the application is generated from a JSON object that is part of the initial page load. The nested JSON object is converted to a nested unordered list using D3 and CSS is applied to make it look like a Windows explorer-like collapsible tree. The collapsing behavior and the possibility to filter the tree is added by custom JavaScript code. The tree was created as a stand-alone component to make reuse possible; something that was done in Unipept 2.1 where the tree in multi-peptide analysis results page was replaced by this implementation.

The table containing all genomes added to the analysis functions both as view and controller. D3 is used to generate the HTML table and to keep it synchronized with the internal status and order. Genomes can be added to the table<span class='aside'>jQuery UI is a set of user interface interactions, effects and widgets built on top of the jQuery.</span> by dragging them from the tree to the table with the help of jQuery UI. The same library is used to enable the reordering of genomes by drag and drop. The internal state of the application is kept in a single object containing all metadata that's shared with the pan-core graph.

The pan-core graph itself is an SVG element containing D3-generated content. The data shown in the graph is a combination of the metadata from the table and the pan and core data points that are calculated from the web worker. Next to visualizing the data, the graph can also be used to control the visualization. Drag and drop can be used to reorder and remove the genomes and clicking on a data point show a dialog containing more information and the option to download the corresponding data.

##### Data flow
When adding a new genome to the analysis, it immediately gets added to the table with a <i>loading</i> status. The web worker then gets notified that a new genome was added and asynchronously requests the corresponding peptide data from the web server. The server answers the web worker with a gzip-compressed list of sorted integers in the JSON format. The web worker converts this list to a JavaScript array, stores it in an internal data object and starts calculating the union and intersection based on the previous state. The size of these two new sets are then sent back to the main JavaScript thread. In the main thread the new data is used to add new data points to the graph and the genome status to <i>done</i>. The flow for reordering the genomes is similar, except that no new data need to be requested from the server.

After all queued genomes are loaded, the graph requests the web worker to load the unique peptide data. The web worker sends the server a list of all core peptides in the analysis, together with the taxon id's of all genomes in the analysis. The server calculates the LCA of these taxon id's and filters the list of peptides for those having the same LCA. The filtered list is then sent back to the web worker, which forwards the size of the received list to the main thread. The main thread then uses this information as data points in the graph. The server needs the LCA for each of the submitted peptides to be able to filter on this. Because the typical genome size is between 50&thinsp;000 and 150&thinsp;000 peptides, it's not feasible to calculate all LCAs on the fly. To solve this problem, the LCA for all peptides in the database is precomputed after constructing the database by making use of the LCA caching functionality introduced in Unipept 0.4. Unfortunately, this increases the already long time needed to process a new UniProt version with a few weeks.

### Unipept version 2.1
Unipept 2.1 was the smallest release in the Unipept 2 release series. Apart from the redesigned home page ([@Fig:ch6fig14]), it contained few new user-facing features. From a technical point of view, there are only two improvements worth mentioning: an improved file download flow and the refactoring of all unique peptide finder JavaScript code.

<p style="display:none" class='image-screenshot'> </p> ![The new home page layout as introduced in Unipept 2.1.](images/ch6fig14.png){#fig:ch6fig14}

##### Triggering file downloads
Initiating a file download on a web page is harder than it seems, especially if the data is only present locally in the user's browser. Let's say we've got a JavaScript array containing a list of peptides and we want to let the user store these peptides on his computer. There is no straightforward<span class='aside'>Chrome started work on a FileSystem API, but the project was abandoned because of the lack of interest from other browser vendors.</span> way to write this data to a file on the user's file system using JavaScript only. The main reason for this is that in modern browsers JavaScript code gets executed in a sandbox which has no access to the local file system. The only reliable way to trigger a file download that works in all browsers is by doing a server roundtrip. With this strategy, the desired contents of the file is added to a hidden form on the page. After triggering the form submit, the contents get sent to the server which then sends back the exact same data to the user. The server also sets the `disposition` header of the response to `attachment`. When the user's browser detects this header, it will trigger a file download dialog instead of rendering the response.

The downside of this approach is that sending all data to the server and back can take some time. According to @Miller1968, if a computer response takes longer than a second, some kind of confirmation or progress should be displayed to reassure the user. It is easy to display a notification that the file download is being prepared, but much harder to know when said notification can be removed. Because the download is triggered by an HTTP request, it's impossible to get direct status information on that request and thus on the status of the download. Our workaround sends a random number<span class='aside'>A random number that is used for similar purposes is also called a nonce.</span> to the server along with the contents of the file. The server uses this number to set a cookie with a predefined name and the random number as its value. Meanwhile, the client-side JavaScript code keeps checking the list of cookies at a regular interval after the request was sent. Since the cookie only gets set when the server starts responding, we can remove the notification once the cookie with the correct value is detected.

##### JavaScript objects
To support the upcoming peptidome similarity feature, there was a need to refactor the unipept peptide finder JavaScript code.  The existing unique peptide finder code was located in a huge file that already contained over 1300 lines of code. Adding the peptidome similarity code to that same file was certainly not recommended. Until now, all internal functions were namespaced by wrapping them in a parent function that was executed on page load. Simply using another file would also create a new namespace, thus limiting the possible interactions between the two features. Because the two features share a lot of code, we embraced a more object oriented approach. JavaScript uses a prototypal inheritance model instead of a class-based model and has poor support for information hiding, which is why we designed our own class-like structure ([@Lst:ch6lst1]). This custom structure supports creating new objects with both public and private methods. All existing peptidome similarity code was refactored to adhere to the new structure and was split into separate files for each component. The possibility to create public and private methods allowed for a beter design by defining a public API and hiding all internal methods.

```{#lst:ch6lst1 .JavaScript caption="The class-like JavaScript structure used by Unipept."}
/**
 * Some comments about this class
 *
 * @param <String> name This is a string variable
 */
var constructMyClass = function constructMyClass(name) {
    /*************** Private variables ***************/

    // the object to which we will add all public methods
    var that = {};

    // a private variable
    var privateVariable = name;

    // a jquery variable
    var $jqueryVar = $("#someSelector");
    /*************** Private methods ***************/

    /**
     * Initializes method to set up the object.
     * Something constructor-like that gets called
     * at the end of the construct function
     */
    function init() {
        // set up some stuff
        privateMethod();
        that.publicMethod();
    }

    /**
     * This is a private method
     *
     * @param <Integer> i A magic number!
     */
    function privateMethod(i) {
        // Do something
    }

    /*************** Public methods ***************/

    /**
     * This is a public method that gets exported with
     * the created object
     */
    that.publicMethod = function publicMethod() {
        // do something
    };

    // initialize the object
    init();

    // return the object
    return that;
};
```

### Unipept version 2.2

Unipept 2.2 introduced the peptidome clustering feature ([@Fig:ch6fig15]) and the possibility to add your own local genomes to the analysis. The user interface of the unique peptide finder was fine-tuned and a new coloring option was added to the sunburst visualization. The previous method randomly selects colors from a list for the leafs and recursively<span class='aside'>The colors of the parents are calculated by taking the average of their first two children in de HSL color space.</span> determines matching colors for the parents. This results in a visually pleasing graphic, but the result is somewhat arbitrary. A small change in the dataset can result in a drastically different result. This is annoying when trying to compare the sunburst visualization of two datasets. The new coloring option calculates a hash of each of the taxon names in the dataset and uses that to deterministically assign a color to the corresponding leafs. This means that a certain taxonomic node will always have the same color, independent of the dataset.

<p style="display:none" class='image-screenshot'> </p> ![The peptidome clustering feature as introduced in Unipept 2.2.](images/ch6fig15.png){#fig:ch6fig15}

##### Peptidome clustering
The peptidome clustering feature uses the peptidome contents of the genomes to calculate pairwise similarities. The similarity between two genomes is the number of peptides they have in common divided by the total number op peptides or, in other words, the size of the intersection divided by the size of the union of the two sets of peptides. These similarities are then used to perform a hierarchical clustering using UPGMA.<span class='aside'>UPGMA stands for Unweighted Pair Group Method with Arithmetic Mean.</span> The output of the clustering algorithm is then used to construct a phylogenetic tree. Both the tree and similarity matrix are rendered using D3 as a single visualization. This means that the branches of the phylogenetic tree are aligned with the squares in the similarity matrix, and that clicking on a fork in the tree swaps both the branches and the corresponding rows and columns in the matrix.

Calculating the similarities is relatively fast (under 50 ms per pair), but because the number of pairs grows quadratically with the number of genomes in the analysis, the similarity calculation can't be done in the main JavaScript thread without interfering with the usability. All necessary data is already present in the web worker of the unique peptide finder, so it was an obvious choice to add the code for the similarity calculation to the same worker. The similarity metric uses both the union and the intersection of the input sets, but because only the sizes are needed and not the actual contents, the calculation can be optimized. First, the intersection is calculated by iterating over the two sorted arrays containing the id's of the peptides in the input sets and counting the number of common peptides. The size of the union is then derived by taking the sum of the size of the input sets and subtracting the size of the intersection.

##### My genomes
* worker
* local storage + drawback

<p style="display:none" class='pre-small-image image-screenshot'> </p> ![The form to add locally stored genomes to the peptidome analysis.](images/ch6fig16.png){#fig:ch6fig16}

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

##### Treeview

##### Copy to clipboard

##### My genomes revisited

### Unipept version 2.4 {#sec:ch6-api}

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

##### API

##### tests

##### LCA in Java

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

##### D3 treemap

##### Full screen?

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

##### peptidome

##### Promises and ES6

##### CLI?

##### redesign

##### UniProt reduction {#sec:ch6-uniprot-reduction}

### What's next?

* Docker

## The Unipept command line tools {data-running-title='The Unipept command line tools'}
