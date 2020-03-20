class Listing < ActiveRecord::Base
    belongs_to :neighborhood
    has_many :listings, through: :neighborhoods

end

