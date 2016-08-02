class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :outcome, presence: true

  belongs_to :user
  has_many :actions
  has_many :notes, :as => :notable
end
