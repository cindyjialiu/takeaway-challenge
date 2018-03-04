require_relative 'menu.rb'

class Order
  attr_reader :basket
  def initialize(basket = {})
    @basket = basket
  end

  def add_dish(number, quantity = 1)
    dish_name = (Menu.new.dishes[number]).first
    dish_number = Menu.new.dishes[number].last
    @basket[dish_name] = [dish_number, quantity]
    @basket
  end

  def basket_summary(basket)
    basket.map { |name, cost| [name, cost[0] * cost[1]] }.to_h
  end

  def total_cost(summary)
    summary.values.inject(&:+)
  end

  # def print_receipt#(basket,summary)
  #   details = basket_summary(basket).map { |name, cost| "#{name}  #{cost}" }.join("\n")
  #
  # end

end
