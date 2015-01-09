Feature: Members of HCN may proposed edits to organisations
As a member of Harrow Community Network
So I can improve the accuracy of HCN
I want to be able to propose edits to inaccurate organisation listings

  Background: organisations have been added to database
    Given the following organisations exist:
      | name       | description             | address        | postcode | telephone | website             | email             | publish_phone |
      | Friendly   | Bereavement Counselling | 34 pinner road | HA1 4HZ  | 020800000 | http://friendly.org | admin@friendly.xx | true          |
    Given the following users are registered:
      | email                         | password | organisation | confirmed_at         |
      | registered_user-2@example.com | pppppppp |              | 2007-01-01  10:00:00 |
    And cookies are approved

  Scenario: See only published fields
    Given I am signed in as a charity worker unrelated to "Friendly"
    And I visit the show page for the organisation named "Friendly"
    Then I should see "Propose an edit"
    Then I click "Propose an edit"
    And I should be on the new organisation proposed edit page for the organisation named "Friendly"
    And I should see "020800000"
    And I should not see "34 pinner road"