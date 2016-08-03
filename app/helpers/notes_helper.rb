module NotesHelper
  def get_all_notes(user)
    notes = []
    user.notes.each do |user_note|
      notes << user_note
    end
    user.projects.each do |proj|
      proj.notes.each do |prj_note|
        notes << prj_note
      end
    end
    user.actions.each do |act|
      act.notes.each do |act_note|
        notes << act_note
      end
    end
    notes.sort! {|a,b| a.id <=> b.id}
  end
end
