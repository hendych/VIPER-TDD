# Introduction
Welcome to memory leak free VIPER pattern with TDD. VIPER is based on uncle bob's clean architecture. Details of VIPER can be seen on this [link](https://www.objc.io/issues/13-architecture/viper/).

# Memory Leak Free VIPER
VIPER is used with so many separation layer so it makes easier to test using TDD, because the more separation and single responsibility the easier TDD is done. Because VIPER use so many classes, memory leak may occur if you don't bind the classes correctly (as retain cycle often occur). It's also because iOS Framework keep its objects as strong on the View Controller. This code ensure you can have memory leak free VIPER because it's presenter is kept on View Controller. You can test and log the `deinit` for every each class.

# TDD
TDD, in short `a development environment where you write test cases first of your code first, not implementation`. You can find more [here](https://www.tutorialspoint.com/software_testing_dictionary/test_driven_development.htm). 

In this part of example, you can learn how TDD itself is written on VIPER.

# Folder Structure
The main source folder is located at `Classes/` with structure below:
- `Component/` – contains partial view that can be reused on another screen. 
- `View/` – contains main UI (UIViewController, XIB) and related protocols for the related view.
- `Interactor/` – contains all business logic, API and local data managements.
- `Presenter/` – contains presenter of each related view that manages events that translates into routing, inputs or outputs.
- `Entity/` – contains entities that exist in the app.
- `Router/` – contains all router that manage dependency injection, navigations and VIPER creation.

# Environment
This code is built on `Xcode 10` with minimum iOS Requirement is `10.0`, and written in `Swift 4`

# Build and Test
To build this app, you can directly run script `runme.sh`. It will open simulator iOS and try to run iPhone 6 installed on your computer.

# Author
Created by [Hendy Christianto](https://www.linkedin.com/in/hendy-christianto-1a47729a/). Contact me at hendychrst90@gmail.com
