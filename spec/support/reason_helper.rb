module ReasonHelpers
  def create_reason_helper(argument, title = 'My new reason')
    within("div.reasons-#{argument}") do
      fill_in 'reason_title', with: title
      page.execute_script("$('form#new_reason').submit()")
    end
  end
end

RSpec.configure do |c|
  c.include ReasonHelpers
end
