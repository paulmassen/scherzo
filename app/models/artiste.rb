class Artiste < ApplicationRecord
    has_many :engagements
    include ImageUploader::Attachment(:image) 
    before_save :image_resize
    has_rich_text :biography
    
    def image_resize
        self.image_derivatives!
    end
    
end
