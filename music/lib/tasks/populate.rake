namespace :db do
  desc "Clear the DB and fill with excellent sample data"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    # Clear out the old DB
    [Artist, Song].each(&:destroy_all)

    # Add artists and songs for each Genre
    Genre.all.each do |genre|

      # Create 5 artists for each genre
      Artist.populate(5) do |artist|
        artist.name = Faker::App.name
        artist.genre_id = genre.id

        # Create varied number of songs per artist
        Song.populate(8..16) do |song|
          song.title = Faker::Hipster.words(3).join(' ').titleize
          song.artist_id = artist.id
        end # song
      end # artist
    end # genre

    puts "Done populating!!"
  end # populate task
end # namespace db