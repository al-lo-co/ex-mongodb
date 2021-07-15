require 'rails_helper'

RSpec.describe Category, type: :model do
  context "MongoID spec" do
    it { is_expected.to be_mongoid_document }
  end

  context "timstamps" do
    it { is_expected.to have_timestamps }
  end

  context "validations columns" do
    it { is_expected.to have_field(:name).of_type(String)}
    it { is_expected.to have_field(:description).of_type(String) }
  end

  context "relation with tasks" do
    it { is_expected.to have_many :tasks }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
  

  context "Login" do
    #it { is_expected.to validate_presence_of(:login) }
  end
  
  
  
end
