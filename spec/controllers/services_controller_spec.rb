require 'rails_helper'

RSpec.describe ServicesController, type: :controller do

  describe "GET #edit" do
    it "assigns the requested service to @service" do
      service = create(:service)
      get :edit, id: service
      # assigns(:service).should eq(service)
      expect(assigns(:service)).to eq(service)
    end
  
    it "renders the #show view" do
      get :edit, id: create(:service)
      # response.should render_template :show
      expect(response).to render_template :edit
    end
    # it "returns http success" #do
    #   get :edit
    #   expect(response).to have_http_status(:success)
    # end
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
    it "assigns the requested service to @service" do
      service = create(:service)
      get :show, id: service
      # assigns(:service).should eq(service)
      expect(assigns(:service)).to eq(service)
    end
  
    it "renders the #show view" do
      get :show, id: create(:service)
      # response.should render_template :show
      expect(response).to render_template :show
    end
  end

end
