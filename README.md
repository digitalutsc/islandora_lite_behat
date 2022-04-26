# Behat Testing for Islandora Lite
Integration testing for Islandora Lite using Behat.

## Installation
1. Clone and navigate into this repository. You must be able to run Drush from inside this folder.
2. Run `composer install`.
3. Setup the Drush driver.
  - In `config.json`, set `Drupal\DrupalExtension.drush.root` to Drupal's root folder and `Drupal\DrupalExtension.drush.alias` to the Drupal installation's [alias](https://www.drush.org/latest/site-aliases/) in Drush.
  - Install the [Behat Drush endpoint](https://github.com/drush-ops/behat-drush-endpoint).
3. In `config.json`, set `extensions.DrevOps\BehatScreenshotExtension.dir` to the directory that screenshots should be stored, and set `extensions.Drupal\MinkExtension.base_url` to the base URL of the Drupal installation.
4. Install Selenium and Chrome Webdriver. Selenium is only required for tests tagged `@javascript`.
  a. Download [Selenium Grid](https://www.selenium.dev/downloads/).
  b. Install Google Chrome:
  ```
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  ```
  c. Check the version of Chrome using `google-chrome --version`.
  d. Install the corresponding version of [Chrome Webdriver](https://chromedriver.chromium.org/getting-started).
5. In `config.json`, set `extensions.Drupal\MinkExtension.selenium2.wd_host` to the Selenium webdriver host URL.
6. Set environment variable `BEHAT_PARAMS`:
  ```
  export BEHAT_PARAMS=`cat config.json`
  ```

## Usage
### Background
This test suite makes use of the Drupal Extension to Behat and Mink. Tests are run using Behat and are described using [Gherkin](https://docs.behat.org/en/v2.5/guides/1.gherkin.html). Features consist of multiple scenarios, which are lists of steps. These steps are written in a human-readable manner and will call code as they are executed. Features can be found in `./features` as `.feature` files. Custom PHP code can be written in `./features/bootstrap` for custom steps.

### Writing Tests
Use `bin/behat dl` in order to list all currently available step definitions.

Scenarios can either be added to existing `.feature` files or new `.feature` files can be created.

`@api` is a required tag for use of the Drush or Drupal drivers. These drivers provide steps that can be used to automate user and simple content creation, rather than needing to write custom PHP code or do this purely through the UI.

`@javascript` is a required tag for use of tests that require Javascript.

### Custom Steps
To write custom steps, PHP code can be written in `FeatureContext.php`. If Behat cannot find a step in a feature file, it will provide some boilerplate code to get started with writing custom steps.

## Running Tests
1. Run Selenium in the background. Selenium is only required for tests tagged `@javascript`.
2. Run tests using `bin/behat`.
