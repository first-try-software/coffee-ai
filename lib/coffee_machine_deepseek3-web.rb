class CoffeeMachine
  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    @driver.dispense_cup
    @driver.heat_water

    case drink
    when :coffee
      prepare_coffee(options)
    when :tea
      prepare_tea(options)
    when :cocoa
      prepare_cocoa(options)
    else
      prepare_unknown
    end
  end

  private

  def prepare_coffee(options)
    @driver.prepare_grounds
    @driver.dispense_water
    add_sweetener if options[:sweet]
    add_cream if options[:creamy]
    add_whipped_cream if options[:fluffy]
    @driver.dispose_of_grounds
  end

  def prepare_tea(options)
    @driver.dispense_tea_bag
    @driver.dispense_water
    add_sweetener if options[:sweet]
    add_cream if options[:creamy]
  end

  def prepare_cocoa(options)
    @driver.dispense_cocoa_mix
    @driver.dispense_water
    add_whipped_cream if options[:fluffy]
  end

  def prepare_unknown
    @driver.dispense_water
  end

  def add_sweetener
    @driver.dispense_sweetener
  end

  def add_cream
    @driver.dispense_cream
  end

  def add_whipped_cream
    @driver.dispense_whipped_cream
  end
end
