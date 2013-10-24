Feature: encode parameters into HTML and YAML files for automatic website construction

  As a registered challenge organizer
  So that I can automate the process of challenge website generation
  I want a system that is able to encode the stored parameters into HTML/YAML files 

Background: registered challenge organizer trying to create a new challenge
  
  Given the following accounts exist:
  | email            | password       | workbench_id | first_name | last_name |
  | test@gmail.com   | testingitright | 1992         | Testing    | Rocks     |
  | bug@gmail.com    | buggingitright | 2000         | Bug        | Rocks     |

  And the following challenges exist:
  | title 	            | due_date        | challenge_id | organizer     | instruction | prizes | credits | tutorial | faq | factsheets     | workshop     |
  | Jurassic Park Queue | January 1, 0000 | 1            | Time Rangers  | N/A         | N/A    | N/A     | N/A      | N/A | N/A            | N/A          |
  | Title               | Due Date        | 2            | Testing Rocks | Instruction | Prizes | Credits | Tutorial | FAQ | factsheets.pdf | workshop.pdf |

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
  