
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

###############################################################
# GET PLAYLIST DETAILS
###############################################################


###############################################################
#Extract Playlists
###############################################################

plist1 <- my_plists %>% 
  filter(name %in% "Country Music 101:  Country's Greatest Hits") %>% 
  data.table()

plist2 <- my_plists %>% 
  filter(name %in% "Country's Greatest Hits:  The '60s") %>% 
  data.table()

plist3 <- my_plists %>% 
  filter(name %in% "Dance Hits") %>% 
  data.table()

plist4 <- my_plists %>% 
  filter(name %in% "Dubstep Don") %>% 
  data.table()
  
plist5 <- my_plists %>% 
  filter(name %in% "RapCaviar") %>% 
  data.table() 
  
plist6 <- my_plists %>% 
  filter(name %in% "Hip-Hop Anthems: Def Jam") %>% 
  data.table()   

plist7 <- my_plists %>% 
  filter(name %in% "Get Turnt") %>% 
  data.table()     
  
plist8 <- my_plists %>% 
  filter(name %in% "80's Metal & Rock") %>% 
  data.table()
  
plist9 <- my_plists %>% 
  filter(name %in% "Classical Essentials") %>% 
  data.table()   

plist10 <- my_plists %>% 
  filter(name %in% "Classical New Releases") %>% 
  data.table()  

plist11 <- my_plists %>% 
  filter(name %in% "Classical Focus") %>% 
  data.table()  

plist12 <- my_plists %>% 
  filter(name %in% "Stand-up Comedy") %>% 
  data.table()  

###############################################################
# Get Playlist Tracks
###############################################################

#Country
plist1.tracks <- plist1$id %>% 
  get_playlist_tracks() %>% 
  data.table()


plist2.tracks <- plist2$id %>% 
  get_playlist_tracks() %>% 
  data.table()

#Electronic
plist3.tracks <- plist3$id %>% 
  get_playlist_tracks() %>% 
  data.table()

#plist3 offset
plist3.tracks_off1 <- plist3$id %>% 
  get_playlist_tracks(offset = 100) %>% 
  data.table()


plist4.tracks <- plist4$id %>% 
  get_playlist_tracks() %>% 
  data.table()

#plist4 offset
plist4.tracks_off1 <- plist4$id %>% 
  get_playlist_tracks(offset = 100) %>% 
  data.table()

#HipHop
plist5.tracks <- plist5$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist6.tracks <- plist6$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist7.tracks <- plist7$id %>% 
  get_playlist_tracks() %>% 
  data.table()

#Rock

plist8.tracks <- plist8$id %>% 
  get_playlist_tracks() %>% 
  data.table()

#plist8 offset 1
plist8.tracks_off1 <- plist8$id %>% 
  get_playlist_tracks(offset = 100) %>% 
  data.table()

#plist8 offset 2
plist8.tracks_off2 <- plist8$id %>% 
  get_playlist_tracks(offset = 200) %>% 
  data.table()

plist8.tracks <- plist8.tracks %>% 
  select(colnames(plist8.tracks_off1))

#Classical

plist9.tracks <- plist9$id %>% 
  get_playlist_tracks() %>% 
  data.table()

#plist9 offset 1
plist9.tracks_off1 <- plist9$id %>% 
  get_playlist_tracks(offset = 100) %>% 
  data.table()


plist10.tracks <- plist10$id %>% 
  get_playlist_tracks() %>% 
  data.table()

plist11.tracks <- plist11$id %>% 
  get_playlist_tracks() %>% 
  data.table()

#plist11 offset 1
plist11.tracks_off1 <- plist11$id %>% 
  get_playlist_tracks(offset = 100) %>% 
  data.table()

#Comedy

plist12.tracks <- plist12$id %>% 
  get_playlist_tracks(offset = 100) %>% 
  data.table()

#plist12 offset 1

plist12.tracks_off1 <- plist12$id %>% 
  get_playlist_tracks(offset = 300) %>% 
  data.table()

#plist12 offset 2

plist12.tracks_off2 <- plist12$id %>% 
  get_playlist_tracks(offset = 600) %>% 
  data.table()


###############################################################
# Get Playlist Features
###############################################################

plist1.features <- plist1.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()


plist2.features <- plist2.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()


plist3.features <- plist3.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist3.features_off1 <- plist3.tracks_off1$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist4.features <- plist4.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist4.features_off1 <- plist4.tracks_off1$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist5.features <- plist5.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist6.features <- plist6.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist7.features <- plist7.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist8.features <- plist8.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()


