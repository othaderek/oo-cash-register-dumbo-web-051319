require "pry"

class CashRegister
  # We set and get all of the methods in attr_accessor
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0, items=[])
    @total = 0
    @discount = discount
    @items = items
  end

  def add_item(title, price, amt = 1)
    self.total += price * amt
    amt.times do
      items << title
    end
    self.last_transaction = price * amt
  end

  def apply_discount
    if discount != 0
      self.total = (total * ((100 - discount).to_f/100)).to_i
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end
