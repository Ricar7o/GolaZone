class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :username

  has_many  :competitors
  has_many  :campaigns, through: :competitors

  validates :email, :first_name, :last_name, :username, presence: true

  def full_name
    return first_name + " " + last_name
  end

end
