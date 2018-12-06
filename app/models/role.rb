class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  scope :distinct_s, -> { select("distinct(roles.id), roles.*") }

end
