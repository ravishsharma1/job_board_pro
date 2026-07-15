class Company < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true

    has_many :jobs
end