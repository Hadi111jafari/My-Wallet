class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user)
  end

  def new
    @group = Group.new
  end

  def show
    @expenses = Expense.where(user_id: current_user.id)
    @group = Group.find_by(id: params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
