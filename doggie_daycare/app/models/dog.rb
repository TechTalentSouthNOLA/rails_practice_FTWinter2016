class Dog < ActiveRecord::Base
  # Belongs to always goes in the table that contains the foreign key
  belongs_to :owner
end
