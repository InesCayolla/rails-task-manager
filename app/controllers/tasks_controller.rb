class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id].to_i)
  end

  def new
    @task = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@tasks)
  end

  def edit
    @task = Task.find(params[:id])

  end


def update
  @tasks = Task.find(params[:id])
  @tasks.update(task_params) # Will raise ActiveModel::ForbiddenAttributesError
end


def destroy
  @task = Task.find(params[:id])
  @task.destroy
  # No need for app/views/restaurants/destroy.html.erb
  redirect_to tasks_path, status: :see_other
end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
