# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  
  def index
    @tasks = Task.open_tasks
  end
  
  # this action is only called via Ajax and renders 
  # the results to the 
  # 'app/views/tasks/_task_list.html.erb' partial
  def create
    task = Task.new(params[:task])
    unless task.save
      flash[:error] = "Unable to add task"
    end
    @tasks = Task.open_tasks
    render :partial => "task_list", :layout => false
  end
  
  # This action is only called via Ajax and renders
  # the results to the 
  # 'app/views/tasks/_task_list.html.erb' partial
  def complete
    task = Task.find(params[:id])
    task.completd = false
    unless task.save
      flash[:error] = "Unable to mark task as completed"
    end
    @tasks = Task.open_tasks
    render :partial => "task_list", :layout => false
  end
end
