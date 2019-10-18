
library(datasets)
library(highcharter)
library(data.table)

#setup data
wp = copy(WorldPhones)
wp = setDT(as.data.frame(wp))

wp[, Year := rownames(WorldPhones)]

wp = melt(wp, id.vars = "Year")
