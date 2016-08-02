class Note < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  
  belongs_to :notable, :polymorphic => true
end
