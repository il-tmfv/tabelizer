class Customer < ActiveRecord::Base
    has_many :projects

    validates :title, :presence => true, :length => { :minimum => 3, :message => 'должно быть длиннее 3 символов' }, :uniqueness => { :message => 'должно быть уникальным' } 
end
