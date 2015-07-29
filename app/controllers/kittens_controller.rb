class KittensController < ApplicationController
	before_action :find_kitten, only: [:show, :edit, :update, :destroy]

	def index
		@kittens = Kitten.all
	end

	def show
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.create(kitten_params)

		if @kitten.save
			redirect_to @kitten
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @kitten.update(kitten_params)
			redirect_to @kitten
		else
			render 'edit'
		end
	end

	def destroy
		@kitten.destroy
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
