require './extreme_element'

describe 'solution' do

  let(:array1) { [9, 4, -3, -10] }
  let(:array2) { [1, 2, 3, 4, 5] }
  let(:array3) { [1, 2, 3, 4, 5, 6, 6] }
  
  it 'should return -1 if the array is empty' do
    expect(solution([])).to eq -1
  end

  context 'should know the average value of' do

    example '[9, 4, -3, -10]' do
      expect(average_value_of(array1)).to eq 0
    end

    example '[1, 2, 3, 4, 5]' do
      expect(average_value_of(array2)).to eq 3
    end

    example '[1, 2, 3, 4, 5, 6, 6]' do
      expect(average_value_of(array3)).to eq (27.0 / 7)
    end

  end

  context 'should know the deviation of' do

    example '-3 in [9, 4, -3, -10]' do
      expect(deviation_of(-3, array1)).to eq 3
    end

    example '3 in [1, 2, 3, 4, 5]' do
      expect(deviation_of(3, array2)).to eq 0
    end

    example '1 in [1, 2, 3, 4, 5, 6, 6]' do
      expect(deviation_of(1, array3)).to eq ((27.0 / 7) - 1)
    end

    example '6 in [1, 2, 3, 4, 5, 6, 6]' do
      expect(deviation_of(6, array3)).to eq (6 - (27.0 / 7))
    end

  end

  context 'should know the index of an extreme element in' do

    example '[9, 4, -3, -10]' do
      expect(solution(array1)).to eq 3
    end

    example '[1, 2, 3, 4, 5]' do
      expect(solution(array2)).to eq 0
    end

    example '[1, 2, 3, 4, 5, 6, 6]' do
      expect(solution(array3)).to eq 0
    end

  end

end
