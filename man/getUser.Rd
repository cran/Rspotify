% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getUser.R
\name{getUser}
\alias{getUser}
\title{Get basic information about an User}
\usage{
getUser(user_id, token)
}
\arguments{
\item{user_id}{user id}

\item{token}{An OAuth token created with \code{spotifyOAuth}.}
}
\description{
function to get User's basic information
}
\examples{
\dontrun{

 my_oauth <- spotifyOAuth(app_id="xxxx",client_id="yyyy",client_secret="zzzz")
 save(my_oauth, file="my_oauth")
 load("my_oauth")
 tiago <- getUser(user_id="t.mendesdantas",token=my_oauth)
}


}
