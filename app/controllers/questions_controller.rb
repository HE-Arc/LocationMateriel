class QuestionsController < ApplicationController

  def new
    @product = Product.find(params[:id])

    if(params[:question] == nil)
      @question = Question.new
    else
      @question = params[:question]
    end
  end

  def create
    @question = Question.new(question_params)
    @question.date = DateTime.now

    if @question.save
      @product = Product.joins(:questions).find(@question.product_id)

      ProductMailer.new_question_email(@question, @product).deliver_now

      redirect_to @product
    else
      @product = Product.find(@question.product_id)
      render action: 'new'
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :question, :asker, :answer, :email, :product_id)
    end

end