plist8.features_off1 <- plist8.tracks_off1$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist8.features_off2 <- plist8.tracks_off2$track.id %>% 
  get_track_audio_features() %>% 
  data.table()


plist9.features <- plist9.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist9.features_off1 <- plist9.tracks_off1$track.id %>% 
  get_track_audio_features() %>% 
  data.table()


plist10.features <- plist10.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist11.features <- plist11.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist11.features_off1 <- plist11.tracks_off1$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist12.features <- plist12.tracks$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist12.features_off1 <- plist12.tracks_off1$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

plist12.features_off2 <- plist12.tracks_off2$track.id %>% 
  get_track_audio_features() %>% 
  data.table()

###############################################################
# Rename Column In Tracks To Match Features
###############################################################


names(plist1.tracks)[names(plist1.tracks) == "track.uri"] <- "uri"

names(plist2.tracks)[names(plist2.tracks) == "track.uri"] <- "uri"

names(plist3.tracks)[names(plist3.tracks) == "track.uri"] <- "uri"

names(plist3.tracks_off1)[names(plist3.tracks_off1) == "track.uri"] <- "uri"

names(plist4.tracks)[names(plist4.tracks) == "track.uri"] <- "uri"

names(plist4.tracks_off1)[names(plist4.tracks_off1) == "track.uri"] <- "uri"

names(plist5.tracks)[names(plist5.tracks) == "track.uri"] <- "uri"

names(plist6.tracks)[names(plist6.tracks) == "track.uri"] <- "uri"
names(plist7.tracks)[names(plist7.tracks) == "track.uri"] <- "uri"

names(plist8.tracks)[names(plist8.tracks) == "track.uri"] <- "uri"
names(plist8.tracks_off1)[names(plist8.tracks_off1) == "track.uri"] <- "uri"
names(plist8.tracks_off2)[names(plist8.tracks_off2) == "track.uri"] <- "uri"

names(plist9.tracks)[names(plist9.tracks) == "track.uri"] <- "uri"
names(plist9.tracks_off1)[names(plist9.tracks_off1) == "track.uri"] <- "uri"

names(plist10.tracks)[names(plist10.tracks) == "track.uri"] <- "uri"

names(plist11.tracks)[names(plist11.tracks) == "track.uri"] <- "uri"
names(plist11.tracks_off1)[names(plist11.tracks_off1) == "track.uri"] <- "uri"

names(plist12.tracks)[names(plist12.tracks) == "track.uri"] <- "uri"
names(plist12.tracks_off1)[names(plist12.tracks_off1) == "track.uri"] <- "uri"
names(plist12.tracks_off2)[names(plist12.tracks_off2) == "track.uri"] <- "uri"

###############################################################
# Join On URI
###############################################################

plist1 <- plist1.tracks %>% 
  left_join(plist1.features, by="uri")

plist2 <- plist2.tracks %>% 
  left_join(plist2.features, by="uri")

plist3 <- plist3.tracks %>% 
  left_join(plist3.features, by="uri")

plist3_off1 <- plist3.tracks_off1 %>% 
  left_join(plist3.features_off1, by="uri")

plist4 <- plist4.tracks %>% 
  left_join(plist4.features, by="uri")

plist4_off1 <- plist4.tracks_off1 %>% 
  left_join(plist4.features_off1, by="uri")

plist5 <- plist5.tracks %>% 
  left_join(plist5.features, by="uri")

plist6 <- plist6.tracks %>% 
  left_join(plist6.features, by="uri")

plist7 <- plist7.tracks %>% 
  left_join(plist7.features, by="uri")

plist8 <- plist8.tracks %>% 
  left_join(plist8.features, by="uri")

plist8_off1 <- plist8.tracks_off1 %>% 
  left_join(plist8.features_off1, by="uri")

plist8_off2 <- plist8.tracks_off2 %>% 
  left_join(plist8.features_off2, by="uri")

plist9 <- plist9.tracks %>% 
  left_join(plist9.features, by="uri")

plist9_off1 <- plist9.tracks_off1 %>% 
  left_join(plist9.features_off1, by="uri")

plist10 <- plist10.tracks %>% 
  left_join(plist10.features, by="uri")

plist11 <- plist11.tracks %>% 
  left_join(plist11.features, by="uri")

