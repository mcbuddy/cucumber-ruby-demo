Given('I am on the homepage') do
  visit("http://automationpractice.com/index.php")
end

When('I click Sign In') do
  click_on "Sign in"
  expect(find('h1.page-heading').text).to eql("AUTHENTICATION")
end

When('I fill my credential') do
  find('#email').set('dtechover@example.com')
  fill_in 'passwd', with: 'Test1234'
  find('#SubmitLogin').click
end

Then('I should be logged in') do
  expect(find('h1.page-heading').text).to eql("MY ACCOUNT")
end

When('I fill wrong email') do
  find('#email').set('dtechover@test.com')
  fill_in 'passwd', with: 'Test1234'
  find('#SubmitLogin').click
end

Then('I should be not logged in') do
  expect(find('h1.page-heading').text).to eql("AUTHENTICATION")
end

And('I should see the error message') do
  expect(find('div.alert-danger').text).to eql("There is 1 error\nAuthentication failed.")
end