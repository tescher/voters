class Election < ApplicationRecord
  has_many :elections_voters
  has_many :voters, :through => :elections_voters
end
