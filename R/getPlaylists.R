#'Get the playlists of a specific user
#'
#'
#'function to get Info about the playlists of a specific user the user_id
#'@param user_id user id
#'@param offset The index of the first playlist to return. Default: 0 (the first object). Maximum offset: 100.000.
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@return get playlist from a specific user using a username
#'@export



#function to get playlists from a user
getPlaylists<-function(user_id,offset=0,token){
  req<-httr::GET(paste0("https://api.spotify.com/v1/users/",user_id,"/playlists?limit=50&offset=",offset),httr::config(token = token))
  json1<-httr::content(req)
  json2<-jsonlite::fromJSON(jsonlite::toJSON(json1))$items
  id<-unlist(json2$id)
  name<-unlist(json2$name)
  ownerid<-unlist(json2$owner$id)
  tracks<-unlist(json2$tracks$total)
  dados<-data.frame(id,name,ownerid,tracks,stringsAsFactors = F)
  return(dados)
}
