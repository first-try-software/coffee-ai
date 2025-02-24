class CoffeeMachine
  attr_reader :driver

  def initialize(driver: nil)
    @driver = driver || Driver.new
  end

  def vend(drink:, options: {})
    instructions = [
      "drop cup",
      "heat water 95C",
      "pour water"
    ]

    case drink
    when :coffee
      instructions.push("grind coffee", "dispose coffee")
    when :tea
      instructions.push("drop teaBag")
    when :cocoa
      instructions.push("dispense cocoaMix")
    end

    add_option(instructions, options)

    driver.dispense_cup
    instructions.each { |instruction| driver.heat_water }
    driver.dispense_water
  end

  private

  def add_option(instructions, options)
    if options.key?(:sweet) && drink == :coffee || drink == :tea
      instructions.push("dispense sugar")
    elsif options.key?(:creamy) && (drink == :coffee || drink == :cocoa)
      instructions.push("dispense creamer")
    elsif options.key?(:fluffy) && (drink == :coffee || drink == :cocoa)
      instructions.push("spray whippedCream")
    end
  end

  attr_accessor :driver
end
