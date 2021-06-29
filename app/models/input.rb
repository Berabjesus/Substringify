class Input < ApplicationRecord
  validates :query, :result, presence: true
  belongs_to :user
end
