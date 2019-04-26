# mutSigExtractor

mutSigExtractor is an R package for extracting SNV, indel and SV mutational signatures from vcf files.

## Counting mutation contexts
The first step involves counting the mutations belonging to specific contexts for each variant type:
- SNV: trinucleotide context, consisting of the point mutation and the 5' and 3' flanking nucleotides
- Indel: indels within repeat regions, indels with flanking microhomology; and other indels. Each category is further stratified by the repeat unit length, the number of bases in the indel sequence that are homologous, and the indel sequence length, respectively.
- SV: type (deletions, duplications, inversions, translocations) and length (0 to >10Mb)

## Determine signature contribution (by least squares fitting)
The contribution of each of the [30 COSMIC SNV signatures](https://cancer.sanger.ac.uk/cosmic/signatures) are then calculated from the SNV trinucleotide contexts using least squares fitting on the [signature profile matrix](https://cancer.sanger.ac.uk/cancergenome/assets/signatures_probabilities.txt).

Similarly, the contribution of the SV signatures [as described by (Nik-Zainal et al.](https://www.nature.com/articles/nature17676) are calculated using the [SV signature profile matrix](https://media.nature.com/original/nature-assets/nature/journal/v534/n7605/extref/nature17676-s3.zip).

For indels, no further processing is done.

## Getting started
The main functions for extracting signatures are:
```
extractSigsSnv()
extractSigsIndel()
extractSigsSv()
```

Note that SNVs and indels are often reported in the same vcf file. Therefore, extractSigsSnv() and extractSigsIndel() will automatically detect SNVs and indels, respectively (SNVs: REF length==1 and ALT length==1; indels: REF length>1 or ALT length>1). 

It is recommended that the vcf.filter argument is set to 'PASS' (or '.' for certain vcf files) to remove low quality variants. So for example:
```
extractSigsSnv(/path/to/vcf_with_snvs, vcf.filter='PASS')
```

While, by default, extractSigsSnv() and extractSigsSv() return mutational signature contributions, it is also possible to return the raw mutation context counts instead:
```
extractSigsSnv(/path/to/vcf_with_snvs, vcf.filter='PASS', output='contexts')
extractSigsSv(/path/to/vcf_with_svs, vcf.filter='PASS', output='contexts')
```

