module Enumerable
  def my_each
    for i in (0...self.size)
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    for i in (0...self.size)
      yield(self[i], i)
    end
    self
  end

  def my_select
    new_arr = []
    self.my_each do |e|
      if yield(e)
        new_arr << e
      end
    end
    new_arr
  end

  def my_all?
    answear = true
    self.my_each do |e|
      if !yield(e)
        answear = false
      end
    end
    answear
  end

  def my_any?
    answear = false
    self.my_each do |e|
      if yield(e)
        answear = true
      end
    end
    answear
  end

  def my_none?
    answear = true
    self.my_each do |e|
      if yield(e)
        answear = false
      end
    end
    answear
  end

  def my_count(arg = nil)
    counter = 0
    if block_given?
      self.my_each do |e|
        if yield(e)
          counter += 1
        end
      end
    elsif !arg.nil?
      self.my_each do |e|
        if e == arg
          counter += 1
        end
      end
    else
      counter =  self.size
    end
    counter
  end

  def my_map(proc = nil)
    new_arr = []
    if !proc.nil?
      self.my_each do |e|
        new_arr << proc.call(e)
      end
    elsif block_given?
      self.my_each do |e|
        new_arr << yield(e)
      end
    end
    new_arr
  end

  def my_inject(*arr)
    memo = 0
    if block_given?
      if arr.size == 1
        memo = arr.first
      end
      self.my_each do |obj|
        memo = yield(memo, obj)
      end
    else
      if arr.size == 2
        memo = arr.first
        sym = arr[1]
      elsif arr.size == 1
        sym = arr.first
      end
      self.my_each do |e|
        memo = memo.send(sym, e)
      end
    end
    memo
  end

end
=begin
puts (0..9).to_a.my_each {|e| puts e*3 }.inspect
puts (0..9).to_a.my_each_with_index {|e, i| puts [e*3, i].inspect }.inspect

puts (0..9).to_a.my_select {|e| e.even?}.inspect
puts (0..9).to_a.my_all? {|e| e < 10}
puts (0..9).to_a.my_all? {|e| e > 10}
puts (0..9).to_a.my_any? {|e| e < 1}
puts (0..9).to_a.my_any? {|e| e > 10}
puts (0..9).to_a.my_none? {|e| e < 10}
puts (0..9).to_a.my_none? {|e| e > 10}
puts (0..9).to_a.my_none? {|e| e < 1}
puts (0..9).to_a.my_count {|e| e <= 3}
puts (0..9).to_a.my_count(3)
puts (0..9).to_a.my_count
puts (0..9).to_a.my_map {|e| e*3 }.inspect
puts (5..10).to_a.my_inject {|sum, e| sum += e }
puts (5..10).to_a.my_inject(5) {|sum, e| sum += e }
puts (5..10).to_a.my_inject(5, :+)
puts (5..10).to_a.my_inject(1, :*)

def multiply_els(arr)
  arr.my_inject(1, :*)
end

puts  multiply_els([2,4,5])
=end
puts (0..9).to_a.my_count {|e| e <= 3}
puts (0..9).to_a.my_count(3)
puts (0..9).to_a.my_count
puts (0..9).to_a.my_map {|e| e*3 }.inspect
times_3 = Proc.new { |e| e * 3}
puts (0..9).to_a.my_map(&times_3).inspect
