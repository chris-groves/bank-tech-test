require 'account'
require 'date'

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
    expect(account.transaction_history).to eq ["#{Account::CURRENT_DATE} || 1000 || || 1000"]
  end

  it 'stores the details of a withdrawal' do
    account = Account.new
    account.withdraw(500)
    expect(account.transaction_history).to eq ["#{Account::CURRENT_DATE} || || 500 || -500"]
  end

  it 'prints out statement headings' do
    account = Account.new
    expect(Account::STATEMENT_HEADINGS).to eq "date || credit || debit || balance"
  end

  it 'prints out statement with headings & a transaction' do
    account = Account.new
    account.deposit(1000)
    expect(account.print_statement).to eq "date || credit || debit || balance" + "\n" + "#{Account::CURRENT_DATE} || 1000 || || 1000"
  end
end
