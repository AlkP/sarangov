class Request < ActiveRecord::Base
  belongs_to :trap
  default_scope { order('created_at DESC') }
end
