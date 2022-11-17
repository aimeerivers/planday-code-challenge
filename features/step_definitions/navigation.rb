Given(/^an? .* visits the login form$/) do
  visit "/"
  accept_cookies
  expect(page).to have_css("#login")
  expect(page).to have_css("input#Username")
  expect(page).to have_css("input#Password[type=password]")
end

Given("an employee is on the schedule page") do
  step "an employee is logged in"
  step "they navigate to the schedule page"
end

When("they navigate to the schedule page") do
  within("[role=banner]") { click_link "Schedule" }
  expect(page.current_path).to end_with("/schedule")
  page.driver.switch_to_frame page.find("[title='Page content']")
end

private

def accept_cookies
  if page.has_css?(".cookie-banner")
    within(".cookie-banner") { click_button "OK" }
  end
end
