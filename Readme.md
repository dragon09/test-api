# accounts

https://vida-api.herokuapp.com/api/accounts

```
curl localhost:9292/api/accounts
curl -X POST localhost:9292/api/accounts -d 'name=v1&email=som@email.com&password=12345'
```

# session

https://vida-api.herokuapp.com/api/sessions

```
curl -X POST localhost:9292/api/sessions -d 'email=som@email.com&password=12345'
```

# posts

https://vida-api.herokuapp.com/api/posts

```
curl localhost:9292/api/posts
curl localhost:9292/api/posts/1
curl localhost:9292/api/posts/1/comments
curl -X POST localhost:9292/api/posts -d 'api_key=wkrtglgpqdjdplwmgjpkufriwfxfqv&title=Something&content=Something&tags=Something'
curl -X PATCH localhost:9292/api/posts/1 -d 'api_key=wkrtglgpqdjdplwmgjpkufriwfxfqv&title=Something%20else'
curl -X DELETE localhost:9292/api/posts/1 -d 'api_key=wkrtglgpqdjdplwmgjpkufriwfxfqv'
```

# comments

https://vida-api.herokuapp.com/api/comments

```
curl -X POST localhost:9292/api/comments -d 'api_key=wkrtglgpqdjdplwmgjpkufriwfxfqv&content=Something&post_id=2'
curl -X PATCH localhost:9292/api/comments/1 -d 'api_key=wkrtglgpqdjdplwmgjpkufriwfxfqv&content=Something%20else&post_id=2'
curl -X DELETE localhost:9292/api/comments/1 -d 'api_key=wkrtglgpqdjdplwmgjpkufriwfxfqv'
```
