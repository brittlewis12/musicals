require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_record'
require 'pry' if development?
require_relative 'config/environments'
require_relative 'models/show'
require_relative 'models/song'

helpers do; end

after do
  ActiveRecord::Base.clear_active_connections!
end

# Welcome to Broadway.ly!
get "/" do
  erb :index
end

# Index of all shows
# with links to individual shows
get "/shows/?" do
  @shows = Show.all.order("id ASC")

  erb :shows
end

# Form to create new show
get "/shows/new/?" do
  erb :new_show
end

# Create action - new show - redirects to that
# show
post "/shows/?" do
  show = Show.new
  show.title = params[:title]
  show.year = params[:year]
  show.composer = params[:composer]
  show.image_url = params[:image_url]

  # If user input passes validation, it is
  # persisted to the database. Else, user is
  # redirected back to the form
  if show.valid?
    show.save!
    redirect "shows/#{show.id}"
  else
    # IN FUTURE:
    # Should give user some indication of an error.
    redirect "/shows/new"
  end
end

# Individual show page
# Links to list of all songs `/shows/:id/songs`
# and form to create new songs `/shows/:id/songs/new`
get "/shows/:id/?" do
  @chosen_show = Show.find(params[:id].to_i)

  erb :single_show
end

# Form to create new songs
get "/shows/:id/songs/new/?" do
  @id = params[:id]

  erb :new_song
end

# Create action - new songs for a show - redirects
# to that song
post "/shows/:id/songs/?" do
  song = Song.new
  song.show_id = params[:id]
  song.title = params[:title]
  song.embed_id = params[:youtube_link].split("v=")[1]

  # If user input passes validation, it is
  # persisted to the database. Else, user is
  # redirected back to the form
  if song.valid?
    song.save!
    redirect "shows/#{song.show_id}/songs/#{song.id}"
  else
    # IN FUTURE:
    # Should give user some indication of an error.
    redirect "/shows/#{params[:id]}/songs/new"
  end
end

# Lists all songs from the show
get "/shows/:id/songs/?" do
end

# Shows just one song from the show
get "/shows/:show_id/songs/:song_id/?" do
end