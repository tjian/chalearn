Feature: pass configuration parameters from challenge organizer wizard to encoder

  As a registered challenge organizer
  So that I can set the configuration of my challenges with a due date, challenge description, data URI, etc.
  I want a form that will allow me to get configuration parameters from users and pass them on to the encoder

Background: registered challenge organizer trying to create a new challenge
  
  Given the following accounts exist:
  | email            | password       | workbench_id | first_name | last_name |
  | test@gmail.com   | testingitright | 1992         | Testing    | Rocks     |
  | bug@gmail.com    | buggingitright | 2000         | Bug        | Rocks     |

  And the following challenges exist:
  | title 	            | due_date        | challenge_id | organizer     | instruction | prizes | credits | tutorial | faq | factsheets | workshop |
  | Jurassic Park Queue | January 1, 0000 | 1            | Time Rangers  | N/A         | N/A    | N/A     | N/A      | N/A | N/A        | N/A      |

  And I am signed in as "Testing Rocks"
  And I am on the Chalearn wizard page

Scenario: given parameters
  When I input "Title" as title
  And I input "Due Date" as due_date
  And I input "Instruction" as instruction
  And I input "Prizes" as prizes
  And I input "Credits" as credits
  And I input "Tutorial" as tutorial
  And I input "FAQ" as FAQ
  And I upload "factsheets.pdf" as factsheets
  And I upload "workshop.pdf" as workshop
  And I click on the create button
  Then I should see the following challenges in database:
  | title 	            | due_date        | challenge_id | organizer     | instruction | prizes | credits | tutorial | faq | factsheets     | workshop     |
  | Jurassic Park Queue | January 1, 0000 | 1            | Time Rangers  | N/A         | N/A    | N/A     | N/A      | N/A | N/A            | N/A          |
  | Title               | Due Date        | 2            | Testing Rocks | Instruction | Prizes | Credits | Tutorial | FAQ | factsheets.pdf | workshop.pdf |
