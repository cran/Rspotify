#' Get Spotify catalog information for a single artist
#'
#'
#'Function to get Spotify catalog information for a single artist identified by their unique Spotify ID.
#'@param artist_id The Spotify ID of the artist.
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@return Get Spotify catalog information for a single artist identified by its unique Spotify ID.
#'@export
#'@examples \dontrun{
#'
#'
#'
#'foofighters<-getArtist("7jy3rLJdDQY21OgRLCZ9sD",token)
#'
#'}
#'
getArtist<-function(artist_id, token){
  req <- httr::GET(paste0("https://api.spotify.com/v1/artists/",artist_id),
                   httr::config(token = token))
  json1<-httr::content(req)
  dados<-data.frame(name=json1$name,
                    id=json1$id,
                    popularity=json1$popularity,
                    followers=json1$followers$total,
                    genres=paste(json1$genres,collapse =";"))
  return(dados)
}

