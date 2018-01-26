class Client < ApplicationRecord
  belongs_to :appointment, optional: true
end
