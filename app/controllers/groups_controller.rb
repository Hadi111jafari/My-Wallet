class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
    @total_amount = Expense.where(user_id: current_user.id).sum(:amount)
  end

  def new
    @group = Group.new
  end

  def show
    @expenses = Expense.where(user_id: current_user.id)
    @group = Group.find_by(id: params[:id])
    @total_amount = Expense.where(user_id: current_user.id).sum(:amount)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
