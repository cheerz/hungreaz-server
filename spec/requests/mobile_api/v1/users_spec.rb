require 'spec_helper'

describe MobileApi::V1::UsersController, type: :controller do

  describe '#create' do

    let!(:params) {
      {
        user: {
          email:     'jean@cheerz.com',
          password:   'password',
          first_name: 'Jean',
          last_name:  'Marc',
        }
      }
    }

    it 'sign in users' do
      post :create, params: params
      expected_user = User['jean@cheerz.com']
      expect(response.response_code).to eq(200)
      expect(expected_user).not_to eq(nil)
      expect(expected_user.first_name).to eq('Jean')
      expect(expected_user.last_name).to eq('Marc')
    end

    context 'when email is already taken' do
      let!(:existing_user) { FactoryBot.create :user }
      let!(:params)        {
        {user: existing_user.attributes.slice(*%w(email password first_name last_name))}
      }

      it 'renders 403' do
        post :create, params: params
        expect(response.response_code).to eq(422)
      end
    end
  end

  describe '#show' do
    let!(:user) { FactoryBot.create :user }

    it 'renders current user data' do
      sign_in user
      get :show
      expect(response.response_code).to eq(200)
      expect(response_json).to eq(user.slice(*%w(email first_name last_name)))
    end

    context 'when user is not signed in' do

      it 'renders a 404' do
        get :show
        expect(response.response_code).to eq(404)
      end
    end
  end
end