plist11_off1 <- plist11.tracks_off1 %>% 
  left_join(plist11.features_off1, by="uri")

plist12 <- plist12.tracks %>% 
  left_join(plist12.features, by="uri")

plist12_off1 <- plist12.tracks_off1 %>% 
  left_join(plist12.features_off1, by="uri")

plist12_off2 <- plist12.tracks_off2 %>% 
  left_join(plist12.features_off2, by="uri")

###############################################################
# Add Playlist Name and Genre
###############################################################

plist1$playlist <- "Country Music 101:  Country's Greatest Hits"
plist2$playlist <- "Country's Greatest Hits:  The '60s"
plist3$playlist <- "Dance Hits"
plist3_off1$playlist <- "Dance Hits"
plist4$playlist <- "Dubstep Don"
plist4_off1$playlist <- "Dubstep Don"
plist5$playlist <- "RapCaviar"
plist6$playlist <- "Hip-Hop Anthems: Def Jam"
plist7$playlist <- "Get Turnt"
plist8$playlist <- "80's Metal & Rock"
plist8_off1$playlist <- "80's Metal & Rock"
plist8_off2$playlist <- "80's Metal & Rock"
plist9$playlist <- "Classical Essentials"
plist9_off1$playlist <- "Classical Essentials"
plist10$playlist <- "Classical New Releases"
plist11$playlist <- "Classical Focus"
plist11_off1$playlist <- "Classical Focus"
plist12$playlist <- "Stand-up Comedy"
plist12_off1$playlist <- "Stand-up Comedy"
plist12_off2$playlist <- "Stand-up Comedy"

plist1$genre <- "country"
plist2$genre <- "country"
plist3$genre <- "electronic"
plist3_off1$genre <- "electronic"
plist4$genre <- "electronic"
plist4_off1$genre <- "electronic"
plist5$genre <- "hiphop"
plist6$genre <- "hiphop"
plist7$genre <- "hiphop"
plist8$genre <- "rock"
plist8_off1$genre <- "rock"
plist8_off2$genre <- "rock"
plist9$genre <- "classical"
plist9_off1$genre <- "classical"
plist10$genre <- "classical"
plist11$genre <- "classical"
plist11_off1$genre <- "classical"
plist12$genre <- "comedy"
plist12_off1$genre <- "comedy"
plist12_off2$genre <- "comedy"


###############################################################
# Combine Playlists
###############################################################

songs <- rbind(plist1,
               plist2,
               plist3,
               plist3_off1,
               plist4,
               plist4_off1,
               plist5, 
               plist6, 
               plist7, 
               plist8, 
               plist8_off1, 
               plist8_off2, 
               plist9, 
               plist9_off1, 
               plist10, 
               plist11, 
               plist11_off1, 
               plist12, 
               plist12_off1, 
               plist12_off2)

###############################################################
# Dedupe
###############################################################

songs <- songs %>% 
  distinct(uri, .keep_all = T)

###############################################################
# Add Primary Artist Name and URI
###############################################################

primary.artist.name <- songs$track.artists %>% 
  sapply(function(x) x[3]) %>% 
  sapply(function(y) y[1]) %>% 
  data.table() 

primary.artist.uri <- songs$track.artists %>% 
  sapply(function(x) x[5]) %>% 
  sapply(function(y) y[1]) %>% 
  data.table() 

names(primary.artist.name)[1] <- "primaryartist_name"
names(primary.artist.uri)[1] <- "primaryartist_uri"

primary.artist.name$primaryartist_name <- as.character(primary.artist.name$primaryartist_name) 
primary.artist.uri$primaryartist_uri <- as.character(primary.artist.uri$primaryartist_uri)

#add primary artist name and URI to master songs dataframe

songs <- songs %>% 
  add_column(primary.artist.name) 

songs <- songs %>% 
  add_column(primary.artist.uri) 


###############################################################
# Remove List Columns
###############################################################
songs$track.album.artists <- NULL
songs$track.album.available_markets <- NULL
songs$track.album.images <- NULL
songs$track.artists <- NULL
songs$track.available_markets <- NULL
songs$added_at <- NULL

###############################################################
# Select Relevant Columns
###############################################################

songs <- songs %>% 
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

###############################################################
# Bind With Salsa CSV
###############################################################

salsa_read <- read_csv("output/spotify_salsa.csv")

spotify <- rbind(songs, salsa_read)



#EXPORT CSV

fwrite(spotify, file = "output/spotify_full.csv")
