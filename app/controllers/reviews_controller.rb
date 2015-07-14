class ReviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_review, only: [:edit, :update, :destroy]

	def edit
		@farm = @review.farm
	end

	def create
		@review = current_user.reviews.new(review_params)

		respond_to do |format|
			if @review.save
				format.html { redirect_to farm_path(@review.farm), notice: 'Review was successfully created.' }
			else
				format.html { redirect_to farm_path(@review.farm), notice: "Something went wrong" }
			end
		end
	end

	def update
		respond_to do |format|
			if @review.update(review_params)
				format.html { redirect_to farm_path(@review.farm), notice: 'Review was successfully updated.' }
			else
				format.html { redirect_to farm_path(@review.farm), notice: "Something went wrong" }
			end
		end
	end

	def destroy
		@review.destroy
		respond_to do |format|
			format.html { redirect_to farm_path(@review.farm), notice: 'Review was successfully destroyed.' }
		end
	end

	private

	def set_review
		@review = Review.find(params[:id])
	end

	def review_params
		params.require(:review).permit(:content, :farm_id, :score)
	end
end