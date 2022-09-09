require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'Travel', icon: 'icon')}

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be string' do
    subject.name = 'icon'
    expect(subject).to_not be_valid
  end
end
