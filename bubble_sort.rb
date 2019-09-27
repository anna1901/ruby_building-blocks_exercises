def bubble_sort(arr)
  i = 0
  j = 1
  changed = true
  while i < arr.size && changed == true
    changed = false
    while j < arr.size - i
      if arr[j-1] > arr[j]
        arr[j-1], arr[j] = arr[j], arr[j-1]
        changed = true
      end
      j += 1
    end
    puts arr.inspect
    j = 1
    i += 1
  end
  arr
end

def bubble_sort_by(arr)
  i = 0
  j = 1
  changed = true
  while i < arr.size && changed == true
    changed = false
    while j < arr.size - i
      if yield(arr[j-1], arr[j]) > 0
        arr[j-1], arr[j] = arr[j], arr[j-1]
        changed = true
      end
      j += 1
    end
    puts arr.inspect
    j = 1
    i += 1
  end
  arr
end

bubble_sort_by(["hi","hello","hey", "buenasnoches", "cat"]) do |left,right|
   left.length - right.length
 end
