# Get a Quote

Get a Quote is a very simple mobile app that generates random inspirational quotes based on categories entered by the user.

Get a Quote is far from complete though. Your task is to work on the tasks below.

# Technologies

Get a Quote uses [Flutter](https://flutter.dev/) which is a cross-platform UI toolkit.

The project is also using the [quotable.io](https://quotable.io) API to generate its quotes. Here is an example request: https://api.quotable.io/random?tags=history  

# Instructions

1. Clone this repo and create a new private repository under your account that will contain the updates. Share that repository with me so I can view it.
2. Take a look at the design mockup: https://xd.adobe.com/view/8670666e-a1cd-465b-a35a-b27352a0502f-d323/
2. Get the app compiled and loaded up in an emulator or on a device. In its current state, you should be able to add a category and continually generate new quotes.
3. Complete the tasks in any order that you see fit.
4. When you finish a task, create a pull request that briefly describes the change.

I don't expect every task to be completed in the time allotted. Play to your strengths and complete the tasks that do the best job of showcasing those strengths.

# Tasks

- Replace the hard-coded categories that are getting passed to the API with the categories that the user enters.   
- Replace the blue color within the app with the correct one in the mockup
- Categories should display as a row instead of a column when entered.
- Make the quote container look more like the mockup
- Don't allow duplicate categories to be entered
- The overall architecture of the app leaves a lot to be desired. How could it be rearchitected so that the codebase will scale as we add more features?
