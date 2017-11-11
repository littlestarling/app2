class Contact < ActiveRecord::Base
    belongs_to :user

    validates :name, presence: true
    validates :email, presence: true
    validates :content, presence: true, length: {maximum: 200 }
end
