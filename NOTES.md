
# Building Authorization

## Goals

- Build authorization helpers for controllers
- Build logic of authorization in models
- Test the logic in realtime

## Domain Model

An User has many shared_posts
An User has many posts through shared_posts

A post has many shared_posts
A post has many users through shared_posts

### Authorization Rules for shared post

1. An user can manage their posts.
2. Guest users can read posts.
3. Collaborators can edit post.


## TODO

- [x] Setup Authentication using Devise.
- [x] Setup post model
- [x] Setup shared_posts model
- [x] Implement Authorization by writing code that you wish you had
- [x] Using Metaprogramming for making models DRY.
- [x] Make controller helpers DRY.
- [x] Create new post with owner permission.
- [ ] Allow owners to manage permissions for posts through web.
- [ ] Push to Github
