class ListsController < ApplicationController
	before_filter :find_list, only: [:show, :edit, :update, :destroy]
	http_basic_authenticate_with name: "dfj", password: "WBW2014", only: [:index]

	def new
		@list = List.new
	end

	def create
		@list = List.new(list_params)
		if @list.save
			redirect_to @list
		else
			render 'new'
		end
	end

	def show
		@unpickedtasks = @list.tasks.where(picker: [nil, ''])
		@pickedtasks = @list.tasks.where("picker <> ''").order('picker')
	end

	def edit
		
	end

	def update
		
		if @list.update(list_params)
			redirect_to @list
		else
			render 'edit'
		end
	end

	def destroy
		@list.destroy
		redirect_to root_path
	end

	def index
		@lists = List.all
	end

	private

		def list_params
			params.require(:list).permit(:title, :description)
		end

		def find_list
      @list = List.find_by_slug!(params[:id].split("/").last)
    end
end
