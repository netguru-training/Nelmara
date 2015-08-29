require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts) }
  end

  describe 'db columns' do
    it { should have_db_column(:username) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
  end

end

