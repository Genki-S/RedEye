require 'spec_helper'

describe 'Pomodori API v1' do
  let(:uid) { '1024' }
  let!(:user) { create(:user, uid: uid) }

  describe 'GET /pomodori' do
    let(:params) do
      { uid: user.uid }
    end

    before do
      user.pomodori << FactoryGirl.create(:pomodoro)
      user.pomodori << FactoryGirl.create(:pomodoro)
      user.pomodori << FactoryGirl.create(:pomodoro, started_at: 1.day.ago)
    end

    it 'returns pomodori of user with uid of params[:uid]' do
      get '/api/v1/pomodori', params
      obj = JSON.parse(response.body)
      expect(Pomodoro.find(obj.first['id']).user).to eq(user)
    end

    it 'returns pomodori which is started today' do
      get '/api/v1/pomodori', params
      obj = JSON.parse(response.body)
      expect(obj.count).to eq(user.pomodori.started_on(Date.today).count)
    end

    it 'returns 401 if params[:uid] is not provided' do
      get '/api/v1/pomodori'
      expect(response.status).to eq(401)
    end

    context 'with date parameter' do
      before do
        params.merge!(date: 1.day.ago.to_date.to_s)
      end

      it 'returns pomodori which is started on params[:date]' do
        get '/api/v1/pomodori', params
        obj = JSON.parse(response.body)
        expect(obj.count).to eq(user.pomodori.started_on(1.day.ago).count)
      end
    end
  end

  describe 'POST /pomodori' do
    let(:title) { 'title' }
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
