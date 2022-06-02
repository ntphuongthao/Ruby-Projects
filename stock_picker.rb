def stock_picker(prices)
    buy = 1
    sell = 1
    profit = 0
    for i in 0..prices.length - 2 do
        for j in i..prices.length - 1 do
            cur = prices[j] - prices[i]
            if cur > profit 
                profit = cur
                buy = i
                sell = j
            end
        end
    end
    [buy, sell]
end

res = stock_picker([17,3,6,9,15,8,6,1,10])
puts res