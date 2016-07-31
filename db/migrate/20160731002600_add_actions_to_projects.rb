class AddActionsToProjects < ActiveRecord::Migration
  def change
    add_reference :actions, :project, index: true, foreign_key: true
  end
end
