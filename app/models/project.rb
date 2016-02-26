class Project < ActiveRecord::Base
    belongs_to :customer
    has_many :table_entries
    has_many :users, through: :assignments
    has_many :assignments
    belongs_to :status

    validates :location, :length => { :minimum => 3, :message => 'должно быть длиннее 3 символов' }
    validates :title, :uniqueness => { :message => 'должно быть уникальным' }, :length => { :minimum => 3, :message => 'должно быть длиннее 3 символов' }
    validates :customer, :status, :presence => { :message => "должен быть определен"}

    scope :active, -> { joins(:status).where("statuses.text = 'Активный'") } 
    
    def spent_time 
      table_entries.sum(:duration)
    end
end
