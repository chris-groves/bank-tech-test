class Account
  attr_reader :balance, :transaction_history

  CURRENT_DATE = Time.now.strftime("%d/%m/%Y")

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history << { :date => CURRENT_DATE,
      :credit => amount, :debit => "", :balance => @balance }
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_history << { :date => CURRENT_DATE, :credit => "", :debit => amount, :balance => @balance }
  end

  def print_statement
    @statement_headings = {
      :date => "date",
      :credit => "credit",
      :debit => "debit",
      :balance => "balance"
    }

    @statement_headings[:date] + ' || ' + @statement_headings[:credit] +
    ' || ' + @statement_headings[:debit] + ' || ' + @statement_headings[:balance]
  end

end
