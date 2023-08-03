# README
Using Spotify’s API Track `valence` scores to track your mood through music :)

This is a fairly standard Rails app, pointing to Rails master to get the latest 7.1 goodies.
I'm using [Phlex](https://github.com/phlex-ruby/phlex) for OOP views, [RSpotify](https://github.com/guilhermesad/rspotify) for an API wrapper,
and [P5.js](https://p5js.org) for the Unknown Pleasures viz.

| Dependency | Version |
| --- | --- |
| Ruby | 3.2 |
| Postgres | 14 |

## Local Development
* Setup: `bin/setup`
* Dev server: `bin/dev`

* Running tests: `bin/rails test`

* Services (job queues, cache servers, search engines, etc.)
TODO: move to GoodJob

* Deployment instructions
TODO: `fly deploy`
