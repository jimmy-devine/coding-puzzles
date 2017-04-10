class Solver
  def self.last_tidy_number(line)
    number = line.to_i

    return number if _tidy?(number)

    _make_tidy(number)
  end

  private
  def self._make_tidy(number)
    numArray = number.to_s.split("").map(&:to_i)

    biggestNumber = numArray.shift
    output = [biggestNumber]
    currentNumber = numArray[0]

    while numArray.length > 0
      if currentNumber < biggestNumber
        output = self._determine(output, numArray)
        output[0] = "" if output[0] == "0"
        return output
      else
        biggestNumber = currentNumber
        output << numArray.shift
        currentNumber = numArray[0]
      end
    end
  end

  def self._determine(left, right)
    if left.last == 1
      return "9" * (left.length + right.length - 1)
    end

    left_minus_1 = left.join("").to_i - 1
    return left_minus_1.to_s + ("9" * right.length) if _tidy?(left_minus_1)
    return (left[0] - 1).to_s + ( "9" * (left.length + right.length - 1))
  end

  def self._tidy?(number)
    numArray = number.to_s.split("").map(&:to_i)
    currentNumber = numArray.shift
    biggestNumber = currentNumber
    while numArray.length > 0 && biggestNumber <= currentNumber do
      currentNumber = numArray.shift
      biggestNumber = currentNumber if currentNumber > biggestNumber
    end
    numArray.length == 0 && biggestNumber <= currentNumber
  end
end
