class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :microposts, dependent: :destroy
  validates :contents, presence: true, length: { maximum: 140 }
  validates :name, presence: true, length: { minimum: 4, maximum: 50}
end
