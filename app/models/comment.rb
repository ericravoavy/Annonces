class Comment < ApplicationRecord
  belongs_to :advertisement
  validates :body, presence: true
end
