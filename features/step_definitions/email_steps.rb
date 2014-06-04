Then(/^"(.*?)" should receive a "(.*?)" email$/) do | email, subject |
  open_email(email)
  current_email.subject.should == subject
end
