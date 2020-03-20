# Flatiron-bnb: Associations

## Message to dc-web-030920

Hey all, since we're doing this lab remote, have 1 person in your group (someone with reliable internet) fork and clone this repo down. That person should open up the lab in VS Code and then start a Live Sharing with the rest of the group. **Be sure to push up to github frequently** so everyone has the latest version in case interet goes down

When everyone is good and set up, in your **shared terminal**, run `learn --f-f` to see tests all fail. If that doesn't work, run `rspec --f-f`. Take a good hard look at the tests and read the instructions below to figure out what your domain is. We'll give you a hint, you'll be making 6 files for starters.

You must create files `city.rb` `listing.rb` `user.rb` `neighborhood.rb` `review.rb` `reservation.rb` in the `app/models`  folder. This is where you'll be writing your ruby classes.

How these models are all related is up to you all to figure out. Maybe have someone in the group start a shared whiteboard through zoom in your breakout rooms. *Only after you've drawn out all of your models and relationships can you start coding.*

Take it slow and work together. Follow the model specs. It's possible to complete this lab with no methods in models and to only use Active Record macros ( has_many: and belongs_to: )

## Where to Begin

Work through this lab slowly. For every class you create, you should create a migration file to make a table for that class. Run rake `db:migrate RAILS_ENV=test` to migrate your DB to get the tests to work, and if you make mistakes, run rake `db:migrate:reset RAILS_ENV=test` to start over. You can always open `test.sqlite3`  in DB Browser to look at your test database.

In addition, think about the relations between all of the objects. Let's work through
Users and Listings, and from there you should know some cool ActiveRecord tricks
to get started on the rest.

We have a `user` object but a listing belongs to a specific type of user: a
host. And the reservation (aka a trip) and a review both belong to a specific
type of user: a guest. But we don't want to make two tables for a host and a
guest. One way to do this is to create an association where, for example, a
listing belongs to a host:

```ruby
belongs_to :host
```

Active Record's `belongs_to` method is going to look for a table named "host",
but that doesn't exist. Instead, we need to tell ActiveRecord which table host
is referring to:

```ruby
belongs_to :host, :class_name => "User"
```

The listings table is instead going to have a column for the foreign key called
`host_id`.

Then on the User class, when we're creating a relationship with listings, where
a user `has_many` listings, we need to specify which foreign key to look for on
the listings table, otherwise, ActiveRecord is going to default to looking for a
`user_id` when we named it `host_id`:

```ruby
has_many :listings, :foreign_key => 'host_id'
```

**BEFORE THE END OF THE DAY, PUSH UP THE LATEST CODE TO GITHUB so that everyone in the group has access to the latest code.**

## Resources

[Foreign key and Class Name AR class methods](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html)

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/flatiron-bnb-associations' title='Flatiron-bnb: Associations'>Flatiron-bnb: Associations</a> on Learn.co and start learning to code for free.</p>
