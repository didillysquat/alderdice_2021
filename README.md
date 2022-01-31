# alderdice_2021

This directory contains the nextflow script used in the Alderdice et al. 2021 publication
to run Orthofinder.

To run the script, the user should ensure that docker is installed coreclty installed on their system,
that the nextflow.config file exists in the same directory as alderdice_2021.nf,
and that the `gene_set_dir` variable in the alderdice_2021.nf nextflow script
has been set to point to the directory containing
the gene sets that are listed as part of the Alderdice et al. 2021 manuscript.
