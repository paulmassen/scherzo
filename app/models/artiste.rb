class Artiste < ApplicationRecord
    has_many :engagements
    include ImageUploader::Attachment(:image) 
    has_rich_text :biography
end
