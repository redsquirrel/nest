require "spec"
require "safariwatir"

BROWSER = Watir::Safari.new
PAGES = {
  "Google Homepage" => "http://google.com"
}

Given /^that we are on the (.*)$/ do |page|
  BROWSER.goto(PAGES[page])
end

When /^I search for (.*)$/ do |query|
  BROWSER.text_field(:name, "q").set(query)
  BROWSER.button(:name, "btnG").click
end

Then /^I should see "(.*)"$/ do |text|
  BROWSER.html.include?(text).should == true
end
