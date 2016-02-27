class ElectionsVoter < ActiveRecord::Base
  belongs_to :voters
  belongs_to :elections
  belongs_to :vote_method
end
