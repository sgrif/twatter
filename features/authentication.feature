Feature: Authentication

  Scenario: Application First Launch
    Given I am not authenticated
    When I start the app
    Then I should see a line matching "http://dev.twitter.com/apps/new"
