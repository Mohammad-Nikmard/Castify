# Castify

![mockup](assets/mockup.png)

## Overview 
This is an small ui for a podcast application called `Castify`. Users can see different types of playlists and categories. The local database of this app has been handled with MVVM architecture for the separation of layers and to keep eveything clean and also provider is used for the state management respectively. 

## Features 
 - **Main Activity** : Showcases an small UI desgin of a podcast application.
 - **Podcast Detail** : Each podcast has a unique title, Subtitle, Publisher and a category.

## Project Structure 
Porject uses MVVM architecture as an example and also a path to keep the project clean when working with local database : 
 - Model : There are 4 types of models in the application in its core functionality (just like entity layer)
 - Service : Works as a datasource to keep all the local lists of model.
 - Viewmodel : a bridge between service and view (just like adapters)
 - View : User inteface of the application which happens to be aware of all the layers(just like infrastructure)

## Dapandancies 
  - smooth_page_indicator
  - provider
  - get_it
  - carousel_slider
  - dots_indicator
  - persian_tools

## Project Setup
To run the application do the following :

 1. Clone the repository or download it.
 2. Open the project in Android Studio / VScode.
 3. Build and run the app on an Android emulator or physical device by your choice.
