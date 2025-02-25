class CoffeeMachine
  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    @driver.dispense_cup
    @driver.heat_water

    case drink
    when :coffee
      @driver.prepare_grounds
      @driver.dispense_water
      add_sweetener if options[:sweet]
      add_cream if options[:creamy]
      add_whipped_cream if options[:fluffy]
      @driver.dispose_of_grounds
    when :tea
      @driver.dispense_tea_bag
      @driver.dispense_water
      add_sweetener if options[:sweet]
      add_cream if options[:creamy]
    when :cocoa
      @driver.dispense_cocoa_mix
      @driver.dispense_water
      add_whipped_cream if options[:fluffy]
    else
      @driver.dispense_water
    end
  end

  private

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
