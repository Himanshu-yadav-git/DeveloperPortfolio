# API Interaction Summary

## 1. What is a REST API?

A REST API is a way for different software applications
to communicate with each other over HTTP.

It allows clients to request data from servers and receive
responses in formats such as JSON.

## 2. HTTP Status Codes

### 200 OK

The HTTP 200 status code means that the request was
successfully processed by the server.

### 404 Not Found

The HTTP 404 status code means that the requested
resource could not be found on the server.

## 3. jq Filter Used

Command:

cat API/github_profile.json | jq
'{name:.name, repos:.public_repos,
followers:.followers, joined:.created_at}'

Explanation:

- .name extracts the user's GitHub name.
- .public_repos extracts the number of public repositories.
- .followers extracts the number of followers.
- .created_at extracts the account creation date.

The jq utility processes JSON data and allows us
to extract specific fields.

## 4. APIs Used

### GitHub REST API

https://api.github.com/users/Himanshu-yadav-git

Used to retrieve public GitHub profile information.

### JSONPlaceholder API

https://jsonplaceholder.typicode.com/posts

Used to retrieve sample JSON posts.

Total posts retrieved: 100.
