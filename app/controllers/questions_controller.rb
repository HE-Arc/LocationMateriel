class QuestionsController < ApplicationController

  def new
    @product = Product.find(params[:id])
    @question = Question.new
  end

  def create
    @question = Question.new(title: params[:title], asker: params[:asker], answer: params[:answer], email: params[:email], question: params[:question], date: DateTime.now, product_id: params[:product_id])

    if @question.save
      @product = Product.joins(:questions).find(params[:product_id])
      redirect_to @product
    end
  end

end
