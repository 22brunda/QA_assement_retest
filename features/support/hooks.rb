require 'selenium-webdriver'
# require 'watir-webdriver'

browser =  Selenium::WebDriver.for :chrome



Before do
  @browser = browser
end

After do |scenario|
    if scenario.failed?
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
      screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
end

at_exit do
  browser.close
end