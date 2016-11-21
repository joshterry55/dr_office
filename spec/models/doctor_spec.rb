require 'rails_helper'

RSpec.describe Doctor, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many :appointments }
    it { should have_many :patients }
  end

end
