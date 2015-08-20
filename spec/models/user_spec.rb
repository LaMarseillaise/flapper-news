require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to :username }
  it { is_expected.to respond_to :email }

  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :username }

  it 'should validate the uniqueness of the username' do
    FactoryGirl.create(:user)
    expect(subject).to validate_uniqueness_of :username
  end

  it 'should validate the uniqueness of the email' do
    FactoryGirl.create(:user)
    expect(subject).to validate_uniqueness_of :email
  end
end
