# Given("I am on DocTalk Home Page") do 
#   @browser.navigate.to "https://doctalkweb.herokuapp.com/"
#   @browser.manage.window.maximize
#   sleep 2
#   @browser.find_element(xpath: "//div[2]/ul/li[1]/form/input").displayed?
#   sleep 2
# end

When("I Enter InValid Credentilas in SignUp Form") do
  sleep 2
  submit = @browser.find_element(xpath: "//div[2]/ul/li[1]/form/input")
  submit.click if submit.displayed?
  sleep 2
  @browser.find_element(name: 'commit').displayed?
  sleep 2
  @browser.find_element(id: 'user_name').send_keys "324"
  sleep 2
  @browser.find_element(id: 'user_email').send_keys "brunda.com"
  sleep 2
  @browser.find_element(id: 'user_password').send_keys "817"
  sleep 2
  @browser.find_element(id: 'user_password_confirmation').send_keys "hgf"
  sleep 2
  @browser.find_element(name: 'commit').click
end

Then("I should see the Error Message") do
  ele = "Should contain only alphabets!"  
  pname = @browser.find_element(id: 'user_name-error').text
  if ele == pname
   puts "#{pname}" 
  else
   raise "Failed"
  end

  email_ele = "Please enter a valid E-Mail address!"
  email = @browser.find_element(id: 'user_email-error').text
  if email_ele == email
   puts "#{email}" 
  else
   raise "Failed"
  end

  pwd_ele = "Enter minimum 6 characters!"
  password = @browser.find_element(id: 'user_password-error').text
  if pwd_ele == password
   puts "#{password}" 
  else
   raise "Failed"
  end

  con_pwd = "Password does not match"
  confirm_pwd = @browser.find_element(id: 'user_password_confirmation-error').text
  if con_pwd == confirm_pwd
   puts "#{confirm_pwd}" 
  else 
   raise "Failed"
  end
 end

 When("I try to Create an User with Existing Email Address") do
  ok_submit = @browser.find_element(xpath: "//div[2]/ul/li[1]/form/input")
  ok_submit.click if ok_submit.displayed?
  sleep 2
  @browser.find_element(name: 'commit').displayed?
  sleep 2
  @browser.find_element(id: 'user_name').send_keys "brunda"
  sleep 2
  @browser.find_element(id: 'user_email').send_keys "brunda@gmail.com"
  sleep 2
  @browser.find_element(id: 'user_password').send_keys "123456"
  sleep 2
  @browser.find_element(id: 'user_password_confirmation').send_keys "123456"
  sleep 2
  @browser.find_element(name: 'commit').click
end

Then("I should see Email Error Message {string}") do |string|
  sleep 2
  # exist_email = @browser.find_element(id: 'user_email-error').text
  # if  exist_email.include? "Email has already been taken"
  #   puts "#{exist_email}"
  # end

email_exist = "Email has already been taken"
  exist_email = @browser.find_element(id: 'user_email-error').text
  if email_exist == exist_email
   puts "#{email_exist}" 
  else 
   raise "Failed"
  end
end

