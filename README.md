## The requirements: 
* The user should be able to see a list of shows the API provides using a pagination mechanism
* The user should be able to search for a particular show
* The user should be able to check the show details
* On the show details, the user should be able to see a list of episodes split by seasons
* The user should be able to check the episode details
* The user should be able to search for a particular person
* The user should be able to check the person's details
* On the person's details, the user should be able to see a list of shows the person participated
* From the person's details list of shows, the user should be able to check the show details and episode details
* The user should be able to favorite a show (store the data in a Core Data database)
* The user should be able to secure the app from unauthorized people using Biometrics or a custom PIN

## The Maze TV API in details

I took a closer look on the API details to make sure the user will have a good **user experience** using the app, 
with good **usability**, **performance** and care with **privacy**.

The TV Maze API is free, without a authentication mechanism but it has a rate limit. 
This means that, if we **exceed a number of requests** the next ones should start to **fail**. 
This important, considering we can display a lot of information if the user **scrolls fast** and try to get more and more information.
Also, although the data is live in the cloud and can change at any moment, it **doesn't mean we need to download** the same data over and over again.
And finally and un-related with the Maze API. Some user information like the PIN needs to be stored with care, as it's sensible data.

So a good strategy for the development needs to consider:
* Downloads info **only when necessary**
* **Cache info** to avoid unnecessary network usage (images for instance)
* Have a well defined network layer, that can deal with the **rate limit errors** and **retry a few times**, when a request fails
* Store sensitive data using Keychain

## Architecture decisions

The architecture decisions I made, created a good separation of concerns, allowing the app to have a good testability and reusability. 
Also it provides a simple common API to deal with async operations for network or database.

For the views, I used a MVVM approach removing many responsibilities from the view controller and allowing me to better unit test my business logics.
To separate concerns, I splitted my app into different frameworks: **Core**, **Auth**, **Cloud**, **Database**, **Secure** and **Features**.

## Listing informations to the user

Whenever I needed to display a list of informations to the user (shows, people, episodes, for instance), 
I make sure to don't wait until all information are available in memory. 

This is important to create a more **fluid user interface**. So whenever the Maze API returns the data I immediately
display to the user the text and start to load the images separatedly. Because of this decision the data always appears as fast as possible to the user.

## Missing requirements

The original requirement mentioned the following:

* Xcode 8.2+
* Swift 3
* iOS 9.0+

They seem a really outdated setup, unfortunately my O.S. is on macOS Catalina and it doesn't support Xcode 8.2. 
I was also unable to use Swift 3, because it's too old for my machine. Because of that, I skipped both requirements.

I am using Xcode 11.3.1 with Swift 5. Still I was able to support iOS 9 and this choice won't impact anything to the end user.


