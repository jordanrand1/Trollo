class Board < ApplicationRecord
  has_many :lists, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
