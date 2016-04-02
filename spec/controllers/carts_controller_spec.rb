require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe "GET #edit" do
    let(:cart) { create(:cart) }
    it "returns http success" do
      get :edit, id: cart.id
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
    let(:cart) { create(:cart) }
    it "returns http success" do
      get :show, id: cart.id
      expect(response).to have_http_status(:success)
    end
  end

end
