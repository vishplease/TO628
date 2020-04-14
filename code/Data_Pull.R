#### LOAD PACKAGES (install everything in parentheses first if you don't have it)

pacman::p_load(pacman, tidyverse, knitr, lubridate, ggjoy, spotifyr, DataExplorer, data.table)

#### AUTHENTICATE SPOTIFY API



Sys.setenv(SPOTIFY_CLIENT_ID)
Sys.setenv(SPOTIFY_CLIENT_SECRET)
access_token <- get_spotify_access_token()
get_spotify_authorization_code()