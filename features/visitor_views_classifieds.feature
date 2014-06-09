Feature: Visitor views classifieds
  Scenario:
    Given I am on the home page
    And the following classified:
      | title | Starboard AllStar |
      | price | $1200             |
    When I follow "Classifieds"
    Then I should see "Starboard AllStar"
    And I should see "1200"
