#!/bin/bash
#-------------------------------------------------------------------------------------------#
#  Author      : Andrew J Skelton                                                           |
#  Language    : Bash                                                                       |
#  Type        : Bash Script                                                                |
#  Description : Grab the hg38 Island data from ucsc goldenpath                             |
#  Version     : 1.0                                                                        |
#-------------------------------------------------------------------------------------------#


##' One liner, with a bit of awk
##'-----------------------------------------------------------------------------------------#
wget -qO- http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/cpgIslandExt.txt.gz \
   | gunzip -c \
   | awk 'BEGIN{ OFS="\t"; }{ print $2, $3, $4, $5$6, substr($0, index($0, $7)); }' \
   | sort-bed - \
   > cpgIslandExt.hg38.bed
##'-----------------------------------------------------------------------------------------#
