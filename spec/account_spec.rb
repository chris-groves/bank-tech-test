require 'account'
require 'date'

describe Account do
  describe '#balance' do
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
  end

  describe '#transaction_history' do
    it 'initializes with an empty transaction history' do
      account = Account.new
      expect(account.transaction_history).to eq []
    end

    it 'stores the details of a deposit' do
      account = Account.new
      account.deposit(1000)
      expect(account.transaction_history).to eq ["#{Account::CURRENT_DATE} || 1000.00 || || 1000.00"]
    end

    it 'stores the details of a withdrawal' do
      account = Account.new
      account.withdraw(500)
      expect(account.transaction_history).to eq ["#{Account::CURRENT_DATE} || || 500.00 || -500.00"]
    end
  end

  describe '#statement_headings' do
    it 'prints the statements headings' do
      account = Account.new
      expect { account.statement_headings }.to output("date || credit || debit || balance\n").to_stdout
    end
  end

  describe '#print_statement' do
    it 'prints a statement with headings and 1 transaction' do
      account = Account.new
      account.deposit(1000)
    expect { account.print_statement }.to output("date || credit || debit || balance\n31/07/2019 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'prints a statement with headings and 3 transactions' do
      account = Account.new
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
    expect { account.print_statement }.to output("date || credit || debit || balance\n31/07/2019 || || 500.00 || 2500.00\n31/07/2019 || 2000.00 || || 3000.00\n31/07/2019 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
