require 'rails_helper'

RSpec.describe BooksController, type: :controller do 
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it 'renders the index template' do 
      get :index
      expect(response).to be_successful
    end
  end
end
