module AutocompleteHelpers
  def fill_autocomplete(css_id, page, options = {})
    find("#{css_id}").native.send_keys options[:with]
    page.execute_script %{ $('#{css_id}').trigger('focus') }
    page.execute_script %{ $('#{css_id}').trigger('keydown') }
  end
end

RSpec.configure do |c|
  c.include AutocompleteHelpers
end
