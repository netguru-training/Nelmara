require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  describe 'db columns' do
    it { should have_db_column(:title) }
    it { should have_db_column(:body) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(2).is_at_most(300) }
  end

end

