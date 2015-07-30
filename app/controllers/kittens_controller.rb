class KittensController < ApplicationController
	before_action :find_kitten, only: [:show, :edit, :update, :destroy]

	def index
		@kittens = Kitten.all
		respond_to do |format|
			format.html
			format.json { render json: @kittens }
		end
	end

	def show
		respond_to do |format|
			format.html
			format.json { render json: @kitten }
		end
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.create(kitten_params)

		if @kitten.save
			flash[:success] = "Kitten succesfully created"
			redirect_to kittens_path(@kitten)
		else
			flash.now[:error] = "Failed to create Kitten"
			render 'new'
		end
	end

	def edit

	end

	def update
		if @kitten.update(kitten_params)
			flash[:success] = "Kitten succesfully changed"
			redirect_to @kitten
		else
			flash.now[:error] = "Kitten failed to be changed"
			render 'edit'
		end
	end

	def destroy
		@kitten.destroy
		flash[:success] = "Kitten succesfully destroyed"
		redirect_to kittens_path
	end
	private
		def kitten_params
			params.require(:kitten).permit(:name, :age, :cuteness, :softness)
		end

		def find_kitten
			@kitten = Kitten.find_by(params[:id])
		end
end
