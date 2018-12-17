class Profile < ApplicationRecord
	belongs_to :user

    has_attached_file :avatar, styles: {thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    validates :firstname, :lastname, :age, :avatar, presence: true
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18, less_than: 65 }
end
