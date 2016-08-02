class Action < ActiveRecord::Base
  validates :text, presence: true

  belongs_to :project
  has_many :notes, :as => :notable
end
