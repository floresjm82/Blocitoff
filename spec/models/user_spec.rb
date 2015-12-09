require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.create!(name: "Jorge", email: "floresjmjr@gmail.com", password: "helloworld")}

  #Tests Name attribute
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(1)}

  #Tests Email attribute
  it {should validate_presence_of(:email)}
  it {should validate_uniqueness_of(:email)}
  it {should validate_length_of(:email).is_at_least(3)}
  it {should allow_value("floresjmjr@gmail.com").for(:email)}

  #Tests Password attribute
  it {should validate_presence_of(:password)}
  it {should have_secure_password}
  it {should validate_length_of(:password).is_at_least(6)}

  describe "attributes" do
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

  end


end
