# alderdice_2022

### Project Publication
Results and Interpretations from these analyses are published open access here:
https://doi.org/10.3389/fmars.2022.834332

Full citation:
Alderdice R, Hume BCC, Kühl M, Pernice M, Suggett DJ, Voolstra CR. Disparate inventories of hypoxia gene sets across corals align with inferred environmental resilience. Front Mar Sci. 2022;9. doi:10.3389/fmars.2022.834332

OrthoFinder analyes are avavilable here:
https://zenodo.org/record/6396671#.YoYpoS8RoZg

Full citation:
Rachel Alderdice, Christian Voolstra, Benjamin Hume, David Suggett, Mathieu Pernice, & Michael Kuhl. (2022). Data from 'Disparate inventories of hypoxia gene sets across corals align with inferred environmental resilience' [Data set]. Zenodo. https://doi.org/10.5281/zenodo.6396671

### Project Summary
We used an ortholog-based meta-analysis to investigate how hypoxia gene inventories 
differed amongst 24 coral species to assess putative copy number variation. 

Alderdice et al. manuscript under review at Frontiers in Marine Science.

This directory contains:
* nextflow script to run Orthofinder 
* R & Rmd scripts to process the output

### Workflow

1. Run Orthofinder

To run the nexflow script, the user should ensure that docker is installed correctly installed on their system,
that the nextflow.config file exists in the same directory as alderdice_2021.nf,
and that the `gene_set_dir` variable in the alderdice_2021.nf nextflow script
has been set to point to the directory containing
the gene sets that are listed as part of the Alderdice et al. manuscript.

2. Extract counts for the orthogroups corresponding to genes of interest (GOI) using `Extract_GOI_counts_Orthofinder_output.r`

3. Create heatmap table of GOI counts using `Heatmap_table_GOI_counts.Rmd`

4. Use the species rooted tree node labels from Orthofinder to create species tree via `Species_rooted_tree.Rmd`

5. Create inferred gene trees for orthogroups of interest via `GOI_gene_trees.Rmd`
