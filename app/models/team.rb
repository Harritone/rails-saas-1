class Team < ApplicationRecord
  belongs_to :account
  validates :account, presence: true
  validates :timezone, presence: true
  validates :name, presence: true

  has_many :team_memberships
  has_many :users, through: :team_memberships
end
