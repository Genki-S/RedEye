require 'spec_helper'

describe 'Pomodori API v1' do
  describe 'POST /pomodori' do
    let(:uid) { '1024' }
    let!(:user) { create(:user, uid: uid) }
    let(:params) do
      {
        uid: uid,
        title: 'title',
      }
    end

    it 'creates new pomodoro' do
      post '/api/v1/pomodori', params
      new_pomodoro = Pomodoro.last
      expect(new_pomodoro.user).to eq(user)
      expect(new_pomodoro.title).to eq(params[:title])
    end
  end
end
