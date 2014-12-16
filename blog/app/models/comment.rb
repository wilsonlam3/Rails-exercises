class Comment < ActiveRecord::Base
  belongs_to :users, class_name: "User"
  belongs_to :article
#  before_create :set_user_id
#  has_many :users

  validates :commenter, :body, presence: true

#  validates_presence_of :email

  private
    def set_user_id
      self.comment ||= User.find_by_id	
    end

end
