require 'rails_helper'

RSpec.describe Api::V1::DataInputsController, type: :controller do
  context 'valid data' do
    it 'should output correct data with spikes if threshold is crossed' do
      post 'output', params: {input: "[1, 2, 3, 4,1 ,5, 6, 1, 2, 1.1, 2.2, 0]", threshold: "3" }
      expect(JSON.parse(response.body)['signal']).to eq([0,0,0,1,0,1,1,0,0,0,0,0])
      expect(JSON.parse(response.body)['message']).to eq('output generated successfully')
    end

    it 'should output data with no spikes if threshold is not crossed' do
      post 'output', params: {input: "[1, 2, 3, 2,1 ,2, 2, 1, 2, 1.1, 2.2, 0]", threshold: "3" }
      expect(JSON.parse(response.body)['signal']).to eq([0,0,0,0,0,0,0,0,0,0,0,0])
      expect(JSON.parse(response.body)['message']).to eq('output generated successfully')
    end
  end

  context 'invalid data' do
    it 'should output error if incorrect data is passed' do
      post 'output', params: {input: [], threshold: "3" }
      expect(JSON.parse(response.body)['message']).to eq('Invalid Input')
    end
  end

  context 'when start date and end date are supplied' do
    it 'throws an error message if invalid no dates are provided' do
      post 'output', params: {start_date: '', end_date: '' }
      expect(JSON.parse(response.body)['message']).to eq('Invalid Input')
    end

    it 'throws an error if invalid dates are provided' do
      post 'output', params: { start_date: 'abc', end_date: 'def' }
      expect(JSON.parse(response.body)['message']).to eq('Invalid Date or format')
    end

    it 'gives success results if correct date are supplied' do
      DataInput.create!(data: [1, 4, 5, 0, 1, 2], threshold: 3 )
      post 'output', params: { start_date: Date.today, end_date: Date.today + 1 }
      expect(JSON.parse(response.body)['signal']).to eq([[0, 1, 1, 0, 0, 0]])
      expect(JSON.parse(response.body)['message']).to eq('output generated successfully')
    end

  end
end
