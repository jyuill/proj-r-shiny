library(jsonlite)

yt.group <- fromJSON("yt-grp-list-mea.json")
yt.group <- as.data.frame(yt.group)
yt.ids <- yt.group$items.resource[[2]]
yt.ids <- paste(yt.ids,collapse="|")
writeClipboard(yt.ids)