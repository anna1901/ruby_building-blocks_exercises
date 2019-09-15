class StockPicker
  def call(arr)
    biggest_difference = 0
    i = 0
    j = 1
    buy = 0
    sell = 0
    while i < arr.size-1
      while j < arr.size
        if arr[j]-arr[i] > biggest_difference
          biggest_difference = arr[j]-arr[i]
          buy = i
          sell = j
        end
        j += 1
      end
      i += 1
      j = i+1
    end
    return buy, sell
  end
end
arr = (1..7).to_a.shuffle
p arr
p StockPicker.new.call(arr)
