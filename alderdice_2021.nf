#!/usr/bin/env nextflow

gene_set_dir = Channel.fromPath('/home/humebc/projects/alderdice_20210216/gene_sets')

process orthoFinder{
    tag "orthoFinder"
    container 'davidemms/orthofinder'
    containerOptions '-u $(id -u):$(id -g)'
    publishDir "orthoFinderResults", mode: "copy"

    input:
    path(gene_set_dir) from gene_set_dir

    output:
    file("*")  into ch_orthofinder_output_results

    script:
    """
    mkdir tmp
    orthofinder -f ${gene_set_dir} -t 200 -a 200 -p ./tmp -o ./ortho_results
    rm -r tmp
    """
}