class ElectionsVoter < ApplicationRecord
  belongs_to :voters
  belongs_to :elections
  belongs_to :vote_methods
end
