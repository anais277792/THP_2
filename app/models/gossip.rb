class Gossip < ApplicationRecord
    belongs_to :user
    has_many :join_gossip_tags
    has_many :tag, through: :join_gossip_tags
    has_many :comment
    validates :title,
        presence: true,
        uniqueness: true 
    validates :content, 
        presence: true, 
        length: { minimum: 5 }
end
