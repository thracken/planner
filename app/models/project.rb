class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :outcome, presence: true

  default_scope -> {order(created_at: :asc, completed: :asc)}

  belongs_to :user
  has_many :actions
  has_many :notes, :as => :notable
end
