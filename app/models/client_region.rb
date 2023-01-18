class ClientRegion < ApplicationRecord
  belongs_to :client
  belongs_to :region
end