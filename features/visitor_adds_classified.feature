Feature: Visitor adds classified

  Scenario: Success
    Given I am on the classifieds page
    When I follow "Add a Classified"
    And I fill in the following:
      | Title       | Starboard Astro 10'6  |
      | Price       | $1200                 |
      | Description | This is an inflatable |
      | City        | Atlanta               |
      | State       | Georgia               |
      | Country     | United States         |
      | Email       | connor@baxter.com     |
    And I press "Create Classified"
    Then I should be on the classifieds page
    And I should see "Succesfully added Starboard Astro 10'6."
    And "connor@baxter.com" should receive a "Starboard Astro 10'6 Classified" email

  Scenario: Invalid
    Given I am on the classifieds page
    When I follow "Add a Classified"
    And I press "Create Classified"
    Then I should see "Title can't be blank"
    And I should see "Price can't be blank"
    And I should see "Email can't be blank"
