class Genre < ActiveRecord::Base
  has_many :artists
  has_many :songs, :through => :artists

  validates :name, presence: true, length: {minimum: 3}, uniqueness: true

  # Gives items created within the last indicated minutes.
  # The lambda means it will refresh every time it is run.
  scope :recent, -> (minutes_past=60) {where("created_at > ?", minutes_past.minutes.ago)}

  scope :today, -> {where('DATE(created_at) = ?', Date.today)}

  scope :last_five, -> {order(:created_at => :desc).limit(5)}
end

# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
