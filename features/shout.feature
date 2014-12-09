Feature: Shout

  In order to send location-sensitive messages to people nearby
  As a shouter
  I want to broadcast messages to people near me

  Rules:
    - only shout to people within a certain distance

  Background:
    Given the range is 100
    And the following people:
      | name     | Sean | Lucy | Larry |
      | location | 0    | 100  | 150   |

  Scenario: Listener is within range
    When Sean shouts "Free bagels!"
    Then Lucy hears Sean's message

  Scenario: Listener is out of range
    When Sean shouts "Free bagels!"
    Then Larry does not hear Sean's message

  Scenario: Two shouts
    When Sean shouts "Free bagels!"
    And Sean shouts "Free toast!"
    Then Lucy hears the following messages:
      | Free bagels |
      | Free toast  |
