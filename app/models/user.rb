class User < ApplicationRecord
  has_one :credential, dependent: :destroy
end
