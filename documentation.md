# Documentation
Below you can find all the information about the application.

## Compiling
- This app was built with the Flutter version 3.7.3.
- To run the application, execute `flutter pub get && flutter run`
- To run the application in release mode, execute `flutter pub get && flutter run --release`
- To build the application in release mode, execute `flutter build apk --release`
- You can find the APK link at: https://drive.google.com/file/d/1kY4IjPXy5y1cydSPypen6V-2DsLAT5Lr/view?usp=share_link

## Features I built
- Home Page
- QR Code page
- QR Code Scanner Page
- Auto refresh Strategy

# API
- I built a simple API using NestJS to handle the `/seed` endpoint. This API can be found in: https://github.com/HudsonJunior/superformula_test_server
- I deployed this API using Heroku. The domain is : https://superformulaserver.herokuapp.com/seed

## Clean Architecture
- Some concepts of Clean Architecture were used in this project.
    - Splitting the application in three layers:
        - data: In this layer we have the data sources and repositories. Api calls, local storage access, phone features (câmera, location, etc) are at this layer.
        - domain: In this layer we must have all the business logic for the application. The entities that represents our business and also the use cases. This layer does not know about the data and view layer, it's an isolated layer.
        - view: The interface layer. Here we have everything that is related to an user interface. The pages, widgets and the state management as well.
    - Using some of the S.O.L.I.D principles.
        - Single Responsability: I followed this principle to keep all my class and functions with just one responsability. This helps to split the concern and improve the readability of the project.
        - Interface Segregation: A great principle that tells us to separate all interfaces that are not related. This way you create specific class for each case you need.
        - Dependency Inversion: You should depend on abstractions and not implementations.
    
## Design Patterns
I used some common design patterns to build this application:
- Dependency Injection
- Singleton
- State

## State Management
- I used the package BLoC to handle the state in the application. BLoC use Streams in it's API and it's a great solution to handle state.
- In some small cases I used the setState with StatefulWidget to handle the state.
- In some small cases I used ValueNotifier with ValueListenableBuilder to handle the state.

## Animations
I tried to create some simple animations in the application to improve the UI. In Flutter we have two types of animations: Implicit and Explicit.
- Implicit Animations I used: AnimatedScale, AnimatedSlide, AnimatedRotation.
- Explicit Animations I used: AnimatedBuilder with Tween.

## Canvas
I drew the QR Code scanner overlay with Canvas.

## Theming
Flutter allows you to create a theme for you app easily. In this challege, I tried to follow some patterns to create the theme of the application.

## Navigation
Flutter provides to us two types of navigation: Navigator (Imperative) or Router (Declarative).
For this simple app I used the Navigator system using named routes.

## Best practices
There are a lot of best practices to follow when developing a mobile application. In this challenge I tried to follow some practices:
- Naming classes, functions, variables, folders and files with clarity and objectivity.
- Creating small functions with just one responsability.
- Following the DRY (Don't repeat yourself) principle.
- Following the KISS (Keep It Simple) principle.
- Keeping function parameter count to a minimum.

## Slivers
I created the QR Code page with CustomScrollView taking advantage of all the power of Slivers.
In normal cases I wouldn't use Slivers for simple cases like that, probably I'd prefer just a ListView. For this challenge I used Slivers just to show how we can build fancy scrolling with them.

## Performance
The application showed a good performance. I tried to follow some of the best practices to build performatic Flutter apps:
- Splitting pages into small widgets to avoid re-rendering.
- Using RepaintBoundary to avoid Skia re-painting places where is not needeed.
- Using Slivers than common scroll views.
- The normal Flutter app already has a good performance. Thit is because the way the framework works in the deep. Combining the power of the Skia engine that Flutter use to write to the GPU and also how the three trees in Flutter are working together (Widget, Element and RenderObject), the framework itself knows how to re-use elements to improve the performance.

## Tests
- I wrote unit tests for the data and domain layer.
- I wrote widget tests for the view layer, only for the HomePage to demonstrate how widget tests works.
- I wrote BLoC tests. Only for the QRCodeHistoryBloc and QRCodeBloc to demonstrate how bloc tests works.
- I wrote integration tests only for the HomePage to demonstrate how we can do integrations tests in Flutter.
- I did 16 tests in total. There are a few more cases that are good to test, but due to my side work and responsability, for this challenge I focused only in the important tests.
- To run the unit and widgets tests, run `flutter test test/`
- To run the integration tests, run `flutter test integration_test/`

## External packages
- dio: Network API calls.
- get_it: Dependency injection
- bloc & flutter_bloc: State Management
- bloc_test: useful package that helps to test bloc instances
- equatable: useful to compare classes
- mobile_scanner & qr_flutter: QR Code page and scanner
- equatable & mockatail: Useful for testing
