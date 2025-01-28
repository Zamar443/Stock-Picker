def stock_picker(prices)
  return nil if prices.length < 2 # Not enough days to make a transaction

  min_price_index = 0
  max_profit = 0
  best_days = nil

  prices.each_with_index do |price, day|
    if price < prices[min_price_index]
      min_price_index = day
    end

    # Calculate profit only if we are selling after buying
    profit = price - prices[min_price_index]
    if profit > max_profit
      max_profit = profit
      best_days = [min_price_index, day]
    end
  end

  if best_days
    # Print the output showing best days and profit
    buy_day, sell_day = best_days
    buy_price = prices[buy_day]
    sell_price = prices[sell_day]
    puts "Best day to buy: Day #{buy_day} ($#{buy_price}), Best day to sell: Day #{sell_day} ($#{sell_price})"
    puts "Maximum profit: $#{sell_price} - $#{buy_price} = $#{max_profit}"
  else
    puts "No profitable trade is possible."
    puts "Not enough days to make a transaction."
  end

  best_days
end

# Test cases
p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10]) # Expected: [1, 4], profit of $15 - $3 == $12
p stock_picker([7, 1, 5, 3, 6, 4])            # Expected: [1, 4], profit of $6 - $1 == $5
p stock_picker([7, 6, 4, 3, 1])               # Expected: nil, no profit possible
p stock_picker([1])                           # Expected: nil, not enough days to make a transaction
