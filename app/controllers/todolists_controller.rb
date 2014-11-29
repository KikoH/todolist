class TodolistsController < ApplicationController

	def index
		@todolists = Todolist.all
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

	private
	def todolist_params
		params.require(:todolist).permit(:title, :description, :due)
	end
end
