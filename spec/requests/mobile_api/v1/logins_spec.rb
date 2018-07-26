require 'spec_helper'

describe MobileApi::V1::LoginsController, type: :controller do

  let!(:user) { User.first }

  describe '#create' do

    let!(:params) { {user: {email: user.email, password: 'password'}} }

    it 'sign in users' do
      post :create, params: params
      expect(response.response_code).to eq(200)
    end

    context 'when user does not exist' do
      let!(:params) { {user: {email: 'unknown@user.com', password: 'password'}} }

      it 'renders 404' do
        post :create, params: params
        expect(response.response_code).to eq(404)
      end
    end
  end

end
