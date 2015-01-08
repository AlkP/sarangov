class Trap < ActiveRecord::Base
  has_many :request, dependent: :destroy
end
