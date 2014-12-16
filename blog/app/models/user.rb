class User < ActiveRecord::Base
#  belongs_to :comment
  belongs_to :role
  before_create :set_default_role
  has_many :comments, class_name: "Comment", foreign_key: "users_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :password, :email
#       validates_uniqueness_of :username
       validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  private
    def set_default_role
      self.role ||= Role.find_by_name('registered')  	
    end

end
