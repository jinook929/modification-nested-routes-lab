module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_field(f, artist, artists)
    if artist.nil? && !artists.nil?
      f.label :artist_id, "Artist" # label not working
      f.collection_select :artist_id, artists, :id, :name, include_blank: true
    else
      f.label :artist_name, "Artist Name" # label not working
      # f.text_field :artist_name, placeholder: "Artist Name"
      f.text_field :artist_name, list: "artist_name", placeholder: "Artist Name"
    end
  end
end
