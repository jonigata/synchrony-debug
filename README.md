synchrony-debug
===============

Test project for replaying an unexpected behavior on sinatra-synchrony/active-record 

run
===

```sh
  % git clone git@github.com:jonigata/synchrony-debug.git
  % cd synchrony-debug
  % bundle install --path gems
  % bundle exec rackup
```

from other terminal:

```sh
  % weighttp -n 100 -c 64 http://localhost:9292/
```

This stress test sometimes causes errors such as 'undefined method "ClosedTransaction#rollback"'. These erros are caused by the Fiber unawareness of DatabaseStatements. 
