Feature: Google Search
  In order to find out more infomration about AWTA
  I need to be able to search Google
  
  Scenario: Google Search for AWTA
    Given that we are on the Google Homepage
    When I search for AWTA
    Then I should see "Austin Workshop on Test Automation"