class Patient < Person
  validates :bsn, uniqueness: true, length: { is: 9 }, allow_nil: true
end