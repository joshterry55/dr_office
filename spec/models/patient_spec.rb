require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "associations" do
    it { should have_many :doctors }
    it { should have_many :appointments }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
