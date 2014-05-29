Feature: User signs in

  Scenario: Success
    Given the following user:
      | email | cbaxter@paddle.com |
    When I am on the sign in page
    And I fill in the following:
      | email    | cbaxter@paddle.com |
      | password | password           |
    And I press "Sign In"
    Then I should be on the dashboard page

  Scenario: Invalid
    Given the following user:
      | email | cbaxter@paddle.com |
    When I am on the sign in page
    And I fill in the following:
      | email    | cbaxter@paddle.com |
      | password | Wr0nG              |
    And I press "Sign In"
    Then I should be on the sign in page
    And I should see "Your email or password are incorrect"
