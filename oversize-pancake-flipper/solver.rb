class Solver
  def self.least_flips(line)
    split_line = line.split(" ")
    flipper_size = split_line[1].to_i
    line = split_line[0]

    return 0 if !line.include?("-")
    return 1 if !line.include?("+") && flipper_size == line.length

    first_minus = _first_minus(line)
    flips = 0
    while !first_minus.nil? && first_minus <= line.length - flipper_size do
      line = _flip(line, first_minus, flipper_size)
      first_minus = _first_minus(line)
      flips += 1
    end

    return "IMPOSSIBLE" unless first_minus.nil?
    flips
  end

  private

  def self._first_minus(line)
    line.index("-")
  end

  def self._flip(line, index, flipper_size)
    flipper_size.times do |i|
      line[index + i] = line[index + i] == "+" ? "-" : "+"
    end
    line
  end

  def self._largest_group(line)
    compare = line[0]
    line[0] = ""
    count = 1
    biggest = 1
    while compare.length != 0 do
      if line[0] == compare
        count += 1
      else
        biggest = count if count > biggest
        compare = line[0]
        count = 1
      end
      line[0] = ""
    end
    biggest
  end
end
