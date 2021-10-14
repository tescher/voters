class VoteMethod < ApplicationRecord
  has_many :election_voters
end
