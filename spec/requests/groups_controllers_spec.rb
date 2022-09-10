require 'rails_helper'

RSpec.describe "/groups_controllers", type: :request do

  before(:each) do
    @user = User.create(name: 'Ali', email: 'ali@gmail.com', password: '123456', password_confirmation: '123456')
    Group.create(user_id: @user.id, name: 'Travel', icon: '✈️')
  end

  describe "GET /index" do
    it "renders a successful response" do
      get groups_path
      expect(response).to be_successful
    end

    it 'returns a 200 status code' do
      get groups_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get groups_path
      expect(response).to render_template('index')
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get groups_path(@group)
      expect(response).to be_successful
    end
  end

end
