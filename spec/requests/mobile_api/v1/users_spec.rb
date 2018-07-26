require 'spec_helper'

describe MobileApi::V1::UsersController, type: :controller do

  describe '#create' do

    let!(:email)  { 'jean@cheerz.com' }
    let!(:params) {
      {user: {email: email, password: 'password', nickname: 'Jean'}}
    }

    it 'sign in users' do
      post :create, params: params
      expected_user = User[email]
      expect(response.response_code).to eq(200)
      expect(expected_user).not_to eq(nil)
      expect(expected_user.nickname).to eq('jean')
    end

    context 'when email has an invalid syntax' do
      let!(:email) { 'jean-cheerz.com-pwet' }

      it 'renders a 422' do
        post :create, params: params
        expect(response.response_code).to eq(422)
      end
    end

    context 'when no nickname is provided' do
      let!(:params) {
        {user: {email: 'HeyHey@cheerz.com', password: 'password'}}
      }

      it 'uses the email to create one' do
        post :create, params: params
        expected_user = User['heyhey@cheerz.com']
        expect(response.response_code).to eq(200)
        expect(expected_user).not_to eq(nil)
        expect(expected_user.nickname).to eq('heyhey')
      end
    end

    context 'when email is already taken' do
      let!(:existing_user) { FactoryBot.create :user }
      let!(:params)        {
        {user: existing_user.attributes.slice(*%w(email password nickname))}
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
      set_header_session_token
      get :show
      expect(response.response_code).to eq(200)
      expect(response_json).to eq(user.slice(*%w(email nickname)))
    end

    context 'when user is not signed in' do

      it 'renders a 404' do
        get :show
        expect(response.response_code).to eq(404)
      end
    end
  end
end
