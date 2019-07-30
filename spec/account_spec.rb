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

  it 'can receive a withdrawal of money' do
    account = Account.new
    account.deposit(1000)
    account.withdraw(500)
    expect(account.balance).to eq 500
  end

  it 'initializes with an empty transaction history' do
    account = Account.new
    expect(account.transaction_history).to eq []
  end

  it 'stores the details of a deposit' do
    account = Account.new
    account.deposit(1000)
    expect(account.transaction_history).to eq [{ :date => Account::CURRENT_DATE, :credit => 1000, :debit => "", :balance => 1000} ]
  end

  it 'stores the details of a withdrawal' do
    account = Account.new
    account.withdraw(500)
    expect(account.transaction_history).to eq [{ :date => Account::CURRENT_DATE, :credit => "", :debit => 500, :balance => -500} ]
  end

  it 'prints out statement with headings' do
    account = Account.new
    expect(account.print_statement).to eq("date || credit || debit || balance")
  end
end
