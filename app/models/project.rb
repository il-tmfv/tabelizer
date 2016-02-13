class Project < ActiveRecord::Base
    belongs_to :customer
    has_many :table_entries
    has_many :users, through: :assignments
    has_many :assignments

    validates :location, :length => { :minimum => 3 }
end
