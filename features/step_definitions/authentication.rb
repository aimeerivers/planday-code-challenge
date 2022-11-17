When("they try to log in with invalid credentials") do
  log_in_as("foo", "bar")
end

When("they try to log in with valid credentials") do
  log_in_as("plandayqa@outlook.com", "APItesting21")
end

Then("they should not be able to log in") do
  expect(page).to have_css("#Username-validation-error")
  expect(page).to have_css("#Password-validation-error")
end

Then("they are logged in successfully") do
  within("[role=banner]") {
    expect(page).to have_css("[title=Employee]")
  }
end

private

def log_in_as(username, password)
  fill_in("Username", with: username)
  fill_in("Password", with: password)
  click_button("MainLoginButton")

  if(page).has_css?(".g-recaptcha")
    puts "I need help!"
    puts "Please solve the captcha, then press ctrl-d to continue."
    binding.pry
  end
end
