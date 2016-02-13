class Project < ActiveRecord::Base
    belongs_to :customer
    has_many :table_entries
    has_many :users, through: :assignments
    has_many :assignments
    belongs_to :status

    validates :location, :length => { :minimum => 3, :message => 'должно быть длиннее 3 символов' }
    validates :title, :uniqueness => { :message => 'должно быть уникальным' }, :length => { :minimum => 3, :message => 'должно быть длиннее 3 символов' }
end
