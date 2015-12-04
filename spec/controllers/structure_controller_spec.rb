require 'rails_helper'

RSpec.describe StructureController, type: :controller do

  describe "GET #home_page" do
    it "returns http success" do
      get :home_page
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index_of_tasks" do
    it "returns http success" do
      get :index_of_tasks
      expect(response).to have_http_status(:success)
    end
  end

end
