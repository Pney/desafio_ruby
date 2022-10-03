class ToDo < ApplicationRecord
    belongs_to :user
    belongs_to :status_list
    validates :uni_code, presence: true, length: { is: 6 }
end
