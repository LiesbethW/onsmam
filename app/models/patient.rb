class Patient < Person
  validates :bsn, uniqueness: true, length: { is: 9 }
end