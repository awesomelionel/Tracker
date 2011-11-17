Then /^I should see the "([^"]*)" link$/ do |text|
	page.should(have_css("a", :text => text),
				"Expected to see the #{text.inspect} link, but did not.")
end

#Given /^I am signed in as "([^"]*)"$/ do |arg1|
#  pending # express the regexp above with the code you wish you had
#end

Then /^I should not see the "([^"]*)" link$/ do |text|
	page.should_not(have_css("a", :text => text),
				"Expected to see the #{text.inspect} link, but did.")
end

