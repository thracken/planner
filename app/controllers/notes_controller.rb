class NotesController < ApplicationController
  def index
    @notable = find_notable
    @notes = Note.all
  end

  def create
    @notable = find_notable
    @note = @notable.notes.new(note_params)
    if @note.save
      flash[:success] = "Note saved!"
      if @notable.class == User
        redirect_to notes_url
      else
        redirect_to @notable
      end
    else
      render 'new'
    end
  end

  def new
    @notable = find_notable
    @note = @notable.notes.new
  end

  def edit
    @notable = find_notable
    @note = Note.find(params[:id])
  end

  def show
    @notable = find_notable
    @note = Note.find(params[:id])
  end

  def update
    @notable = find_notable
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      flash[:success] = "Note updated."
      if @notable.class == User
        redirect_to notes_url
      else
        redirect_to @notable
      end
    else
      render 'edit'
    end
  end

  def destroy
    @notable = find_notable
    Note.find(params[:id]).destroy
    flash[:success] = "Note deleted."
    redirect_to @project
  end

  private
    def note_params
      params.require(:notable_new_note).permit(:title,:body)
    end

    def find_notable
      param_ids = []
      params.each do |name, value|
        if name =~ /(.+)_id$/
          param_ids << $1.classify.constantize.find(value)
        end
      end
      param_ids.last
    end
end
