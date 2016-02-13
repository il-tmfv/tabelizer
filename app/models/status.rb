class Status < ActiveRecord::Base
    has_many :projects

    validates :text, :length => { :minimum => 3, :message => 'должен быть длиннее 3 символов' }, :uniqueness => { :message => 'должен быть уникальным' }
end
