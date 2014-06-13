class TasksController < ApplicationController

	def new
		@task = Task.new
	end

	def create
		@list = List.find_by_slug!(params[:list_id])
		@task = @list.tasks.create(task_params)
		redirect_to list_path(@list)
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@list = List.find_by_slug!(params[:list_id])
		@task = @list.tasks.find(params[:id])
		if @task.update(task_params)
			redirect_to @list
		else
			render 'edit'
		end
	end

	def pick_task
		@task = Task.find(params[:task_id])
	  respond_to do |format|
	    format.js { render 'pick_task.js', locals: { task: @task } }
	  end
	end

	def destroy
		@list = List.find_by_slug!(params[:list_id])
		@task = @list.tasks.find(params[:id])
		@task.destroy
		redirect_to list_path(@list)
	end

	def index
		@tasks = Task.all
	end

	private
		def task_params
			params.require(:task).permit(:title, :picker)
		end
end
