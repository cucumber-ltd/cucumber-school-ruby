Feature: Premium account

  Rules:
    - mention the word "buy" and you lose 5 credits
    - over-long messages cost 2 credits

  Background:
    Given the range is 100
    And the following people:
      | name     | Sean | Lucy |
      | location | 0    | 100  |

  Scenario: Shout over-long and use the word "buy" several times
    Given Sean has bought 30 credits
    When Sean shouts 2 over-long messages
    And Sean shouts 3 messages containing the word "buy"
    Then Lucy hears all Sean's messages
    And Sean should have 11 credits

  Scenario: Shout several over-long messages
    Given Sean has bought 30 credits
    When Sean shouts 2 over-long messages
    Then Lucy hears all Sean's messages
    And Sean should have 26 credits

  Scenario: Shout the word "buy" several times
    Given Sean has bought 30 credits
    When Sean shouts 3 messages containing the word "buy"
    Then Lucy hears all Sean's messages
    And Sean should have 15 credits

  @todo
  Scenario: BUG #2789
    Given Sean has bought 30 credits
    When Sean shouts "buy, buy buy!"
    Then Sean should have 25 credits
