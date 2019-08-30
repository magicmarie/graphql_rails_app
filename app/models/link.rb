class Link < ApplicationRecord
  belongs_to :user, optional: false

  has_many :votes
end