Given("a user visits the login form") do
  visit "/"
  accept_cookies
  expect(page).to have_css("#login")
  expect(page).to have_css("input#Username")
  expect(page).to have_css("input#Password[type=password]")
end

private

def accept_cookies
  if page.has_css?(".cookie-banner")
    within(".cookie-banner") { click_button "OK" }
  end
end
