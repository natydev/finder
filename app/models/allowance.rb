class Allowance < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :allowanceable, polymorphic: true
  belongs_to :user
end
