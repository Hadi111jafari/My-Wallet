require 'rails_helper'

RSpec.describe GroupExpense, type: :model do
  subject { GroupExpense.new(group_id: 1, expense_id: 1) }

  before { subject.save }

  it 'group_id should be present' do
    subject.group_id = nil
    expect(subject).to_not be_valid
  end

  it 'expense_id should be present' do
    subject.expense_id = nil
    expect(subject).to_not be_valid
  end
end
