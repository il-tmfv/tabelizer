class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, through: :assignments
  has_many :assignments
  has_many :table_entries

  validates :first_name, :presence => {:message => 'не может быть пустым'}
  validates :last_name, :presence => {:message => 'не может быть пустой'}
  validates :position, :presence => {:message => 'не может быть пустой'}

  attr_accessor :table_year, :table_month

  def spent_time_on project
    table_entries.where(project: project).sum(:duration)
  end
end
