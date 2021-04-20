class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable

  def self.customers 
    all.where("superadmin_role= ? ", false).where("user_role= ?" ,  true )
  end
end
