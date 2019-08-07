# Your Code Here
def map(array)
  newarray = []
  i = 0
  while i < array.length do
    newarray.push(yield(array[i]))
    i += 1
  end
  newarray
end


def reduce(array, starting_point = 0)
  total = 0 
  i = 0 
  while i < array.length do
    total = yield(total, array[i])
    i += 1
  end
  starting_point + total
end

# def reduce(array)
#  i = 0
#   while i < array.length do
#     return false if !source_array[i]
#     i += 1
#   end
#   return true
# end

# def reduce_to_any_true(source_array)
#   i = 0
#   while i < source_array.length do
#     return true if source_array[i]
#     i += 1
#   end
#   return false
# end

  it "returns a running total when not given a starting point" do
    source_array = [1,2,3]
    expect(reduce(source_array){|memo, n| memo + n}).to eq(6)
  end

  it "returns a running total when given a starting point" do
    source_array = [1,2,3]
    starting_point = 100
    expect(reduce(source_array, starting_point){|memo, n| memo + n}).to eq(106)
  end
  it "returns true when all values are truthy" do
    source_array = [1, 2, true, "razmatazz"]
    expect(reduce(source_array){|memo, n| memo && n}).to be_truthy
  end

  it "returns false when any value is false" do
    source_array = [1, 2, true, "razmatazz", false]
    expect(reduce(source_array){|memo, n| memo && n}).to be_falsy
  end

  it "returns true when a truthy value is present" do
    source_array = [ false, nil, nil, nil, true]
    expect(reduce(source_array){|memo, n| memo || n}).to eq(true)
  end

  it "returns false when no truthy value is present" do
    source_array = [ false, nil, nil, nil]
    expect(reduce(source_array){|memo, n| memo && n}).to eq(false)
  end
