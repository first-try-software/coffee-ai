class CoffeeMachine
  def initialize(driver: Driver.new)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    case drink
    when :coffee
      serve_coffee(options)
    when :tea
      serve_tea(options)
    else
      serve_unknown_drink
    end
  end

  private

  def serve_coffee(options)
    @driver.dispense_cup
    @driver.heat_water
    @driver.prepare_grounds
    @driver.dispense_water
    @driver.dispose_of_grounds
    add_sweetener(options) if options[:sweet]
    add_cream(options) if options[:creamy]
  end

  def serve_tea(options)
    @driver.dispense_cup
    @driver.heat_water
    @driver.dispense_tea_bag
    @driver.dispense_water
    add_sweetener(options) if options[:sweet]
  end

  def serve_unknown_drink
    @driver.dispense_cup
    @driver.heat_water
    @driver.dispense_water
  end

  def add_sweetener(options)
    @driver.dispense_sweetener unless options[:sweet].nil?
  end

  def add_cream(options)
    @driver.dispense_cream unless options[:creamy].nil?
  end
end
