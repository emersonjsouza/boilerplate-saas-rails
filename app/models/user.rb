class User < ActiveRecord::Base
  after_create :create_tenent

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username,  presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  def create_tenent
     Apartment::Tenant.create(username)
   end
end
