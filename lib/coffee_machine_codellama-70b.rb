class Driver
  def drop_cup; end
  def heat_water(temp); end
  def grind_coffee; end
  def dispense_creamer; end
  def pour_water; end
end

class CoffeeMachine
  attr_reader :driver

  VALID_DRINKS = [:tea, :cocoa, :coffee]

  def initialize(driver)
    @driver = driver
  end

  def vend(drink, options={})
    return "Invalid drink" unless VALID_DRINKS.include?(drink)
    @driver.drop_cup
    if drink == :coffee || drink == :cocoa
      @driver.heat_water(95)
    else
      @driver.heat_water(70)
    end
    case drink
    when :coffee
      @driver.grind_coffee if options[:sweet] || options[:creamy]
      @driver.dispense_sugar if options[:sweet]
      @driver.dispense_creamer if options[:creamy]
    when :tea
      @driver.dispense_sugar if options[:sweet]
    when :cocoa
      # no additional instructions for cocoa
    end
    if drink == :coffee && options[:fluffy]
      @driver.spray_whipped_cream
    end
    @driver.pour_water
  end
end
