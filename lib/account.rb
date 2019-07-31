class Account
  attr_reader :balance, :transaction_history, :statement_headings

  CURRENT_DATE = Time.now.strftime("%d/%m/%Y")

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history << "#{CURRENT_DATE} || #{amount} || || #{@balance}"
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_history << "#{CURRENT_DATE} || || #{amount} || #{@balance}"
  end

  def statement_headings
    puts 'date || credit || debit || balance'
  end

  def print_statement
    STATEMENT_HEADINGS + "\n" + @transaction_history.join
  end

end
