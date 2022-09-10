class ExpensesController < ApplicationController
  def index
    @expenses = Expense.where(user_id: current_user)
  end

  def new
    @expense = Expense.new
  end

  def show
    @total_amount = Expense.where(user_id: current_user).sum(:amount)
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expenses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to expenses_path
  end

  def expense_params
    params.require(:expense).permit(:name, :amount).merge(user_id: current_user.id)
  end
end
