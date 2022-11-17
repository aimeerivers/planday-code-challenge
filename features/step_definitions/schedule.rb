When("they create a shift for {string} from {string} to {string} today") do |employee_name, shift_start, shift_end|
  # Save shift details for later verification
  @shift = Shift.new(employee_name, shift_start, shift_end)

  # Find the cell for the employee for today and click on it
  Retriable.retriable(tries: 5) {
    sleep 1
    expect(page).to have_css(".board-header__title", text: "Today")
  }
  today_index = page.all(".board-header__title").map(&:text).index("Today")
  within(employee_row(@shift.employee_name)) { all(".board__cell")[today_index].click }
  
  # Ensure we opened the modal box for the right employee on the right day
  expect(page).to have_css(".edit-shift-modal__box")
  expect(page).to have_css(".edit-shift-header__manchet", text: /Create shift for #{@shift.employee_name}/i)
  expect(page).to have_css(".edit-shift-header__title", text: Date.today.strftime("%A, %d %B %Y"))

  # Fill in the form
  fill_in("From", with: shift_start)
  fill_in("To", with: shift_end)
  click_button "Create"
end

Then("they should see a schedule for the current week") do
  expect(page).to have_css(".scheduling__period-menu", text: "Week")
end

Then("there should be {int} employees displayed") do |expected_number|
  actual_number = page.all(".row-header3__icon").count
  expect(actual_number).to eq expected_number
end

Then("the shift is visible in the schedule grid") do
  today_index = page.all(".board-header__title").map(&:text).index("Today")
  within(employee_row(@shift.employee_name)) {
    within(all(".board__cell")[today_index]) {
      expect(page).to have_text(/#{@shift.shift_start} -#{@shift.shift_end}/)
    }
  }
  @shift.created = true
end

private

def employee_row(employee_name)
  page.first(".virtualized-board__row", text: employee_name)
end

class Shift
  attr_accessor :employee_name, :shift_start, :shift_end, :created

  def initialize(employee_name, shift_start, shift_end)
    @employee_name = employee_name
    @shift_start = shift_start
    @shift_end = shift_end
  end
end
