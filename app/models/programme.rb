class Programme < ApplicationRecord
    has_many :works
    accepts_nested_attributes_for :works, allow_destroy: true
    belongs_to :engagements, optional: true
end
