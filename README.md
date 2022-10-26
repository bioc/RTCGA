[![Travis-CI Build Status](https://api.travis-ci.com/RTCGA/RTCGA.svg?branch=master)](https://www.travis-ci.com/github/RTCGA/RTCGA)
[![Project Status: Inactive - The project has reached a stable, usable state but is not being actively developed.](http://www.repostatus.org/badges/latest/inactive.svg)](http://www.repostatus.org/#inactive)

# The family of R packages containing TCGA data


<img src="https://raw.githubusercontent.com/RTCGA/RTCGA/master/RTCGA_workflow.png" height="500" width="800">

Data packages **not yet** submitted to Bioconductor from 2016-01-28 release date of TCGA data.

- [RTCGA.mutations.20160128](http://github.com/RTCGA/RTCGA.mutations.20160128/)
- [RTCGA.rnaseq.20160128](http://github.com/RTCGA/RTCGA.rnaseq.20160128/)
- [RTCGA.clinical.20160128](http://github.com/RTCGA/RTCGA.clinical.20160128/)
- [RTCGA.mRNA.20160128](http://github.com/RTCGA/RTCGA.mRNA.20160128/)
- [RTCGA.miRNASeq.20160128](http://github.com/RTCGA/RTCGA.miRNASeq.20160128/)
- [RTCGA.RPPA.20160128](http://github.com/RTCGA/RTCGA.RPPA.20160128/)
- [RTCGA.CNV.20160128](http://github.com/RTCGA/RTCGA.CNV.20160128/)
- [RTCGA.methylation.20160128](http://github.com/RTCGA/RTCGA.methylation.20160128/)


Data packages submitted to Bioconductor from 2015-11-01 release date of TCGA data.

- [RTCGA.mutations](http://bioconductor.org/packages/RTCGA.mutations/)
- [RTCGA.rnaseq](http://bioconductor.org/packages/RTCGA.rnaseq/)
- [RTCGA.clinical](http://bioconductor.org/packages/RTCGA.clinical/)
- [RTCGA.PANCAN12](http://bioconductor.org/packages/RTCGA.PANCAN12/)
- [RTCGA.mRNA](http://bioconductor.org/packages/RTCGA.mRNA/)
- [RTCGA.miRNASeq](http://bioconductor.org/packages/RTCGA.miRNASeq/)
- [RTCGA.RPPA](http://bioconductor.org/packages/RTCGA.RPPA/)
- [RTCGA.CNV](http://bioconductor.org/packages/RTCGA.CNV/)
- [RTCGA.methylation](http://bioconductor.org/packages/RTCGA.methylation/)


### Installation of packages from the `RTCGA` family: 

Windows users:
> Make sure you have [rtools](http://cran.r-project.org/bin/windows/Rtools/) installed on your computer.

```{R}
# some packages might be still only available on the devel version of Bioconductor
BiocInstaller::useDevel() # swiches to devel branchof Bioconductor - don't use this line if you are interested in release versions
source("https://bioconductor.org/biocLite.R") # downloads bioClite function
```

|package                    |installation                             |help                    |releaseDate  |
|:--------------------------|:----------------------------------------|:-----------------------|:------------|
|RTCGA.rnaseq.20160128      |`biocLite('RTCGA.rnaseq.20160128')`      |`?rnaseq.20160128`      |`2016-01-28` |
|RTCGA.clinical.20160128    |`biocLite('RTCGA.clinical.20160128')`    |`?clinical.20160128`    |`2016-01-28` |
|RTCGA.mutations.20160128   |`biocLite('RTCGA.mutations.20160128')`   |`?mutations.20160128`   |`2016-01-28` |
|RTCGA.mRNA.20160128        |`biocLite('RTCGA.mRNA.20160128')`        |`?mRNA.20160128`        |`2016-01-28` |
|RTCGA.miRNASeq.20160128    |`biocLite('RTCGA.miRNASeq.20160128')`    |`?miRNASeq.20160128`    |`2016-01-28` |
|RTCGA.RPPA.20160128        |`biocLite('RTCGA.RPPA.20160128')`        |`?RPPA.20160128`        |`2016-01-28` |
|RTCGA.CNV.20160128         |`biocLite('RTCGA.CNV.20160128')`         |`?CNV.20160128`         |`2016-01-28` |
|RTCGA.methylation.20160128 |`biocLite('RTCGA.methylation.20160128')` |`?methylation.20160128` |`2016-01-28` |
|RTCGA.rnaseq               |`biocLite('RTCGA.rnaseq')`               |`?rnaseq`               |`2015-11-01` |
|RTCGA.clinical             |`biocLite('RTCGA.clinical')`             |`?clinical`             |`2015-11-01` |
|RTCGA.mutations            |`biocLite('RTCGA.mutations')`            |`?mutations`            |`2015-11-01` |
|RTCGA.mRNA                 |`biocLite('RTCGA.mRNA')`                 |`?mRNA`                 |`2015-11-01` |
|RTCGA.miRNASeq             |`biocLite('RTCGA.miRNASeq')`             |`?miRNASeq`             |`2015-11-01` |
|RTCGA.PANCAN12             |`biocLite('RTCGA.PANCAN12')`             |`?pancan12`             |`NULL`       |
|RTCGA.RPPA                 |`biocLite('RTCGA.RPPA')`                 |`?RPPA`                 |`2015-11-01` |
|RTCGA.CNV                  |`biocLite('RTCGA.CNV')`                  |`?CNV`                  |`2015-11-01` |
|RTCGA.methylation          |`biocLite('RTCGA.methylation')`          |`?methylation`          |`2015-11-01` |

# RTCGA

Packages from the `RTCGA.data` - family/factory are based on the `RTCGA` package


### Installation of the [`RTCGA`](https://github.com/RTCGA/RTCGA) package: 
To get started, install the latest version of **RTCGA** from Bioconductor:

```{R}
BiocInstaller::useDevel() # swiches to devel branch of Bioconductor
source("https://bioconductor.org/biocLite.R") # downloads bioClite function
biocLite("RTCGA") # installs a package
```
or use below code to download the development version which is like to be less bugged than the release version on Bioconductor:
```{R}
if (!require(devtools)) {
    install.packages("devtools")
    require(devtools)
}
install_github("RTCGA/RTCGA", build_vignettes = TRUE)
```
To check Use Cases run
```{R}
browseVignettes("RTCGA")
```


<h4> Authors: </h4>

>
> Marcin Kosiński, m.p.kosinski@gmail.com
>
> Przemysław Biecek, przemyslaw.biecek@gmail.com
>
> Witold Chodor, witoldchodor@gmail.com
>

This repository is synchronized with it's Bioconductor's SVN devel mirror.


![RTCGA logo](https://avatars3.githubusercontent.com/u/15612915?v=3&s=300)
