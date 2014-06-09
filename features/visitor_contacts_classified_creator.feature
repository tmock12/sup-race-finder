Feature: Visitor contacts classified creator
  Scenario: Success
    Given the following classified:
      | title | Starboard Drive |
      | email | izzy@gomez.com  |
    When I am on the classifieds page
    And I follow "Starboard Drive"
    When I fill in the following:
      | Name          | Beau O'Brien                 |
      | Email Address | beau@starboard-australia.com |
      | Message       | Hi Izzy, I love the Drive!   |
    And I press "Send"
    Then "izzy@gomez.com" should receive a "Starboard Drive Classified Message" email
