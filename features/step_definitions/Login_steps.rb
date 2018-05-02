Given("I am on DocTalk Home Page") do 
  @browser.navigate.to "https://doctalkweb.herokuapp.com/"
  @browser.manage.window.maximize
  sleep 2
  @browser.find_element(xpath: "//div[2]/ul/li[2]/form/input").displayed?
  sleep 2
end

When("I Login with InValid Credentials") do
  sleep 2
  @browser.find_element(xpath: "//div[2]/ul/li[2]/form/input").click
  sleep 2
  @browser.find_element(name: 'commit').displayed?
  sleep 2
  @browser.find_element(id: 'inputUsername').send_keys "brunda.com"
  sleep 2
  @browser.find_element(id: 'inputPassword').send_keys "123456"
  sleep 2
  @browser.find_element(name: 'commit').click
  sleep 2
end

Then("I should see Error Message as {string}") do |string|
  sleep 2
  a = @browser.find_element(xpath: "//*[@id='flash']/div").text
  if  a.include? "Incorrect E-Mail or Password"
    puts "#{a}"
  end
end

