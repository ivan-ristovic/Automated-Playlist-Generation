library(spotifyr)

library(stringr)
library(httr)
library(purrr)
library(tibble)
library(tidyr)
library(dplyr)
library(lubridate)

# original: https://github.com/rohilrg/An-deep-insight-into-the-different-song-features-using-Spotify-Web-Api

Sys.setenv(SPOTIFY_CLIENT_ID='4779f4871cbc4c8fa6901a12c5b203ac')
Sys.setenv(SPOTIFY_CLIENT_SECRET='71794f7d8a6f49989331038083397f9a')

message('Getting access token... ')

access_token <- get_spotify_access_token(client_id = Sys.getenv('SPOTIFY_CLIENT_ID'), client_secret = Sys.getenv('SPOTIFY_CLIENT_SECRET'))

message('Done!\n')

##Accumulation of Data
eminem <-get_artist_audio_features('eminem')
eminem$artist_name <- "Eminem"
pink_floyd <- get_artist_audio_features('pink floyd')
pink_floyd$artist_name <- "Pink Floyd"
aerosimth<- get_artist_audio_features('aerosmith')
aerosimth$artist_name <- "Aerosmith"
metallica <- get_artist_audio_features('metallica')
metallica$artist_name <- "Metallica"
dr_dre <- get_artist_audio_features('dr. dre')
dr_dre$artist_name <- "Dr. Dre"
two_pac <- get_artist_audio_features('2pac')
two_pac$artist_name <- "2Pac"
highlight_tribe <- get_artist_audio_features('hilight tribe')
highlight_tribe$artist_name <- "Hilight Tribe"
Rihanna<- get_artist_audio_features('Rihanna')
Rihanna$artist_name <- "Rihanna"
DAFT_punk <- get_artist_audio_features('Daft Punk')
DAFT_punk$artist_name <- "Daft Punk"
Johnny_Cash <- get_artist_audio_features('Johnny Cash')
Johnny_Cash$artist_name <- "Johnny Cash"
John_Denver <- get_artist_audio_features('John Denver')
John_Denver$artist_name <- "John Denver"
Tim_MCGRAW <- get_artist_audio_features('Tim McGraw')
Tim_MCGRAW$artist_name <- "Tim McGraw"
Don_Willams <- get_artist_audio_features('Don Williams')
Don_Willams$artist_name <- "Don Williams"
Kis_KUm <- get_artist_audio_features('Kishore')
Kis_KUm$artist_name <- "Kishore Kumar"
Bryan_Adams <- get_artist_audio_features('Bryan Adams')
Bryan_Adams$artist_name <- "Bryan Adams"
Edith_Piaf <- get_artist_audio_features('Edith Piaf')
Edith_Piaf$artist_name <- "Edith Piaf"
Skrillex <- get_artist_audio_features('Skrillex')
Skrillex$artist_name <- "Skrillex"
Kendrick_Lamar <- get_artist_audio_features('Kendrick Lamar')
Kendrick_Lamar$artist_name <- "Kendrick Lamar"
Miles_Davis <- get_artist_audio_features('Miles Davis')
Miles_Davis$artist_name <- "Miles Davis"
Cab_Calloway <- get_artist_audio_features("Cab Calloway")
Cab_Calloway$artist_name <- "Cab Calloway"
Serge_Gainsbourg <- get_artist_audio_features('Serge Gainsbourg')
Serge_Gainsbourg$artist_name <- "Serge Gainsbourg"
Beyonce <- get_artist_audio_features('Beyonce')
Beyonce$artist_name <- "Beyonce"
Enrique <- get_artist_audio_features('Enrique')
Enrique$artist_name <- "Enrique Iglesias"
Queen <- get_artist_audio_features('Queen')
Queen$artist_name <- "Queen"
Kumar_Sanu <- get_artist_audio_features('Kumar Sanu')
Kumar_Sanu$artist_name <- "Kumar Sanu"
Radiohead <- get_artist_audio_features('Radiohead')
Radiohead$artist_name <- "Radiohead"
Alizee <- get_artist_audio_features('Alizee')
Alizee$artist_name <- "Alizée"
Eric_Clapton <- get_artist_audio_features('Eric Clapton')
Eric_Clapton$artist_name <- "Eric Clapton"
Don_Mclean <- get_artist_audio_features('Don McLean')
Don_Mclean$artist_name <- "Don McLean"
Sezen_Aksu <- get_artist_audio_features('Sezen Aksu')
Sezen_Aksu$artist_name <- "Sezen Aksu"
Black_Sabbath <- get_artist_audio_features('Black Sabbath')
Black_Sabbath$artist_name <- "Black Sabbath"
U_two <- get_artist_audio_features('U2')
U_two$artist_name <- "U2"
Beatles <- get_artist_audio_features('The Beatles')
Beatles$artist_name <- "The Beatles"
Jimi_Hendrix <- get_artist_audio_features('Jimi Hendrix')
Jimi_Hendrix$artist_name <- "Jimi Hendrix"
Vicente_Fernandez <- get_artist_audio_features('Vicente Fernandez')
Vicente_Fernandez$artist_name <- "Vicente Fernandez"
KK <- get_artist_audio_features('KK')
KK$artist_name <- "KK"
Bon_Jovi <- get_artist_audio_features('Bon Jovi')
Bon_Jovi$artist_name <- "Bon Jovi"

#Combining the Dataset
combined_dataset <- rbind(eminem,pink_floyd,aerosimth,dr_dre,two_pac, highlight_tribe, Rihanna, DAFT_punk, Johnny_Cash,
                          John_Denver, Tim_MCGRAW, Don_Willams,Kis_KUm, Bryan_Adams, Edith_Piaf, Skrillex,
                          Kendrick_Lamar, Miles_Davis, Cab_Calloway, Serge_Gainsbourg, Beyonce, Enrique, Queen, 
                          Kumar_Sanu, Radiohead, Alizee, Don_Mclean, Eric_Clapton, Sezen_Aksu, Black_Sabbath
                          ,U_two, Beatles, Jimi_Hendrix, Vicente_Fernandez, KK, Bon_Jovi) 
write.csv(combined_dataset, "Music_Dataset.csv")
