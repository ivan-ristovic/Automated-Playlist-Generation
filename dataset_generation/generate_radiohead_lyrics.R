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


Sys.setenv(SPOTIFY_CLIENT_ID='4779f4871cbc4c8fa6901a12c5b203ac')
Sys.setenv(SPOTIFY_CLIENT_SECRET='71794f7d8a6f49989331038083397f9a')

message('Getting access token... ')
access_token <- get_spotify_access_token(client_id = Sys.getenv('SPOTIFY_CLIENT_ID'), client_secret = Sys.getenv('SPOTIFY_CLIENT_SECRET'))
message('Done!')

message('Getting Radiohead info...')
Radiohead <- get_artist_audio_features('Radiohead')
Radiohead$artist_name <- "Radiohead"
message('Done!')


# getting lyrics
source("geniusR.R")

all_lyrics <- list()
i <- 1
for (track in Radiohead$track_name)
{
    track_uri <- Radiohead$track_uri[i]
    i <- i+ 1
    message(paste("Getting the lyrics for song: ", track, " track_uri: ", track_uri))
    lyrics <- list()
    tryCatch(
        {
            lyrics <- genius_lyrics(artist = "Radiohead", song = track)
            lyrics$track_uri = track_uri
            all_lyrics <- rbind(all_lyrics, lyrics)
            #write.table(lyrics, "lyrics_creep.csv", append = TRUE, sep = ",")
        },
        error=function(cond) {
            message(paste("Lyrics do not seem to exist:", track))
            message("Here's the original error message:")
            message(cond)
        }
    )
    
    #data <- genius_lyrics(artist = "Radiohead", song = track)
    #data %>% kable()
    #write.table(data, "lyrics.csv", append = TRUE, sep = ",")
}

write.csv(all_lyrics, "radiohead_lyrics.csv")
