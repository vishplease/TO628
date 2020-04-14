#### LOAD PACKAGES (install everything in parentheses first if you don't have it)

pacman::p_load(pacman, tidyverse, knitr, lubridate, ggjoy, spotifyr, DataExplorer, data.table)

#### AUTHENTICATE SPOTIFY API


Sys.setenv(SPOTIFY_CLIENT_ID = Sys.getenv("SPOTIFY_CLIENT_ID"))
Sys.setenv(SPOTIFY_CLIENT_SECRET = Sys.getenv("SPOTIFY_CLIENT_SECRET"))


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

#Extract Daily Mix Playlists

plist.dm1 <- my_plists %>% 
  filter(name %in% "Daily Mix 1") %>% 
  tibble()

plist.dm2 <- my_plists %>% 
  filter(name %in% "Daily Mix 2") %>% 
  tibble()

plist.dm3 <- my_plists %>% 
  filter(name %in% "Daily Mix 3") %>% 
  tibble()

plist.dm4 <- my_plists %>% 
  filter(name %in% "Daily Mix 4") %>% 
  tibble()

plist.dm5 <- my_plists %>% 
  filter(name %in% "Daily Mix 5") %>% 
  tibble()

plist.dm6 <- my_plists %>% 
  filter(name %in% "Daily Mix 6") %>% 
  tibble()

#Get Playlist Tracks

plist.dm1.tracks <- plist.dm1$id %>% 
  get_playlist_tracks() %>% 
  tibble()


plist.dm2.tracks <- plist.dm2$id %>% 
  get_playlist_tracks() %>% 
  tibble() 


plist.dm3.tracks <- plist.dm3$id %>% 
  get_playlist_tracks() %>% 
  tibble()


plist.dm4.tracks <- plist.dm4$id %>% 
  get_playlist_tracks() %>% 
  tibble() 


plist.dm5.tracks <- plist.dm5$id %>% 
  get_playlist_tracks() %>% 
  tibble() 


plist.dm6.tracks <- plist.dm6$id %>% 
  get_playlist_tracks() %>% 
  tibble()


# Get Playlist Features
plist.dm1.features <- plist.dm1.tracks$track.id %>% 
  get_track_audio_features() %>% 
  tibble()


plist.dm2.features <- plist.dm2.tracks$track.id %>% 
  get_track_audio_features() %>% 
  tibble()

plist.dm3.features <- plist.dm3.tracks$track.id %>% 
  get_track_audio_features() %>% 
  tibble()

plist.dm4.features <- plist.dm4.tracks$track.id %>% 
  get_track_audio_features() %>% 
  tibble()

plist.dm5.features <- plist.dm5.tracks$track.id %>% 
  get_track_audio_features() %>% 
  tibble()

plist.dm6.features <- plist.dm6.tracks$track.id %>% 
  get_track_audio_features() %>% 
  tibble()



# Rename A Column In Tracks To Match Features

names(plist.dm1.tracks)[names(plist.dm1.tracks) == "track.uri"] <- "uri"
names(plist.dm2.tracks)[names(plist.dm2.tracks) == "track.uri"] <- "uri"
names(plist.dm3.tracks)[names(plist.dm3.tracks) == "track.uri"] <- "uri"
names(plist.dm4.tracks)[names(plist.dm4.tracks) == "track.uri"] <- "uri"
names(plist.dm5.tracks)[names(plist.dm5.tracks) == "track.uri"] <- "uri"
names(plist.dm6.tracks)[names(plist.dm6.tracks) == "track.uri"] <- "uri"



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

plist.dm1$playlist <- "Daily Mix 1"
plist.dm2$playlist <- "Daily Mix 2"
plist.dm3$playlist <- "Daily Mix 3"
plist.dm4$playlist <- "Daily Mix 4"
plist.dm5$playlist <- "Daily Mix 5"
plist.dm6$playlist <- "Daily Mix 6"


# Combine Into Master Daily Mix Playlist

dailymix <- rbind(plist.dm1, 
                  plist.dm2, 
                  plist.dm3, 
                  plist.dm4, 
                  plist.dm5, 
                  plist.dm6)

#extract primary artist name and URI

primary.artist.name <- dailymix$track.artists %>% 
  sapply(function(x) x[3]) %>% 
  sapply(function(y) y[1]) %>% 
  tibble() 

primary.artist.uri <- dailymix$track.artists %>% 
  sapply(function(x) x[5]) %>% 
  sapply(function(y) y[1]) %>% 
  tibble() 

names(primary.artist.name)[1] <- "primaryartist_name"
names(primary.artist.uri)[1] <- "primaryartist_uri"

primary.artist.name$primaryartist_name <- as.character(primary.artist.name$primaryartist_name) 
primary.artist.uri$primaryartist_uri <- as.character(primary.artist.uri$primaryartist_uri)

#add primary artist name and URI to daily mix dataframe

dailymix <- dailymix %>% 
  add_column(primary.artist.name) 

dailymix <- dailymix %>% 
  add_column(primary.artist.uri) 




#Remove "list" columns from table


dailymix$track.album.artists <- NULL
dailymix$track.album.available_markets <- NULL
dailymix$track.album.images <- NULL
dailymix$track.artists <- NULL
dailymix$track.available_markets <- NULL
dailymix$added_at <- NULL



#Select Relevant Columns

dailymix <- dailymix %>% 
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

spotify_output <- as.data.table(dailymix)

fwrite(spotify_output, file = "output/spotify_dailymix.csv")