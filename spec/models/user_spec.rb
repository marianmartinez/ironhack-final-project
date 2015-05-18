
require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without an email' do
    email = build(:user, email: nil)

    expect(email).to_not be_valid
  end

end
