require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do

  describe "GET #edit" do
    let(:line_item) { create(:line_item) }
    it "returns http success" do
      get :edit, id: line_item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:line_item) { create(:line_item) }
    it "returns http success" do
      get :show, id: line_item.id
      expect(response).to have_http_status(:success)
    end
  end

end
