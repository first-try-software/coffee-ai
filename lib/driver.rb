class Driver
  attr_reader :io

  def initialize(io = StringIO.new)
    @io = io
  end

  def dispense_cup
    io.puts("drop cup")
  end

  def heat_water
    io.puts("heat water 95C")
  end

  def dispense_water
    io.puts("pour water")
  end

  def prepare_grounds
    io.puts("grind coffee")
  end

  def dispose_of_grounds
    io.puts("dispose coffee")
  end

  def dispense_tea_bag
    io.puts("drop teaBag")
  end

  def dispense_sweetener
    io.puts("dispense sugar")
  end

  def dispense_cream
    io.puts("dispense creamer")
  end

  def dispense_cocoa_mix
    io.puts("dispense cocoaMix")
  end

  def dispense_whipped_cream
    io.puts("spray whippedCream")
  end
end
