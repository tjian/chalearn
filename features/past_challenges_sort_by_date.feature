Feature: past challenges sorted by different criteria

  As a registered challenge organizer
  So that I can keep track of my past challenges by being able to view them based on my preferences
  I want a list of past challenges in one single page sorted by due date or alphabetically

Background: challenges have been added to the database

  Given the following challenges exist:
  | title 	                  | due_date          | challenge_id | organizer     |
  | GE Flight Quest           | December 1, 2013  | 1            | Testing Rocks |
  | Zara Supply Chain         | January 23, 2014  | 2            | Testing Rocks |
  | Disney Queue Optimization | December 25, 2013 | 3            | Disney Rocks  |
  | Genome Sequencing         | March 31, 2014    | 4            | Bug Rocks     |
  | NASA Mars Data Collection | August 24, 2014   | 5            | Testing Rocks |
  | Fed QE Tapering Effects   | April 19, 2014    | 6            | Testing Rocks |
  | US Govt Default Impact    | October 17, 2013  | 7            | Bug Rocks     |

  And I am on the Chalearn challenges page
  And I am signed in as "Testing Rocks"

Scenario: sort challenges alphabetically
  When I follow "Challenge Title"
  Then I should see "GE Flight Quest" before "Zara Supply Chain"
  And I should not see "Disney Queue Optimization"
  And I should not see "Genome Sequencing"
  And I should not see "US Govt Default Impact"

Scenario: sort challenges by due date
  When I follow "Due Date"
  Then I should see "GE Flight Quest" before "Fed QE Tapering Effects"
  And I should not see "Disney Queue Optimization"
  And I should not see "Genome Sequencing"
  And I should not see "US Govt Default Impact"