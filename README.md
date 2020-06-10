# Issue with Cypress running with Linux container

## Context

After a cy.visit(), we call an internal API URL.

### In a Windows context

The headed and headless modes are working as expected with Cypress.

### In a Linux context

There is something wrong when we tried to reach one of our internal API route.
In our Dockerfile, we added a check if our certificate is correctly installed in our Dockerfile with a `curl -L`.

Once we dockerized in the official image `cypress/browsers:chrome69`, these calls are automatically and instantly `aborted`.

Here's what we tried so far but **did not work** in our Docker Linux context:

* We tried different AJAX approach : `Axios`, `Fetch` and basic `XMLHttpRequest`.
* We tried Cypress `3.8.5`, `4.5.0`, `4.7.0`.
* We removed our extra layer with `cucumber` and `webpack`.

It works once we changed our internal URL to point to a public endpoint.

We guessed so far that OS root certificate is not handled properly by Cypress when ran against internal corporate routes in Linux context.
