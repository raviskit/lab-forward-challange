class DataInput < ApplicationRecord
  validates_presence_of :input, :threshold
  validate :array_input_field

  def array_input_field
    if !input.kind_of?(Array)
      errors.add(:input, 'must be an array')
    end
  end
end
