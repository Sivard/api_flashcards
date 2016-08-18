## ApiFlashcards

[![Build Status](https://travis-ci.org/elavretskiy/flashcards.svg?branch=seventh-task)](https://travis-ci.org/elavretskiy/flashcards)
[![Code Climate](https://codeclimate.com/repos/551d5933695680514c00019c/badges/20539730e3e119e4d337/gpa.svg)](https://codeclimate.com/repos/551d5933695680514c00019c/feed)

# Add gem

If you want using this gem, you need add 

 `gem 'api_flashcards' , git: 'git://github.com/Sivard/api_flashcards.git'`

# Mounting

Mount engine to app

`mount ApiFlashcards::Engine, at: "/api_flashcards"`

to `config/routes.rb`

# Test

if you want test this engine, rename card.test.rb and user.test.rb to card.rb and user.rb

This project rocks and uses MIT-LICENSE.
