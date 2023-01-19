class ClientLocation < ApplicationRecord
  belongs_to :client
  belongs_to :location
end