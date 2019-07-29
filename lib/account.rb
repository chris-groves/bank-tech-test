class Account
  attr_reader :balance, :transaction_history

  CURRENT_DATE = Time.now.strftime("%d/%m/%Y")

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history << { :date => CURRENT_DATE, :credit => amount, :debit => "", :balance => @balance }
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_history << { :date => CURRENT_DATE, :credit => "", :debit => amount, :balance => @balance }
  end


end
