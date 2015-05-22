require 'rails_helper'

describe User do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:password).is_at_least(3) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }
  it { should_not allow_value("base@example").for(:email) }
  it { should_not allow_value("blah").for(:email) }

end
