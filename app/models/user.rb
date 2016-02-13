class User < ActiveRecord::Base
    has_many :projects, through: :assignments
    has_many :assignments
    has_many :table_entries
end
