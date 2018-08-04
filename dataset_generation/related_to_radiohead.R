library(spotifyr)

library(stringr)
library(httr)
library(purrr)
library(tibble)
library(tidyr)
library(dplyr)
library(lubridate)
library(knitr)

Sys.setenv(SPOTIFY_CLIENT_ID='4779f4871cbc4c8fa6901a12c5b203ac')
Sys.setenv(SPOTIFY_CLIENT_SECRET='71794f7d8a6f49989331038083397f9a')

message('Getting access token... ')
access_token <- get_spotify_access_token(client_id = Sys.getenv('SPOTIFY_CLIENT_ID'), client_secret = Sys.getenv('SPOTIFY_CLIENT_SECRET'))
message('Done!')

message('Getting Radiohead info...')
Radiohead <- get_artist_audio_features('Radiohead')
Radiohead$artist_name <- "Radiohead"
message('Done!')

# getting similar artists and their disography
source("get_related_artists.R")
message('Getting related artists..')
related_to_Radiohead <- get_related_artists('Radiohead')
message('Done!')

related_to_Radiohead %>% kable()

for (artist in related_to_Radiohead$artist_name)
{
    message(paste("Getting the data about: ", artist))
    data <- get_artist_audio_features(artist)
    data$artist_name = artist
    write.table(data, "test.csv", append = TRUE, sep = ",")
}
