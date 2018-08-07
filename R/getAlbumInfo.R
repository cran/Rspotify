#'Get additional album info
#'
#'
#'function to get additional album info from an artist using the Album ID
#'@param album_id The Spotify ID for the album..
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@return 'Get an Artist’s Albums
#'@export
getAlbumInfo<-function(album_id,token){
  req<-httr::GET(paste0("https://api.spotify.com/v1/albums/",album_id),httr::config(token = token))
  json1<-httr::content(req)
  json2<-jsonlite::fromJSON(jsonlite::toJSON(json1))
  df <- data.frame("id" = json2$id, "artist" = as.character(json2$artists$name),"name" = json2$name, "label" = json2$label, "popularity" = json2$popularity, "release_date" = json2$release_date, "album_type" = json2$album_type, "track_total" = json2$tracks$total)
  return(df)
}
