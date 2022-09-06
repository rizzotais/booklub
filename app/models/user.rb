class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :set_fav_list_to_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :readings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :books, through: :readings
  has_one :list

  def set_fav_list_to_user
    @list = List.new(user: self)
    @list.save!
  end
end
