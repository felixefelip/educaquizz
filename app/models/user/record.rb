# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
module User
  class Record < ApplicationRecord
    self.table_name = "users"

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :quiz_realizations, dependent: :destroy,
                                 inverse_of: :user,
                                 foreign_key: :user_id,
                                 class_name: "::Quiz::Realization::Record"

    has_many :quiz_availabilities, dependent: :destroy,
                                         inverse_of: :teacher,
                                         foreign_key: :user_id,
                                         class_name: "::Quiz::Availability::Record"
  end
end
