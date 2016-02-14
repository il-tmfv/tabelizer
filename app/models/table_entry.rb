class TableEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :date, :presence => { :message => 'не должна быть пустой' }
  validates :duration, :numericality => { :message => 'должно быть числом' }, :inclusion => { :in => 1..24, :message => 'должно быть в диапазоне 1-24' }
end
