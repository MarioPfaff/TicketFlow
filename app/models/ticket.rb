class Ticket < ApplicationRecord
    belongs_to :user, optional: true
    enum :status, {
        :open => 1,
        :hold => 2,
        :closed => 3
    }

    enum :priority, {
        :low => 1,
        :medium => 2,
        :high => 3,
        :urgent => 4
    }    
end
