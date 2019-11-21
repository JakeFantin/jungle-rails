# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* pg
* sass-rails
* uglifier
* jquery rails
* turbolinks
* jbuilder
* sdoc
* bcrypt
* puma
* bootstrap-sass
* font-awesome-rails
* money-rails
* carrierwave
* rmagick
* faker

## Screenshots
The home page displays all the products.
![Home page, user logged in.](https://github.com/JakeFantin/jungle-rails/blob/master/docs/home-loggedin.png?raw=true)

You can click on a product to see it details with a larger image.
![Product details page.](https://github.com/JakeFantin/jungle-rails/blob/master/docs/productdetails.png?raw=true)

The cart page.
![Cart page.](https://github.com/JakeFantin/jungle-rails/blob/master/docs/cart.png?raw=true)

The signup page, which is very similar in construction to the login page.
![Signup Page](https://github.com/JakeFantin/jungle-rails/blob/master/docs/signup.png?raw=true)

Admin priviledges (which require a particular username and password) allow viewing of all the categories and products on the site, as well as the option to add new objects to both database tables, and the option to remove products.
![Admin capability to view products, add and remove products.](https://github.com/JakeFantin/jungle-rails/blob/master/docs/adminproducts.png?raw=true)

