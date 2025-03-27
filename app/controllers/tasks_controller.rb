class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Tarea creada exitosamente ✅"
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Tarea actualizada 🛠"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Tarea eliminada 🗑"
  end

  def toggle_done
    @task = Task.find(params[:id])
    @task.update(done: !@task.done)
    redirect_to tasks_path, notice: "Tarea actualizada 🔄"
  end

  private

  def task_params
    params.require(:task).permit(:title, :done)
  end
end