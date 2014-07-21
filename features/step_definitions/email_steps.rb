Then(/^"(.*?)" should receive a "(.*?)" email$/) do | email, subject |
  open_email(email)
  expect(current_email.subject).to eq(subject)
end
