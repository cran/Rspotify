#'Get a Track
#'
#'
#'Get Spotify catalog information for a single track identified by its unique Spotify ID.
#'@param track_id The Spotify ID for the track.
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

getTrack<-function(track_id, token){
  req<-httr::content(httr::GET(paste0("https://api.spotify.com/v1/tracks/",track_id),
                               httr::config(token = token)))
  return(data.frame(
    track_id=req$id,
    name=req$name,
    explicit=req$explicit,
    popularity=req$popularity,
    artists = paste(lapply(req$artists, function(x) x$name), collapse = ";"),
    artists_id=paste(lapply(req$artists, function(x) x$id), collapse = ";"),
    album=req$album$name,
    album_id=req$album$id))
}
