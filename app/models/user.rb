class User < ApplicationRecord
  validates :name, presence: true,
        format: {with: /\A[a-zA-Z0-9_]{2,20}\z/, message: 'ne doit contenir que des caractères alphanumériques ou des _'},
        uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 5 }
end
