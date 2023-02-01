class ToDo < ApplicationRecord
    has_many :status_list
    validates :uni_code, presence: true, length: { is: 6 }
end
