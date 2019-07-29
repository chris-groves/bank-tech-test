require 'account'

describe Account do
  it 'initializes with a balance of 0' do
    account = Account.new
    expect(account.balance).to eq 0
  end

  it 'can receive a deposit of money' do
    account = Account.new
    account.deposit(1000)
    expect(account.balance).to eq 1000
  end
end
