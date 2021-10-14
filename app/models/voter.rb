class Voter < ApplicationRecord
  has_many :elections_voters
  has_many :elections, :through => :elections_voters
end
