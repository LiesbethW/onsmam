class User < Person
  validates :email, presence: true, uniqueness: true
end