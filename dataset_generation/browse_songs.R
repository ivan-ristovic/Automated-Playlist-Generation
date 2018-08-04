library(spotifyr)

library(stringr)
library(httr)
library(purrr)
library(tibble)
library(tidyr)
library(dplyr)
library(lubridate)
library(knitr) # for kable()
library(readr) # readlines
library(rvest) # htmlsession for geniousR

# browse new-releases
# browse featured-playlists
# browse catogiries
# get list of tracks
# get artist, get disography, get similar artists?


Sys.setenv(SPOTIFY_CLIENT_ID='4779f4871cbc4c8fa6901a12c5b203ac')
Sys.setenv(SPOTIFY_CLIENT_SECRET='71794f7d8a6f49989331038083397f9a')

message('Getting access token... ')
access_token <- get_spotify_access_token(client_id = Sys.getenv('SPOTIFY_CLIENT_ID'), client_secret = Sys.getenv('SPOTIFY_CLIENT_SECRET'))
message('Done!')

message('Browsing new-releases...')

# TODO: browse new releases/categories and generate dataset

# some code here...

#message('Combining data into csv...')
#combined_dataset <- rbind(data1, data2) 
#write.csv(combined_dataset, "data.csv")
#message('Done!')
