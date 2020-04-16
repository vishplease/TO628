
#### LOAD PACKAGES (install everything in parentheses first if you don't have it)

pacman::p_load(pacman, tidyverse, knitr, lubridate, ggjoy, spotifyr, DataExplorer, data.table, dtplyr)

#### AUTHENTICATE SPOTIFY API

Sys.setenv(SPOTIFY_CLIENT_ID = '')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '')
access_token <- get_spotify_access_token()
get_spotify_authorization_code()

# ACCESS SPOTIFY ACCOUNT

my_id <- 'vishplease'

# GET LIST OF ALL FOLLOWED PLAYLISTS

my_plists <- get_user_playlists(my_id)

#REVIEW PLAYLISTS

my_plists %>% 
  select(name) 

# GET DAILY MIX PLAYLIST DETAILS

#Extract Salsa Playlists

plist.dm1 <- my_plists %>% 
  filter(name %in% "Salsa Dominicana") %>% 
  data.table()

plist.dm2 <- my_plists %>% 
  filter(name %in% "Salsa Colombiana") %>% 
  data.table()

plist.dm3 <- my_plists %>% 
  filter(name %in% "Salsa Boricua") %>% 
  data.table()

plist.dm4 <- my_plists %>% 
  filter(name %in% "Salsa Cubana") %>% 
  data.table()

plist.dm5 <- my_plists %>% 
  filter(name %in% "Dame Salsa") %>% 
  data.table()

plist.dm6 <- my_plists %>% 
  filter(name %in% "Salsa Classics") %>% 
  data.table()

plist.dm7 <- my_plists %>% 
  filter(name %in% "Salsa Clásica") %>% 
  data.table()

#Get Playlist Tracks

plist.dm1.tracks <- plist.dm1$id %>% 
  get_playlist_tracks() %>% 
  data.table()


plist.dm2.tracks <- plist.dm2$id %>% 
  get_playlist_tracks() %>% 
  data.table()


plist.dm3.tracks <- plist.dm3$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist.dm4.tracks <- plist.dm4$id %>% 
  get_playlist_tracks() %>% 
  data.table()


plist.dm5.tracks <- plist.dm5$id %>% 
  get_playlist_tracks() %>% 
  data.table() 


plist.dm6.tracks <- plist.dm6$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist.dm7.tracks <- plist.dm7$id %>% 
  get_playlist_tracks() %>% 
  data.table()



# Get Playlist Features


plist.dm1.features <- plist.dm1.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()


plist.dm2.features <- plist.dm2.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm3.features <- plist.dm3.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm4.features <- plist.dm4.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm5.features <- plist.dm5.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm6.features <- plist.dm6.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm7.features <- plist.dm7.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

# Rename A Column In Tracks To Match Features

names(plist.dm1.tracks)[names(plist.dm1.tracks) == "track.uri"] <- "uri"
names(plist.dm2.tracks)[names(plist.dm2.tracks) == "track.uri"] <- "uri"
names(plist.dm3.tracks)[names(plist.dm3.tracks) == "track.uri"] <- "uri"
names(plist.dm4.tracks)[names(plist.dm4.tracks) == "track.uri"] <- "uri"
names(plist.dm5.tracks)[names(plist.dm5.tracks) == "track.uri"] <- "uri"
names(plist.dm6.tracks)[names(plist.dm6.tracks) == "track.uri"] <- "uri"
names(plist.dm7.tracks)[names(plist.dm7.tracks) == "track.uri"] <- "uri"



# Join On "uri"

plist.dm1 <- plist.dm1.tracks %>% 
  left_join(plist.dm1.features, by="uri")

plist.dm2 <- plist.dm2.tracks %>% 
  left_join(plist.dm2.features, by="uri")

plist.dm3 <- plist.dm3.tracks %>% 
  left_join(plist.dm3.features, by="uri")

plist.dm4 <- plist.dm4.tracks %>% 
  left_join(plist.dm4.features, by="uri")

plist.dm5 <- plist.dm5.tracks %>% 
  left_join(plist.dm5.features, by="uri")

plist.dm6 <- plist.dm6.tracks %>% 
  left_join(plist.dm6.features, by="uri")

plist.dm7 <- plist.dm7.tracks %>% 
  left_join(plist.dm7.features, by="uri")

plist.dm1$playlist <- "Salsa Dominicana"
plist.dm2$playlist <- "Salsa Colombiana"
plist.dm3$playlist <- "Salsa Boricua"
plist.dm4$playlist <- "Salsa Cubana"
plist.dm5$playlist <- "Dame Salsa"
plist.dm6$playlist <- "Salsa Classics"
plist.dm7$playlist <- "Salsa Clasica"

# Combine Into Master Salsa Data Table

salsa <- rbind(plist.dm1, 
               plist.dm2, 
               plist.dm3, 
               plist.dm4, 
               plist.dm5, 
               plist.dm6,
               plist.dm7)

#Dedupe Data Table

salsa <- salsa %>% 
  distinct(uri, .keep_all = T)

#extract primary artist name and URI

primary.artist.name <- salsa$track.artists %>% 
  sapply(function(x) x[3]) %>% 
  sapply(function(y) y[1]) %>% 
  data.table() 

primary.artist.uri <- salsa$track.artists %>% 
  sapply(function(x) x[5]) %>% 
  sapply(function(y) y[1]) %>% 
  data.table() 

names(primary.artist.name)[1] <- "primaryartist_name"
names(primary.artist.uri)[1] <- "primaryartist_uri"

primary.artist.name$primaryartist_name <- as.character(primary.artist.name$primaryartist_name) 
primary.artist.uri$primaryartist_uri <- as.character(primary.artist.uri$primaryartist_uri)

#add primary artist name and URI to master salsa dataframe

salsa <- salsa %>% 
  add_column(primary.artist.name) 

salsa <- salsa %>% 
  add_column(primary.artist.uri) 


#Remove "list" columns from table


salsa$track.album.artists <- NULL
salsa$track.album.available_markets <- NULL
salsa$track.album.images <- NULL
salsa$track.artists <- NULL
salsa$track.available_markets <- NULL
salsa$added_at <- NULL



#Select Relevant Columns

salsa <- salsa %>% 
  select(uri, playlist,
         track.name,
         track.album.name,
         track.album.release_date,
         track.popularity,
         primaryartist_name,
         primaryartist_uri,
         key,
         loudness,
         mode,
         speechiness,
         acousticness,
         instrumentalness,
         liveness,
         valence,
         tempo,
         duration_ms,
         time_signature
  )


#EXPORT CSV

fwrite(salsa, file = "output/spotify_salsa.csv")