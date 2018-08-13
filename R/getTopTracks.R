#'Get top tracks of an Artist
#'
#'
#'function to get top tracks of an Artist.
#'@param artist_id Artist ID
#'@param country Country of interest
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

#function to get top tracks using artist ID and country
#to find the ID use searchArtist
getTopTracks<-function(artist_id, country, token){
  req<-httr::content(httr::GET(
    paste0("https://api.spotify.com/v1/artists/",artist_id,
           "/top-tracks?country=",country),
    httr::config(token = token)))
  return(
    dplyr::bind_rows(
      lapply(req$tracks, function(x)
        data.frame(artist_id = x$id, name = x$name, popularity = x$popularity,
                   duration_ms = x$duration_ms, track_number = x$track_number,
                   available_markets = paste(x$available_markets, collapse = ";"),
                   stringsAsFactors = F))))
}
