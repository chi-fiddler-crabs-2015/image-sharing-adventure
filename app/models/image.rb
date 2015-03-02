class Image < ActiveRecord::Base
  belongs_to :album
  belongs_to :creator, foreign_key: "user_id"
  # Remember to create a migration!
end
