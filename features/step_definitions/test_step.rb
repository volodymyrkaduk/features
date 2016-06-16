require 'watir-webdriver'
require 'rest-client'
require 'colorize'

browser = Watir::Browser.new :chrome, :switches => ['--ignore-certificate-errors']

Given (/^I am on the Base login page$/)do

browser.goto 'https://core.futuresimple.com/sales/users/login'
end

When (/^I enter valid user details to login$/)do
browser.text_field(:name,"user[email]").set("vladimir.kaduk@gmail.com")
browser.text_field(:name,"user[password]").set("VoV$ik86")
browser.button(:class,"btn btn-large btn-primary").click
end

Then (/^Sales page is shown$/)do
browser.url == "https://app.futuresimple.com/sales"
end

When (/^I go to Leads page$/)do
browser.goto 'https://app.futuresimple.com/leads/new'
end

And (/^Create new lead with all mandatory details set$/)do
Watir::Wait.until(20) {browser.url.include? '/leads/new'}
browser.text_field(:name=>'last_name').set("Kaduk")
browser.text_field(:name=>'first_name').set("Volodymyr")
browser.button(:class=>'save btn btn-large btn-primary').click

#RestClient::Request.execute(method: :post, url: "https://api.getbase.com/v2/leads", payload: {
#"data": {
#"first_name": "Mark",
#"last_name": "Johnson",
#"organization_name": "Design Services Company",
#}
#}, headers: {
#    "Accept" => "application/json",
#    "Content-Type" => "application/json",
#    "Authorization" => "Bearer $ACCESS_TOKEN"
#})

end