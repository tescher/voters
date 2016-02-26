class ElectionVoter < ActiveRecord::Base
  belongs_to :voters
  belongs_to :elections
end
