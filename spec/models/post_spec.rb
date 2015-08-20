require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :link }
  it { is_expected.to respond_to :upvotes }

  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :link }
  it { is_expected.to validate_presence_of :user }
end
