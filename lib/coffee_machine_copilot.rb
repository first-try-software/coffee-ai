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
      dispense_options(options)
      @driver.dispose_of_grounds
    when :tea
      @driver.dispense_tea_bag
      @driver.dispense_water
      dispense_options(options)
    when :cocoa
      @driver.dispense_cocoa_mix
      @driver.dispense_water
      @driver.dispense_whipped_cream if options[:fluffy]
    else
      @driver.dispense_water
    end
  end

  private

  def dispense_options(options)
    @driver.dispense_sweetener if options[:sweet]
    @driver.dispense_cream if options[:creamy]
    @driver.dispense_whipped_cream if options[:fluffy]
  end
end
