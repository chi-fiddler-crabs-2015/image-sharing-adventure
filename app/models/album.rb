class Album < ActiveRecord::Base
  belongs_to :user, foreign_key: "owner_id"
  belongs_to :user, foreign_key: "contributor_id"
  has_many :images
end
