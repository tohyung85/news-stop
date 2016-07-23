require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  context 'user first arrives to site' do
    render_views
    it 'should display welcome page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
