
# Test Automation Repository 

This is a project of automatic tests. 
It was developed using:

- Development language - Ruby
- Frameworks - Rspec, Capybara, Cucumber, Httparty  

## Prerequisites

Ruby - version 2.7.2p137
ChromeDriver - version 97.0.4692.99

## Dependencies

- Cucumber [Gem Cucumber](https://github.com/cucumber/cucumber-ruby)
- Rspec    [Gem Rspec](https://github.com/rspec/rspec)
- Httparty [Gem Httparty](https://github.com/jnunemaker/httparty)
- Capybara [Gem Capybara](https://github.com/teamcapybara/capybara)
- Selenium Webdriver [Gem Selenium Webdriver](https://github.com/SeleniumHQ/selenium/tree/trunk/rb)
- Site Prism [Gem Site Prism](https://github.com/site-prism/site_prism)

## Installation

 >Clone the repository project

```bash
 git clone https://
```

>Then run the Bundler

```bash
 gem install bundler
```

>Install dependencies

```bash
 bundle install
```

## Run Tests

We will use the commands below to run the automated tests.  

>Run all tests

```bash
 cucumber
```

>Run specific tests - insert test tag after @

```bash
 cucumber -t@ 
```
