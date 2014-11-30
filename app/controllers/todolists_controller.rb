class TodolistsController < ApplicationController

	def index
		@todolists = if params[:search]
			Todolist.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
		else
			@todolists = Todolist.all
		end

		@todolist = Todolist.new

		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@todolist = Todolist.new
	end

	def create
		@todolists = Todolist.all
		@todolist = Todolist.new(todolist_params)

		respond_to do |format|
			if @todolist.save
				format.html { redirect_to todolists_path }
				format.js {}
			else
				format.html { render :new }
				format.js {}
			end
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
