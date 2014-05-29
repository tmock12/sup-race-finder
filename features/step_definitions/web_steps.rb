Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

When /^I follow "(.*?)"$/ do |link_text|
  click_link link_text
end

When /^I fill in the following:$/ do |table|
  table.rows_hash.each do |label, value|
    fill_in label, with: value
  end
end

When /^I check "(.*?)"$/ do |field_name|
  if Capybara.current_driver == Capybara.javascript_driver
    page.execute_script("$('##{field_labeled(field_name, visible: false)['id']}').click()")
  else
    check(field_name)
  end
end

When /^I uncheck "(.*?)"$/ do |field_name|
  if Capybara.current_driver == Capybara.javascript_driver
    page.execute_script("$('##{field_labeled(field_name, visible: false)['id']}').prop('checked', false)")
  else
    uncheck(field_name)
  end
end

When /^I press "(.*?)"$/ do |button_text|
  click_button button_text
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "(.*?)"$/ do |text|
  page.should have_no_content(text)
end

Then /^the "(.*?)" field should contain "(.*?)"$/ do |field, value|
  field = find_field(field)
  field_value = field.tag_name == 'textarea' && field.text.present? ? field.text : field.value
  field_value.should =~ /#{value}/
end

Then /^the "(.*?)" select should contain "(.*?)"$/ do |field, text|
  select_box = field_labeled(field)
  select_box.value.should == select_box.find(:css, "option", text: text).value
end

Then /^I should see the "(.*?)" field$/ do |field_name|
  field_labeled(field_name).should be
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I select "(.*?)" from "(.*?)"$/ do |value, field|
  select(value, :from => field)
end

Then /^"(.*?)" should be checked$/ do |label|
  find_field(label, visible: false).should be_checked
end

Then /^"(.*?)" should not be visible$/ do |text|
  page.should have_no_xpath('//*', text: text, visible: true)
end
