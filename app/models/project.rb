class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :outcome, presence: true

  belongs_to :user
end
