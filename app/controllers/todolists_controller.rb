class TodolistsController < ApplicationController

	def index
		@todolists = if params[:search]
			Todolist.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
		else
			@todolists = Todolist.all
		end

		if request.xhr?
			render @todolists
		end
		@todolist = Todolist.new
	end

	def new
		@todolist = Todolist.new
	end

	def create
		@todolist = Todolist.new(todolist_params)

		if @todolist.save
			redirect_to todolists_path
		else
			render :new
		end
	end

	def edit
		@todolist = Todolist.find(params[:id])
	end

	def update
		@todolist = Todolist.find(params[:id])
		if @todolist
			@todolist.update_attributes(todolist_params)
			redirect_to todolists_path(@todolist)
		else
			render :edit
		end
	end

	def destroy
		@todolist = Todolist.find(params[:id])
		@todolist.destroy
		redirect_to todolists_path
	end

	private
	def todolist_params
		params.require(:todolist).permit(:title, :description, :due)
	end
end
