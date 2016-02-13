class User < ActiveRecord::Base
    has_many :projects, through: :assignments
    has_many :assignments
    has_many :table_entries

    validates :first_name, :presence => {:message => 'не может быть пустым'}
    validates :last_name, :presence => {:message => 'не может быть пустой'}
    validates :position, :presence => {:message => 'не может быть пустой'}
end
