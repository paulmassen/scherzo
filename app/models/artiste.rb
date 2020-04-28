class Artiste < ApplicationRecord
    has_many :engagements
    include ImageUploader::Attachment(:image) 
end
