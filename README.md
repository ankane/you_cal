# YouCal

A calendar designed just for you.

Dates are your age in the format `years-days`.

`26-104` is the 104th day of being 26 years old.

The calendar starts with `00-001` - the day you were born.

```ruby
birthday = "1988-02-28"
you_cal = YouCal.new(birthday)
you_cal.date(Date.today) # "26-104"
you_cal.dates # all dates up to today
```

Try it from the shell.

```ruby
ruby you_cal.rb 1988-02-28
```

Prints:

```sh
1988-02-28 : 00-001
1988-02-29 : 00-002
1988-03-01 : 00-003
...
2014-06-09 : 26-102
2014-06-10 : 26-103
2014-06-11 : 26-104
```
