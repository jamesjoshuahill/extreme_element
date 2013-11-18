def solution_two(array)
  return -1 if array.empty?

  sum = 0
  min = { :index => 0, :value => array[0] }
  max = { :index => 0, :value => array[0] }

  array.each_with_index do |value, index|
    sum += value

    if value < min[:value]
      min[:index], min[:value] = index, value
    elsif value > max[:value]
      max[:index], max[:value] = index, value
    end
  end

  array_average = sum.to_f / array.length

  min[:deviation] = (min[:value] - array_average).abs
  max[:deviation] = (min[:value] - array_average).abs

  extreme = min[:deviation] >= max[:deviation] ? min : max

  extreme[:index]
end

############

def solution(array)
  return -1 if array.empty?
  array_average = average_value_of(array)
  extreme_element_index_in(array, array_average)
end

def extreme_element_index_in(array, array_average)
  first = first_element_with_deviation_of(array, array_average)

  extreme = array.each_with_index.inject(first) do |extreme, (value, index)|
    most_extreme(extreme, value, index, array, array_average)
  end[:index]
end

def first_element_with_deviation_of(array, average)
  { :index => 0,
    :value => array[0],
    :deviation => deviation_of(array[0], array, average) }
end

def most_extreme(extreme, value, index, array, array_average)
  deviation = deviation_of(value, array, array_average)
  
  if deviation > extreme[:deviation]
    { :index => index,
      :value => value,
      :deviation => deviation }
  else
    extreme
  end
end

def deviation_of(element, array, average = average_value_of(array))
  (element - average).abs
end

def average_value_of(array)
  array.inject(:+).to_f / array.length
end
