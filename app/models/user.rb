class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :name,  presence: true
  # before_create :default_date

  private
  # def default_date
  #   @created_at = Date.today
  # end
end
