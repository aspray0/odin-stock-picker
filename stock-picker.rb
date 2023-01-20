# stock-picker.rb

# def method stock_picker that takes an array of stock prices
def stock_picker(stock_prices)

# init buy_prices & sell_prices arrays, & profit_hash
  buy_prices = stock_prices[..(stock_prices.length - 2)]
  sell_prices = stock_prices[1..]
  profit_hash = {}

  # have to buy first, so iterate from buy_prices
  buy_prices.each_with_index do |buy_price, buy_date|
    # sell_prices only need to iterate from the days after the buy_date
    sell_prices[(buy_date)..].each do |sell_price|
      # use an array of the buy/sell dates as the key to the profit value, store in profit_hash
      profit_hash[[buy_date, stock_prices.index(sell_price)]] = sell_price - buy_price
    end
  end
  # from the profit_hash, return the buy & sell dates (key) that generates the most profit (max value)
  return profit_hash.key(profit_hash.values.max)
end