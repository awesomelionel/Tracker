Given /^(?:|I )am on the (.+)$/ do |page_name|
	visit path_to(page_name)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
	if page.respond_to? :should
		page.should have_content(text)
	else
		assert page.has_content?(text)
	end
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
	click_link(link)
end

Then /^I should be on (.+)$/ do |page_name|
	assert_equal path_to(page_name), URI.parse(current_url).path
end

When /^(?:|I )press "([^"]*)"$/ do |button|
	click_button(button)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
	fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
	fill_in(field, :with => value)
end

When /^I visit webpage for "([^\"]*)"$/ do |page_name|
	page = Project.find_by_name!(page_name)
	visit project_url(page)
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
	if page.respond_to? :should
		page.should have_no_content(text)
	else
		assert page.has_no_content?(text)
	end
end

