class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :date, :presence => { :message => 'не должна быть пустой' }
end
