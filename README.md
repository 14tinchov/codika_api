API Codika
==============================================

Example API with login and posts endpoint

Required environment / minimum configuration
----------------------------------------------

- Ruby version: `2.4.0`
- Rails version: `5.0.1`

Manage ruby version with `rvm`.

Settings
----------------------------------------------

- `bundle install`
- `rails db:setup`

Basic use
----------------------------------------------

You can use Postman or CURL. Example with CURL:

0. `rails server`
1. Get tokens to use api
```
curl -X POST \
  -i http://localhost:3000/api/v1/auth/sign_in \
  -H 'cache-control: no-cache' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -F email=user@example.com \
  -F password=asdqwe123
```

2. Copy Access-Token, Client and Uid from headers

3. Get posts with tokens
```
curl -X GET \
  http://localhost:3000/api/v1/posts \
  -H 'access-token: _7oM5wRtKp55he-vLWej0w' \
  -H 'cache-control: no-cache' \
  -H 'client: {client}' \
  -H 'postman-token: {token}' \
  -H 'uid: {uid}'
```

Look at the Specs if you have any questions !

Martin Villalba 14tinchov@gmail.com
