require 'spec_helper'

describe 'Pomodori API v1' do
  describe 'POST /pomodori' do
    let(:pomodoro_params) do
      {
        title: 'title',
        user_id: '1'
      }
    end

    it 'creates new pomodoro' do
      post '/api/v1/pomodori', pomodoro: pomodoro_params
      new_pomodoro = Pomodoro.last
      expect(new_pomodoro.title).to eq(pomodoro_params[:title])
    end
  end
end
