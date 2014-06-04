module SessionStepMethods
  def sign_in(user)
    visit '/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
  end
end
World(SessionStepMethods)

Given 'I am signed in' do
  @user ||= Fabricate(:user)
  sign_in(@user)
end
