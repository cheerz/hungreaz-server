require 'spec_helper'

describe MobileApi::V1::SessionsController, type: :controller do

  let!(:user) { FactoryBot.create :user, password: 'password' }

  describe '#create' do

    let!(:params) { {session: {email: user.email, password: 'password'}} }

    it 'sign in users' do
      post :create, params: params
      expect(response.response_code).to eq(200)
      expect(user.reload.session_token).not_to be(nil)
    end

    context 'when user does not exist' do
      let!(:params) { {session: {email: 'unknown@user.com', password: 'password'}} }

      it 'renders 404' do
        post :create, params: params
        expect(response.response_code).to eq(404)
      end
    end

    context 'when password is wrong' do
      let!(:params) { {session: {email: user.email, password: 'wrong-password'}} }

      it 'renders 403' do
        post :create, params: params
        expect(response.response_code).to eq(403)
      end
    end
  end

  describe '#destroy' do

    it 'signs out user' do
      set_header_session_token
      delete :destroy
      expect(response.response_code).to eq(200)
      expect(user.reload.session_token).to be(nil)
    end
  end

end
