class Action < ActiveRecord::Base
  validates :text, presence: true
  validates :context, presence: true

  belongs_to :project
end
