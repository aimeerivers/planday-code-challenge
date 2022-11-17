When("they try to log in with invalid credentials") do
  fill_in("Username", with: "foo")
  fill_in("Password", with: "bar")
  click_button("MainLoginButton")
end

When("they try to log in with valid credentials") do
  fill_in("Username", with: "plandayqa@outlook.com")
  fill_in("Password", with: "APItesting21")
  click_button("MainLoginButton")
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
