resource "spotify_playlist" "Sinhala" {
  name        = "Sinhala"
  tracks = ["6dFrpviom6X8vw2w3d6Caz"]
}

data "spotify_search_track" "eminem" {
  artist = "Eminem"
}

resource "spotify_playlist" "superman" {
  name = "Superman"
  tracks = [
  data.spotify_search_track.eminem.tracks[0].id,
  data.spotify_search_track.eminem.tracks[1].id,
  data.spotify_search_track.eminem.tracks[2].id
  ]
}
  

