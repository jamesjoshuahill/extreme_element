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
