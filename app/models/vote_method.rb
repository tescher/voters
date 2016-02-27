class VoteMethod < ActiveRecord::Base
  has_many :election_voters
end
