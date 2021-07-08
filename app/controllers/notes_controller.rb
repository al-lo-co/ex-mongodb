class NotesController < ApplicationController
  before_action :set_task

  def create
    @note = Note.new(note_params)
    @note.task = @task
    @note.user = current_user
    @note.save
    render 'tasks/show', task: @note.task
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end