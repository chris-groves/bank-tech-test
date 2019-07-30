class Account
  attr_reader :balance, :transaction_history, :statement_headings

  CURRENT_DATE = Time.now.strftime("%d/%m/%Y")
  STATEMENT_HEADINGS = "date || credit || debit || balance"

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

  def print_statement
    STATEMENT_HEADINGS + "\n" + @transaction_history.join
  end

end
