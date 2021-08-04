class User < ApplicationRecord
    belongs_to :city 
    has_many :gossip

    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
    

end
