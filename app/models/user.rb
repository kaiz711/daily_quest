class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  has_many :userquests, dependent: :destroy
  has_many :quests, through: :userquests
  has_many :posts, dependent: :destroy
  has_many :images
  
  def self.find_for_oauth(auth, signed_in_resource = nil)

    

    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    

    if user.nil?

      

      email = auth.info.email
      user = User.where(:email => email).first

      unless self.where(email: auth.info.email).exists?
        

        if user.nil?
          

          if auth.provider == "kakao"

            user = User.new(
              profile_img: auth.info.image,
              password: Devise.friendly_token[0,20]
            )

          else
            user = User.new(
              email: auth.info.email,
              profile_img: auth.info.image,
              nickname: auth.info.name,
              password: Devise.friendly_token[0,20]
            )
            if user.email.nil?
              user.email = "#{auth.info.image}@facebook.com"
            end
          end
          user.save!
        end
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user

  end

  def email_required?
    false
  end
  
  after_create :set_default_role

  private

  def set_default_role
    add_role :user
  end
  
  after_create :set_default_role, if: Proc.new { User.count > 1 }
end
