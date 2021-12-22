class Team < ApplicationRecord
    has_many :team_members, dependent: :destroy
    has_many :users, through: :team_members
    accepts_nested_attributes_for :team_members
end
