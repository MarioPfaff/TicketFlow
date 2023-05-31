class Ticket < ApplicationRecord
    belongs_to :user

    # Path: app/models/user.rb
    # Makes a relation to users.
end
