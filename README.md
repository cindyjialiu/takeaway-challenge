Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

# Instructions of use
```ruby
[2] pry(main)> order = Order.new
=> #<Order:0x00007f8d82bd7790 @basket={}>
[3] pry(main)> menu = Menu.new
=> #<Menu:0x00007f8d82babb90
 @dishes=
  {1=>["prawn crackers", 199],
   2=>["mini spring rolls", 349],
   3=>["vegetable dumplings", 599],
   4=>["chicken pad thai", 649]}>
[4] pry(main)> puts menu.read_menu
1. prawn crackers £1.99
2. mini spring rolls £3.49
3. vegetable dumplings £5.99
4. chicken pad thai £6.49
=> nil
[5] pry(main)> basket = order.add_dish(1,2)
=> {"prawn crackers"=>[199, 2]}
[6] pry(main)> basket = order.add_dish(3,2)
=> {"prawn crackers"=>[199, 2], "vegetable dumplings"=>[599, 2]}
[7] pry(main)> summary = order.basket_summary(basket)
=> {"prawn crackers"=>398, "vegetable dumplings"=>1198}
[8] pry(main)> total = order.total_cost(summary)
=> 1596
[9] pry(main)> order.place_order(1596,summary)
=> "Thank you! Your order was placed and will be delivered before 02:00"
[10] pry(main)> order.send_confirmation
```
## Menu
  * All the prices marked as pennies, use Menu.new to create a menu with dish numbers, dish names and prices in it.
  * Use puts menu.read_menu to see the menu, the prices will be showed as £ prices.

## Order
  * Use Order.new to create a new order with an empty basket in it.
  * Use order.add_dish(number of the dish, quantity you would like to order) to add dishes.
    If no quantity passes in, it will use the default value 1 instead.
  * Save all the dishes added in basket and pass it in basket_summary will get the detailed
    basket_summary of the current basket

## SMS
  * Use Twilio API to send text messages
  * account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = ENV['TWILIO_PHONE']
    to = ENV['TWILIO_DESTINATION_PHONE']

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
