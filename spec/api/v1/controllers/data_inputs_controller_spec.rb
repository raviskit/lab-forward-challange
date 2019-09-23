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
end
