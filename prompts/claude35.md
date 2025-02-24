Given the following Driver Ruby class:

```ruby
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
```

Write a CoffeeMachine Ruby class that passes the following RSpec tests:

```ruby
RSpec.describe CoffeeMachine do
  subject(:machine) { described_class.new(driver: driver) }

  let(:driver) { Driver.new }

  describe "#vend" do
    it "serves hot water if an unknown beverage is requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :unknown)

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          pour water
        INSTRUCTIONS
      )
    end

    it "serves coffee by default" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          grind coffee
          pour water
          dispose coffee
        INSTRUCTIONS
      )
    end

    it "serves coffee when coffee is requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :coffee)

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          grind coffee
          pour water
          dispose coffee
        INSTRUCTIONS
      )
    end

    it "serves tea when tea is requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :tea)

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          drop teaBag
          pour water
        INSTRUCTIONS
      )
    end

    it "adds sweetener to coffee when requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :coffee, options: { sweet: true })

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          grind coffee
          pour water
          dispense sugar
          dispose coffee
        INSTRUCTIONS
      )
    end

    it "adds sweetener to tea when requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :tea, options: { sweet: true })

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          drop teaBag
          pour water
          dispense sugar
        INSTRUCTIONS
      )
    end

    it "adds cream to coffee when requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :coffee, options: { creamy: true })

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          grind coffee
          pour water
          dispense creamer
          dispose coffee
        INSTRUCTIONS
      )
    end

    it "adds cream to tea when requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :tea, options: { creamy: true })

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          drop teaBag
          pour water
          dispense creamer
        INSTRUCTIONS
      )
    end

    it "serves cocoa when cocoa is requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :cocoa)

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          dispense cocoaMix
          pour water
        INSTRUCTIONS
      )
    end

    it "does NOT add sweetener or cream when cocoa is requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :cocoa, options: { sweet: true, creamy: true })

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          dispense cocoaMix
          pour water
        INSTRUCTIONS
      )
    end

    it "adds whipped cream to coffee when requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :coffee, options: { fluffy: true })

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          grind coffee
          pour water
          spray whippedCream
          dispose coffee
        INSTRUCTIONS
      )
    end

    it "adds whipped cream to cocoa when requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :cocoa, options: { fluffy: true })

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          dispense cocoaMix
          pour water
          spray whippedCream
        INSTRUCTIONS
      )
    end

    it "does NOT add whipped cream when tea is requested" do
      io = StringIO.new
      driver = Driver.new(io)
      machine = described_class.new(driver: driver)

      machine.vend(drink: :tea, options: { fluffy: true })

      expect(io.string).to eq(
        <<~INSTRUCTIONS
          drop cup
          heat water 95C
          drop teaBag
          pour water
        INSTRUCTIONS
      )
    end
  end
end
```
