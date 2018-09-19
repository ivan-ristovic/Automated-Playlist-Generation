#' @examples
#' playlists <- browse_playlists_by_category("pop")

browse_playlists_by_category <- function(id, offset = 0, limit = 5, access_token = get_spotify_access_token()) {

    url <- paste("https://api.spotify.com/v1/browse/categories/",id ,"/playlists/", sep="")

	'https://api.spotify.com/v1/browse/categories/{id}/playlists/'
	
    content <- RETRY('GET', url,
                     query = list(limit = limit,
								  offset = offset,
                                  access_token = access_token),
                     encode = "json") %>% content()

	
    playlist_list <- content %>%
            list %>%
            list
	message(playlist_list)

playlist_list
}