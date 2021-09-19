
# QR generator and reader
Mobile Flutter project challenge submission for Superformula by Daniel Murcia

## Build Instructions

1. [Install Flutter](https://flutter.dev/docs/get-started/install) on your local machine
2. Run `flutter doctor`  in your CLI to make sure you have all the necessary dependencies.
3. Clone the repo and open the project in your preferred IDE (Android Studio / VS Code)
4. To make sure you get all generated files, run
```
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner build --delete-conflicting-outputs
```
5. Run the app with the `flutter run` command

## Tests

Run all unit and widget tests available with the `flutter test` command

## Design pattern and project structure
Implemented a Domain-Driven Design (DDD) where the project is separated in three main architectural layers: Presentation, Domain and Data. With these we can make our code more testable, scalable and maintainable by setting all of the core logic (in this particular case, that would be our cubit state management) in the domain layer, and build both UI and data layers around it.

The **Presentation layer** holds all of the screens(widgets), that will call their respective cubits for their state management, when needed.
The **Domain layer** contains the models used around the app, all cubits for each feature that holds any state logic, and the interface of any repository, which will be implemented in the data layer.
In the **Data layer** is stored all of the implementation of repositories declared in the domain layer (only one for our project), and the API classes that communicate with remote sources.

## Folder structure
```
...
|-- qr_generator 
    |-- pubspec.yaml   
    |-- lib   
    |   |-- data  
    |   |   |-- api  
    |   |   |-- feature  
    |   |       |-- repository  
    |   |-- domain  
    |   |   |-- model  
    |   |   |-- feature 
    |   |   |   |-- cubit  
    |   |   |   |-- repository    
    |   |-- presentation  
    |   |   |-- feature
    |   |-- router  // Router definition with auto_route library
    |-- test  // Unit and Widget testing
        |-- data  
        |   |-- feature
        |   |   |-- mocks // Contains a mocker class that generates mockito 
						  // generated files, separated from test files.
        |-- domain  
        |   |-- feature 
        |   |   |-- cubit  // Unit testing through the bloc_test library
        |   |   |-- mocks  
        |-- presentation 
        |   |-- common  // Reusable code for all presentation tests 
        |   |-- feature
        |   |   |-- mocks  
```

