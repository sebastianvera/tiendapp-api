Tiendapp
========

Getting Started
---------------

This repository comes equipped with a self-setup script:

    % ./bin/setup

After setting up, you can run the application using [foreman]:

    % foreman start

The app will be running at `http://localhost:7000`.

## Available routes

- GET `/api/articles`, it return the articles.
- POST `/api/articles`, it creates an article.
- PUT `/api/articles/:id`, it updates an article. 
- GET `/api/articles/:article_id/economic`, it returns the economic provider for that article.
- GET `/api/inventory`, it returns the inventory (shop's articles relation).
- GET `/api/providers`, it returns the providers.
- GET `/api/providers/:provider_id/items`, it returns the provider's items.

The production url of this application is: `http://as-tiendapp.herokuapp.com`

### Example Live URL

- http://as-tiendapp.herokuapp.com/api/providers/1/items

[foreman]: http://ddollar.github.io/foreman/

----------

Guidelines
----------

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
