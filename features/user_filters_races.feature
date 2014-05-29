Feature: User filters races

  Scenario: Success
    Given the following active races:
      | title        | date               |
      | Molokai      | August 17, 2014    |
      | Carolina Cup | September 10, 2014 |
    When I am on the list races page
    Then I should see "Molokai"
    And I should see "Carolina Cup"
    When I select "August" from "start_date_start_date_2i"
    And I select "2014" from "start_date_start_date_1i"
    And I select "August" from "end_date_end_date_2i"
    And I select "2014" from "end_date_end_date_1i"
    When I press "Filter"
    Then I should see "Molokai"
    But I should not see "Carolina Cup"
