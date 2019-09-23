class DataInput < ApplicationRecord
  validates_presence_of :data, :threshold
end
