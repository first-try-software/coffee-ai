class CoffeeMachine
  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    @driver.dispense_cup
    @driver.heat_water

    case drink
    when :tea
      serve_tea(options)
    when :cocoa
      serve_cocoa(options)
    else
      serve_coffee(options)
    end
  end

  private

  def serve_coffee(options = {})
    @driver.prepare_grounds
    @driver.dispense_water
    add_sweetener(options) if options[:sweet]
    add_cream(options) if options[:creamy]
    add_whipped_cream(options) if options[:fluffy]
    @driver.dispose_of_grounds
  end

  def serve_tea(options = {})
    @driver.dispense_tea_bag
    @driver.dispense_water
    add_sweetener(options) if options[:sweet]
    add_cream(options) if options[:creamy]
  end

  def serve_cocoa(options = {})
    @driver.dispense_cocoa_mix
    @driver.dispense_water
    add_whipped_cream(options) if options[:fluffy]
  end

  def add_sweetener(_options)
    @driver.dispense_sweetener
  end

  def add_cream(_options)
    @driver.dispense_cream
  end

  def add_whipped_cream(_options)
    @driver.dispense_whipped_cream
  end
end
