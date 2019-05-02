

# Getting started


# Installation

## Installing cucumber

Reference:[Cucumber](https://cucumber.io/docs)


```shell
# NPM
npm install --save-dev cucumber
```

[Apickli - REST API integration testing framework with cucumber.js](https://github.com/apickli/apickli)


## Installing cypress

Install locally executing:

``$ npm install cypress --save-dev``

Add in package.json, npm scripts to execute Cypress commands:

```
{
  "scripts": {
    "cypress:open": "cypress open"
  }
}
```

Create a file named **cypress.json**:

```
{
  "baseUrl": "http://localhost:3007",
  "fixturesFolder": false,
  "integrationFolder": "./test/e2e/specs",
  "supportFile": false
}

```

Here we're changing the default path used by cypress where tests are defined (integration by default).


https://medium.com/@itortv/how-to-integrate-cypress-and-cucumber-in-your-development-flow-in-just-a-few-weeks-96a46ac9165a


# Tutorial

## Writing tests of API services

test/
    ---- features/
    --------- step_definitions/
    -------------- apickli-gherkin.js
    --------- support/
    -------------- init.js
    --------- myapi.feature
    ---- package.json
    

## Writing tests


We are going to create a test file named 'home.spec.js' to go to the home page.

```
|----src
    | |----test
    | | |----e2e
    | | | |----specs
    | | | | |----home.spec.js
```

And with the content:

```
describe('Go home page', function() {
  it('Does not do much!', function() {
    expect(true).to.equal(true)
  })
})
```

## Executing tests

1. Open a terminal and execute:

    ``$ npm run cypress:open``

    You'll see how the app is opened and one screen to help you to get started:

    ![help started cypress](img/cypress-start.png)

    Press *OK, got it!* to continue.
    
1. Below **INTEGRATION TESTS** you can see the home.spec.js created
1. Click on line **home.spec.js**
1. You'll see how the test is executed and the result

    ![cypress first execution](img/cypress-first-execution.png)


# Exercises

## Exercise 1: Go to home page and check title

1. Open app

    ``$ npm run start:dev``

1. Edit the test 'home.spec.js' and change it to:

    ```
    describe('Go home page', function() {
      it('Visits home page', function() {
        cy.visit('http://localhost:3000')
      })
    })
    ```

    As you write or change file look at window of cypress (dynamically it changes and re-execute the tests!).

    You'll see how we reach the home page:

   ![cypress-example-home-1](img/cypress-example-home-1.png)

1. Now we're going to check **Hello ContentFul** text is shown in page

    ```
    describe('Home page test', function() {
        it('finds title', function() {
          cy.visit('http://localhost:3000')
          cy.contains('Hello Contentful')
        })
    })
    ```


## Exercise 2: Go to home page and then click on courses tab

Sometimes you need to access the DOM of web page, and it's not easy (except with Cypress!).

1. Click on open selector button (at left of url location)
1. Click on COURSES tab
   
   You'll see a complete path to get to the element using Cypress
   
    ![cypress-open-selector-select-element](img/cypress-open-selector-select-element.png)

1. Press button of copy to clipboard and paste at the end of test
1. Add click action:
   
   ```
    describe('Home page test', function() {
            it('finds title', function() {
              cy.visit('http://localhost:3000')
              cy.contains('Hello Contentful')
              cy.get('.header__navigation > ul > :nth-child(2) > a').click()
            })
    })
   ```
   
   ![cypress-open-selector-select-element-click](img/cypress-open-selector-select-element-click.png)


## Exercise 3: Add an assertion to verify we've two courses available

```
describe('Home page test', function() {
        it('finds title', function() {
          cy.visit('http://localhost:3000')
          cy.contains('Hello Contentful')
          cy.get('.header__navigation > ul > :nth-child(2) > a').click()
          cy.get('.courses > h1').should('have.text', 'All courses (2)')
        })
})
```

Or better if we can count how many cards are:

```
describe('Home page test', function() {
        it('finds title', function() {
          cy.visit('http://localhost:3000')
          cy.contains('Hello Contentful')
          cy.get('.header__navigation > ul > :nth-child(2) > a').click()
          cy.get('.course-card').its('length').should('eq', 2)
        })
})
```

 ![cypress-example-courses-length](img/cypress-example-courses-length.png)

