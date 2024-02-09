class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create,:inquire_enterprise]
  def index
    @tasks = Task.all
  end

  def create
    task = Task.new(task_params)
    if task.save 
      redirect_to tasks_path, notice: 'Task created'
    else 
      render json: { error: todo.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

end
