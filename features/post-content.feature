Feature: As an admin
  I want to be able to post content which can be viewed by users.

  @api
  Scenario: Create Repository Item without Media.
  Given I am logged in as a user with the "administrator" role
  When I visit "node/add/islandora_object"
  And I fill in "Title" with "Basic Object Test"
  And I select "Page" from "Model"
  And I press the "Save" button
  Then I should see the heading "Basic Object Test"

  @api @javascript
  Scenario: Create Repository Item with Image media.
  Given I am logged in as a user with the administrator role
  When I visit "node/add/islandora_object"
  And I fill in "Title" with "Basic Image Test - Simple gradient"
  And I click "Media" in the "tabs" region
  And I press the "Add media" button
  And I wait for AJAX to finish
  And I press "Image" in the "media modal" region
  And I attach the file "features/files/sample-img.jpg" to "Add files"
  And I wait for AJAX to finish
  And I fill in "Alternative text" with "Simple gradient" in the "media modal" region
  And I fill in "Media Use (value 1)" with "Service File" in the "media modal" region
  And I press "Save" in the "media footer" region
  And I press "Insert selected" in the "media footer" region
  And I click "System" in the "tabs" region
  And I select "Image" from "Model"
  And I press the "Save" button
  Then I should see the text "Repository Item Media"
  And I should see the "img" element with the "alt" attribute set to "Simple gradient" in the "content" region

  @api @javascript
  Scenario: Create Repository Item with Audio media.
  Given I am logged in as a user with the administrator role
  When I visit "node/add/islandora_object"
  And I fill in "Title" with "Basic Audio Test - Simple pluck"
  And I click "Media" in the "tabs" region
  And I press the "Add media" button
  And I wait for AJAX to finish
  And I press "Audio" in the "media modal" region
  And I attach the file "features/files/sample-audio.m4a" to "Add files"
  And I wait for AJAX to finish
  And I fill in "Media Use (value 1)" with "Service File" in the "media modal" region
  And I press "Save" in the "media footer" region
  And I press "Insert selected" in the "media footer" region
  And I click "System" in the "tabs" region
  And I select "Audio" from "Model"
  And I select "AblePlayer Viewer" from "View Mode"
  And I press the "Save" button
  Then I should see the text "Repository Item Media"
  And I should see the "div" element with the "class" attribute set to "able" in the "content" region

