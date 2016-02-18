class Artist < ActiveRecord::Base
  belongs_to :genre
  has_many :songs

  validates :name, presence: true, uniqueness: true

  # This line says you have to enter something for the genre_id
  validates :genre_id, presence: true

  # This line says the associated genre has to actually exist
  validates :genre, presence: true
end

# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_artists_on_genre_id  (genre_id)
#
