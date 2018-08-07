#' Search for a specific artist
#'
#'
#'function to get basic info about a searched artist
#'@param artist_name Name of the artist
#'@param token An OAuth token created with \code{spotifyOAuth}.
#' @examples \dontrun{
#'
#' my_oauth <- spotifyOAuth(app_id="xxxx",client_id="yyyy",client_secret="zzzz")
#' save(my_oauth, file="my_oauth")
#' load("my_oauth")
#' foofighters <- searchArtist("Foo+fighters",token=my_oauth)
#' }
#'@export

#function to search for a specifc artist
#note that if you don't provide a specifc name the function will return possible cases that match
#sorted by popularity
searchArtist<-function(artist_name,token){
  req <- httr::GET(paste0("https://api.spotify.com/v1/search?q=", gsub(' ', '+', artist_name),"&type=artist"), httr::config(token = token))
  json1 <- httr::content(req)
  x<-json1$artists$items
  artist=unlist(lapply(x,function(x)x$name))
  id<-unlist(lapply(x,function(x)x$id))
  popularity<-unlist(lapply(x,function(x)x$popularity))
  followers<-unlist(lapply(x,function(x)x$followers$total))
  genres<-unlist(lapply(x,function(x)paste(x$genres,collapse=",")))
  type<-unlist(lapply(x,function(x)x$type))
  dados <- data.frame(artist, id, popularity,followers,genres,type, stringsAsFactors = F)
  return(dados)
}
