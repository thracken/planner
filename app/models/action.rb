class Action < ActiveRecord::Base
  validates :text, presence: true

  belongs_to :project
end
