[![Stories in Ready](https://badge.waffle.io/PopulateTools/reasons.club.png?label=ready&title=Ready)](https://waffle.io/PopulateTools/reasons.club)
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/PopulateTools/reasons.club?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Code Climate](https://codeclimate.com/github/PopulateTools/reasons.club/badges/gpa.svg)](https://codeclimate.com/github/PopulateTools/reasons.club)
[![CircleCI](https://circleci.com/gh/PopulateTools/reasons.club/tree/master.svg?style=svg)](https://circleci.com/gh/PopulateTools/reasons.club/tree/master)

# reasons.club

Reasons.club is an online tool to discuss with order, reach conclusions faster, and take decisions. Take a look at the live version at [reasons.club](reasons.club), and start reasoning.

### For yourself

* Take quick notes about the issues you have to decide and get your ideas organized
* Create drafts of pros and cons about the decisions you have to take
* List reasons affecting the issues you have to work on
 
### For small teams

* Use Reasons.club with your partner, friends, coworkers, associates...
* Collaboratively create lists of pros and cons about the issues you have to decide on
* Have structured and organized debates about your decisions - avoid chaotic email discussions without end nor results
 
### For public discussions

* Hold public discussions with big groups while maintaining order
* Let people add their reasons to a debate, or only vote for existing reasons
* Gather feedback from many people about complex issues with order and structure

## About 

Why do we hold the views we hold? Are we critic enough with the opinions we have? How do we get to form our opinions? Reasons.club aims to be a place that helps people to be more conscious about why they think what they think, and to help anyone better understand issues by outlining pros and cons and documenting them with external references to have informed opinions about those issues. 

A project started by Álvaro Ortiz ([@furilo](twitter.com/furilo))

Contributors:

* Alberto Calderón ([@bertocq](twitter.com/bertocq))

More: https://github.com/furilo/reasons.club/graphs/contributors

## Set up your own reasons.club

ToDo

## General roadmap

* Let people gather together to outline reasons about isssues (public and group discussions)
* Let individuals create private clubs to organize their knowledge and help them decide things with order
* Create public profiles about what people think and why, and to have arguments (pros and cons) around issues in the public sphere

## Specific roadmap

See the [wiki](https://github.com/furilo/reasons.club/wiki)

## Feature requests

You are welcome to request a feature. Discuss them here: http://reasons.club/issues/improve

## How to contribute

We are getting started, and we welcome contributions. You can take any issue marked with [Ready to start](https://github.com/furilo/reasons.club/labels/2%20-%20Ready%20to%20start) and send a PR. 

Soon we'll have an open online space to discuss and hang out. Meanwhile write to discuss@reasons.club and ask that we set up that space so that you don't have to write to a private email address ;) 

### To set up the project

It assumes you have running:

* ruby 2.5.0

```
git clone git@github.com:PopulateTools/reasons.club.git
cd reasons.club
bundle install
cp config/secrets.yml.example config/secrets.yml
cp config/database.yml.example config/database.yml
bin/rails db:setup
```

Then copy & paste the result of 
````
bin/rails secret
```
To lines 14 and 18 of /config/secrets.yml

Then [register a twitter app](https://apps.twitter.com/) using **http://127.0.0.1:3000/auth/twitter/callback** for the Callback URL and complete lines 3 & 4 of /config/secrets.yml
````
twitter_api_key: # Twitter Consumer Key (API Key)  
twitter_api_secret: # Twitter Consumer Secret (API Secret)
```

Finally run the server:
```
rails server
```
Great! Navigate to: http://localhost:3000 and give it a try!!

### To work on a new feature / bug / improvement

* [Fork the project](https://help.github.com/articles/fork-a-repo)
* Clone down your fork
* Create a feature branch for your work (`git checkout -b new-feature`)
* Commit your changes (`git commit -am 'Description of the commits'`)
* Push the branch up to your fork
* Send a [pull request](https://help.github.com/articles/creating-a-pull-request/) for your branch

### Libraries/gems being used

See Gemfile for complete reference

## License 

MIT License: https://tldrlegal.com/license/mit-license
