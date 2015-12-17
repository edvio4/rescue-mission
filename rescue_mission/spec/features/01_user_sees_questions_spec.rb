require 'rails_helper'
require 'pry'

feature "User sees all questions" do

  scenario "user sees all question" do
    question1 = create(:question)
    question2 = create(:question, title: 'ActiveModel::ForbiddenAttributesError when creating new user', description: 'up vote 139 down vote favorite 46 I have this model in Ruby but it throws a ActiveModel::ForbiddenAttributesError class User < ActiveRecord::Base attr_accessor :password validates :username, :presence => true, :uniqueness => true, :length => {:in => 3..20} VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i validates :email, presence: true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX } validates :password, :confirmation => true validates_length_of :password, :in => 6..20, :on => :create before_save :encrypt_password after_save :clear_password def encrypt_password if password.present? self.salt = BCrypt::Engine.generate_salt self.encrypted_password= BCrypt::Engine.hash_secret(password, salt) end end def clear_password self.password = nil end end when I run this action def create @user = User.new(params[:user]) if @user.save flash[:notice] = "You Signed up successfully" flash[:color]= "valid" else flash[:notice] = "Form is invalid" flash[:color]= "invalid" end render "new" end on ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]. Can you please tell me how to get rid of this error or establish a proper user registration form? Thanks in advance.')
    visit '/'

    expect(page).to have_content "Listing Questions"
    expect(page).to have_content(question1.title)
    expect(page).to have_content(question2.title)

  end

  scenario "questions are listed newest first" do
    question1 = create(:question)
    question2 = create(:question, title: 'ActiveModel::ForbiddenAttributesError when creating new user', description: 'up vote 139 down vote favorite 46 I have this model in Ruby but it throws a ActiveModel::ForbiddenAttributesError class User < ActiveRecord::Base attr_accessor :password validates :username, :presence => true, :uniqueness => true, :length => {:in => 3..20} VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i validates :email, presence: true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX } validates :password, :confirmation => true validates_length_of :password, :in => 6..20, :on => :create before_save :encrypt_password after_save :clear_password def encrypt_password if password.present? self.salt = BCrypt::Engine.generate_salt self.encrypted_password= BCrypt::Engine.hash_secret(password, salt) end end def clear_password self.password = nil end end when I run this action def create @user = User.new(params[:user]) if @user.save flash[:notice] = "You Signed up successfully" flash[:color]= "valid" else flash[:notice] = "Form is invalid" flash[:color]= "invalid" end render "new" end on ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]. Can you please tell me how to get rid of this error or establish a proper user registration form? Thanks in advance.')
    visit '/'

    index = question1.title.index("'")
    page.body.index(question2.title).should < page.body.index(question1.title[0,index])
  end

  
end
