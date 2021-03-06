class Account
  attr_reader :balance, :transaction_history

  CURRENT_DATE = Time.now.strftime("%d/%m/%Y")

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history.prepend("#{CURRENT_DATE} || #{'%.2f' % amount} || || #{'%.2f' % @balance}")

  end

  def withdraw(amount)
    if @balance - amount < 0
      raise "Error: transaction will take the balance below zero"
    else
      @balance -= amount
      @transaction_history.prepend("#{CURRENT_DATE} || || #{'%.2f' % amount} || #{'%.2f' % @balance}")
    end
  end

  def statement_headings
    puts 'date || credit || debit || balance'
  end

  def print_statement
    statement_headings
    puts @transaction_history
  end

end
