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