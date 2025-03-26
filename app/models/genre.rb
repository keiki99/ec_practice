class Genre < ApplicationRecord

    has_one :items, dependent: :destroy
end
