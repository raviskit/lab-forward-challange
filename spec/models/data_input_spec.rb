require 'rails_helper'

RSpec.describe DataInput, type: :model do

  it 'should check valid input data' do
    expect(DataInput.create(input: [1, 2, 3, 4, 5, 2, 1], threshold: 3)).to be_valid
  end

  it 'should check invalid input data' do
    expect(DataInput.create(input: [1, 2, 3, 4, 5, 2, 1])).to be_invalid
  end
end
