class StatusList < ApplicationRecord
    has_many :to_do
    belongs_to :user 
end
