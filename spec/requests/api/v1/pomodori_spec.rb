require 'spec_helper'

describe 'Pomodori API v1' do
  describe 'POST /pomodori' do
    let(:title) { 'title' }
    let(:uid) { '1024' }
    let!(:user) { create(:user, uid: uid) }

    let(:params) do
      {
        uid: uid,
        title: title,
      }
    end

    context 'when reflection is not provided' do
      it 'creates new pomodoro without reflection' do
        post '/api/v1/pomodori', params
        new_pomodoro = Pomodoro.last
        expect(new_pomodoro.user).to eq(user)
        expect(new_pomodoro.title).to eq(title)
        expect(new_pomodoro.reflection).to be_nil
      end
    end

    context 'when reflection is provided' do
      let(:evaluation) { 0 }
      let(:reflection_params) do
        {
          evaluation: evaluation
        }
      end

      before do
        params.merge!(reflection: reflection_params)
      end

      it 'creates new pomodoro with reflection' do
        post '/api/v1/pomodori', params
        new_pomodoro = Pomodoro.last
        expect(new_pomodoro.reflection.evaluation).to eq(evaluation)
      end
    end
  end
end
