class Customer < ActiveRecord::Base
    has_many :projects

    validates :title, :length => { :minimum => 3, :message => 'должно быть длиннее 3 символов' }
end
