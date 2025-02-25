class CoffeeMachine
  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    prepare_base_drink

    case drink
    when :coffee
      prepare_coffee(options)
    when :tea
      prepare_tea(options)
    when :cocoa
      prepare_cocoa(options)
    else
      prepare_hot_water
    end
  end

  private

  attr_reader :driver

  def prepare_base_drink
    driver.dispense_cup
    driver.heat_water
  end

  def prepare_hot_water
    driver.dispense_water
  end

  def prepare_coffee(options)
    driver.prepare_grounds
    driver.dispense_water
    add_options_for_coffee_and_tea(options)
    add_whipped_cream(options)
    driver.dispose_of_grounds
  end

  def prepare_tea(options)
    driver.dispense_tea_bag
    driver.dispense_water
    add_options_for_coffee_and_tea(options)
  end

  def prepare_cocoa(options)
    driver.dispense_cocoa_mix
    driver.dispense_water
    add_whipped_cream(options)
  end

  def add_options_for_coffee_and_tea(options)
    driver.dispense_sweetener if options[:sweet]
    driver.dispense_cream if options[:creamy]
  end

  def add_whipped_cream(options)
    return unless options[:fluffy]
    return if current_drink_is_tea?

    driver.dispense_whipped_cream
  end

  def current_drink_is_tea?
    caller_locations(1,1)[0].label.include?('tea')
  end
end
