class QuestionsController < ApplicationController

	def new
		@product = Product.find(params[:id])
	end

	def create
		@question = Question.new(title: params[:title], 
														 asker: "Asker",
														 question: params[:question], 
														 date: DateTime.now,
														 product_id: params[:product_id])
		if @question.save
			@product = Product.joins(:questions).find(params[:product_id])
			redirect_to @product
		end
	end

end
