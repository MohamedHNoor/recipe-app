require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:recipe) }
    it { should have_many(:foods) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'devise modules' do
    it { should have_db_column(:email).of_type(:string).with_options(null: false, default: '') }
    it { should have_db_column(:encrypted_password).of_type(:string).with_options(null: false, default: '') }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
