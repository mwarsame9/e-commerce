class Review < ApplicationRecord
    validates :author, :presence => true
    validates :content, :presence => true
    belongs_to :product
end
