require 'rails_helper'

RSpec.describe '/expenses_controllers', type: :request do
  before(:each) do
    @user = User.create(name: 'Ali', email: 'ali@gmail.com', password: '123456', password_confirmation: '123456')
    @group = Group.create(user_id: @user.id, name: 'Travel', icon: '✈️')
    @expense = Expense.create(user_id: @user.id, name: 'America', amount: 100)
    GroupExpense.create(group_id: @group.id, expense_id: @expense.id)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get expenses_path
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_expense_path
      expect(response).to be_successful
    end
  end
end
