#'Get albums from an Artist
#'
#'
#'function to get albums from an artist using their ID
#'@param artist_id The Spotify ID for the artist.
#'@param market Optional. An ISO 3166-1 alpha-2 country code. Supply this parameter to limit the response to one particular geographical market. For example, for albums available in Sweden: market=SE.
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@return 'Get Albums from an Artist
#'@export
#'@examples \dontrun{
#'
#'
#'
#' foofighters_albums<-getAlbums("7jy3rLJdDQY21OgRLCZ9sD",market="US",token)
#'
#'}
#'
getAlbums<-function(artist_id,market="US",token){
  total<-httr::content(httr::GET(paste0("https://api.spotify.com/v1/artists/",artist_id,"/albums?album_type=album"),
                                 httr::config(token = token)))$total
  req<-httr::GET(paste0("https://api.spotify.com/v1/artists/",artist_id,
                        "/albums?offset=0&limit=",total,
                        "&album_type=album&market=",market),
                 httr::config(token = token))
  return(lapply(httr::content(req)$items,
                function(x) data.frame(
                  id = x$id,
                  name = x$name,
                  album_type = x$album_type,
                  available_markets = paste(x$available_markets, collapse = ";"),
                  stringsAsFactors = F)) %>%
                  dplyr::bind_rows())
}

if(getRversion() >= "2.15.1")  utils::globalVariables(c("%>%"))
