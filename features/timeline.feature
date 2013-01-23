Feature: View Timeline

  @home-timeline
  Scenario: Home Timeline
    Given I am authenticated
    When I start the app
    Then I should see my home timeline
