require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject { Expense.new(name: 'cake', amount: 100)}

  before { subject.save }
  
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
  
  it 'amount should be greater than zero' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
