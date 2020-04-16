
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
my_plists2 <- get_user_playlists(my_id, offset = 20)

my_plists <- rbind(my_plists, my_plists2)

#REVIEW PLAYLISTS

my_plists %>% 
  select(name) 

# GET PLAYLIST DETAILS

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

#----Second Wave of Salsa Songs

plist.dm8 <- my_plists %>% 
  filter(name %in% "Salsa Nation") %>% 
  data.table()

plist.dm9 <- my_plists %>% 
  filter(name %in% "Salsa Hits: Los 90s") %>% 
  data.table()

plist.dm10 <- my_plists %>% 
  filter(name %in% "Salsa: Los '70") %>% 
  data.table()

plist.dm11 <- my_plists %>% 
  filter(name %in% "Salsa: Los '80") %>% 
  data.table()

plist.dm12 <- my_plists %>% 
  filter(name %in% "Pura Salsa") %>% 
  data.table()

plist.dm13 <- my_plists %>% 
  filter(name %in% "Colombian Salsa Top 100") %>% 
  data.table()

plist.dm14 <- my_plists %>% 
  filter(name %in% "Classic Salsa") %>% 
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

#----Second Wave of Salsa Songs

plist.dm8.tracks <- plist.dm8$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist.dm9.tracks <- plist.dm9$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist.dm10.tracks <- plist.dm10$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist.dm11.tracks <- plist.dm11$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist.dm12.tracks <- plist.dm12$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist.dm13.tracks <- plist.dm13$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist.dm14.tracks <- plist.dm14$id %>% 
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

#----Second Wave of Salsa Songs

plist.dm8.features <- plist.dm8.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm9.features <- plist.dm9.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm10.features <- plist.dm10.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm11.features <- plist.dm11.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm12.features <- plist.dm12.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm13.features <- plist.dm13.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist.dm14.features <- plist.dm14.tracks$track.id %>% 
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

names(plist.dm8.tracks)[names(plist.dm8.tracks) == "track.uri"] <- "uri"
names(plist.dm9.tracks)[names(plist.dm9.tracks) == "track.uri"] <- "uri"
names(plist.dm10.tracks)[names(plist.dm10.tracks) == "track.uri"] <- "uri"
names(plist.dm11.tracks)[names(plist.dm11.tracks) == "track.uri"] <- "uri"
names(plist.dm12.tracks)[names(plist.dm12.tracks) == "track.uri"] <- "uri"
names(plist.dm13.tracks)[names(plist.dm13.tracks) == "track.uri"] <- "uri"
names(plist.dm14.tracks)[names(plist.dm14.tracks) == "track.uri"] <- "uri"

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

plist.dm8 <- plist.dm8.tracks %>% 
  left_join(plist.dm8.features, by="uri")

plist.dm9 <- plist.dm9.tracks %>% 
  left_join(plist.dm9.features, by="uri")

plist.dm10 <- plist.dm10.tracks %>% 
  left_join(plist.dm10.features, by="uri")

plist.dm11 <- plist.dm11.tracks %>% 
  left_join(plist.dm11.features, by="uri")

plist.dm12 <- plist.dm12.tracks %>% 
  left_join(plist.dm12.features, by="uri")

plist.dm13 <- plist.dm13.tracks %>% 
  left_join(plist.dm13.features, by="uri")

plist.dm14 <- plist.dm14.tracks %>% 
  left_join(plist.dm14.features, by="uri")

plist.dm1$playlist <- "Salsa Dominicana"
plist.dm2$playlist <- "Salsa Colombiana"
plist.dm3$playlist <- "Salsa Boricua"
plist.dm4$playlist <- "Salsa Cubana"
plist.dm5$playlist <- "Dame Salsa"
plist.dm6$playlist <- "Salsa Classics"
plist.dm7$playlist <- "Salsa Clasica"

plist.dm8$playlist <- "Salsa Nation"
plist.dm9$playlist <- "Salsa Hits: Los 90s"
plist.dm10$playlist <- "Salsa: Los '70"
plist.dm11$playlist <- "Salsa: Los '80"
plist.dm12$playlist <- "Pura Salsa"
plist.dm13$playlist <- "Colombian Salsa Top 100"
plist.dm14$playlist <- "Classic Salsa"

# Combine Into Master Salsa Data Table

salsa <- rbind(plist.dm1, 
               plist.dm2, 
               plist.dm3, 
               plist.dm4, 
               plist.dm5, 
               plist.dm6,
               plist.dm7,
               plist.dm8,
               plist.dm9,
               plist.dm10,
               plist.dm11,
               plist.dm12,
               plist.dm13,
               plist.dm14)

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

#hardcode genre 

salsa$genre <- "salsa"


#Remove "list" columns from table


salsa$track.album.artists <- NULL
salsa$track.album.available_markets <- NULL
salsa$track.album.images <- NULL
salsa$track.artists <- NULL
salsa$track.available_markets <- NULL
salsa$added_at <- NULL



#Select Relevant Columns

salsa <- salsa %>% 
  select(uri, playlist, genre,
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