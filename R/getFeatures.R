#'Get audio feature information for a single track
#'
#'
#'function to get audio feature information for a single track identified by its unique Spotify ID.
#'@param track_id The Spotify ID for the track.
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

getFeatures<-function(track_id,token){
  req <- httr::GET(paste0("https://api.spotify.com/v1/audio-features/",track_id), httr::config(token = token))
  json1<-httr::content(req)
  dados=data.frame(id=json1$id,
                   danceability=json1$danceability,
                   energy=json1$energy,
                   key=json1$key,
                   loudness=json1$loudness,
                   mode=json1$mode,
                   speechiness=json1$speechiness,
                   acousticness=json1$acousticness,
                   instrumentalness=json1$instrumentalness,
                   liveness=json1$liveness,
                   valence=json1$valence,
                   tempo=json1$tempo,
                   duration_ms=json1$duration_ms,
                   time_signature=json1$time_signature,
                   uri=json1$uri,
                   analysis_url=json1$analysis_url,stringsAsFactors = F)
  return(dados)
}
