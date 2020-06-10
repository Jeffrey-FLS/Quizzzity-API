require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:each) {
    @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "john_doe@example.com",
        username: "johnD7",
        password: "JD123456"
    )
  }

  subject { @user }

  it "is user valid with valid attributes" do
    expect(subject).to be_valid
  end

  context 'User validations with Attributes' do
    it "has a first name" do
      expect(subject.first_name).to eq("John")
    end

    it "has a last name" do
      expect(subject.last_name).to eq("Doe")
    end

    it "has an email" do
      expect(subject.email).to eq("john_doe@example.com")
    end

    it "has a username" do
      expect(subject.username).to eq("johnD7")
    end

    it "has a password" do
      expect(subject.password).to eq("JD123456")
    end
  end

  context 'User validations without Attributes' do
    it "invalid without first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "invalid without last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "invalid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "invalid without username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "invalid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
