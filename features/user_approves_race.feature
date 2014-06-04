Feature: User approves race

  Scenario: Success
    Given I am signed in
    And the following race:
      | title | Florida Cup     |
      | email | danny@ching.com |
    Given I am on the home page
    When I follow "Dashboard"
    And I follow "Edit Race"
    And I follow "Approve Race"
    Then I should see "Succesfully activated race Florida Cup"
    And "danny@ching.com" should receive a "Florida Cup Race" email
