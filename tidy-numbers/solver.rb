class Solver
  def self.last_tidy_number(line)
    number = line.to_i

    return number if _tidy?(number)

    while !_tidy?(number) do
      number -= 1
    end
    
    number
  end

  private

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
