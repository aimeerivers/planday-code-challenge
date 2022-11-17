Then("they should see a schedule for the current week") do
  page.driver.switch_to_frame page.find("[title='Page content']")
  expect(page).to have_css(".scheduling__period-menu", text: "Week")
end

Then("there should be {int} employees displayed") do |expected_number|
  actual_number = page.all(".row-header3__icon").count
  expect(actual_number).to eq expected_number
end
