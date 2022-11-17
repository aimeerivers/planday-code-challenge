# Planday code challenge

## Setup

You will a recent version of Ruby. I have version 3.1.2.

Ruby can easily be installed using [RVM](https://rvm.io/) (Ruby Version Manager).

    rvm install ruby-3.1.2
    rvm use ruby-3.1.2
    ruby -v

The rest is installed with Ruby bundler. In the folder `planday-code-challenge`, run

    bundle install

This will install:

* **Cucumber** *(a behaviour driven development tool)*
* **Selenium Webdriver** *(cross-browser framework for testing)*
* **Webdriver Manager** *(a tool to install browser drivers for you)*
* **Capybara** *(a Ruby framework for interfacing with Selenium)*
* **RSpec** *(an expressive framework for behaviour testing)*

## Run automated tests

In the folder `planday-code-challenge`, run

    cucumber

The first time you run it, Webdriver Manager will check if you have a Chrome driver, and install it if not. The first run can therefore take a little while. But before long you should see Google Chrome open on your machine and begin running the automated tests.

Normally, I would use a Selenium Grid or a service such as BrowserStack or SauceLabs, but it is not necessary for this example.

