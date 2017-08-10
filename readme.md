# Why this project

This is the code for an interview coding test I made for an iOS development position.
This project contains a universal iOS app with an accompanying watch app.

# The problem

Given some data with a format similar to [response.json](/JJLAccountTests/assets/response.json), you need to create:
- an app that shows a list of accounts
- 2 different lists need to be displayed, the complete account list and other with only the visible accounts.
- You want to show the data in a watch app or widget

# Time taken

1/2 hour transforming the data to a json valid format
1 hour parsing the data, making the only unit test of the app
1 & 1/2 hours making the iPhone app
1 hour making the watch app
1 hour adding the viewmodel, the viewmodel mapper & the view protocol & refactoring the presenter to use the viewmodel
Total time: 5 hours

# Architecture

I tried to use clean architecture.

The data source class acts as the Interactor & the Repository, returning the data asked.
The presenter class calls the interactor, and transform the data for presenting, returning viewmodels to the view.
The view class calls the presenter with actions the user wants to perform, and renders the viewmodel returned from the presenter.

The iPhone & the watch app share the presenter & the datasource. The only thing changing between them are the views.

# Dependencies

The only dependency used is ObjectMapper. Cocoapods is the dependencymanager chosen.

# License

MIT License

Copyright 2017 Jose Jimeno Linares

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.