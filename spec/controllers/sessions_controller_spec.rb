require 'spec_helper'

describe SessionsController, type: :controller do

  describe 'new' do
    context 'when signed in' do
      before { expect(controller).to receive(:current_user).and_return(double) }
      it 'redirectes to root with a current user' do
        get :new
        expect(response).to redirect_to(:root)
      end
    end
  end

  describe 'create' do
    let(:user) { Fabricate(:user) }

    context 'with a found user' do
      it 'redirects to root with valid password' do
        post :create, email: user.email, password: 'password'
        expect(response).to redirect_to(:dashboard)
      end

      it 'renders new with invalid password' do
        post :create, email: user.email, password: 'wr0ng'
        expect(flash[:sign_in_error]).to eq("Your email or password are incorrect. Please try again.")
        expect(response).to redirect_to(:sign_in)
      end
    end

    context 'with no found user' do
      it 'renders new with a flash message' do
        post :create, email: 'noAuser@example.com', password: 'wr0ng'
        expect(flash[:sign_in_error]).to eq("Your email or password are incorrect. Please try again.")
        expect(response).to redirect_to(:sign_in)
      end
    end
  end
end
