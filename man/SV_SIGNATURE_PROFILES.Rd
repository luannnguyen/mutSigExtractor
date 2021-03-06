% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataSvSignatureProfiles.R
\docType{data}
\name{SV_SIGNATURE_PROFILES}
\alias{SV_SIGNATURE_PROFILES}
\title{SV signature profiles}
\format{
An object of class \code{matrix} (inherits from \code{array}) with 16 rows and 6 columns.
}
\usage{
data(SV_SIGNATURE_PROFILES)
}
\description{
A matrix.
rows: For deletions, duplications and inversions, SV type/SV length context. Translocations take up one row as they do not
have length.
cols: 6 SV signatures
}
\details{
Source: https://media.nature.com/original/nature-assets/nature/journal/v534/n7605/extref/nature17676-s3.zip
(Supplementary.Table.21.Signatures.v3.xlsx)

Note that the probabilities of the clustered and non-clustered rearrangements have been combined. In other words, whether the
rearrangements were clustered/non-clustered were not considered.
}
\keyword{datasets}
