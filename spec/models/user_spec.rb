
require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without a name' do
    user = build(:user, name: nil)

    expect(user).to_not be_valid
  end


end
