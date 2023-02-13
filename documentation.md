# Documentation
Below you can find all the information about the application. In this challenge I tried to create some complex features just to show my experience and the things I can do, such as using Slivers, Animations and Canvas.
Also, for a simple app like that I probably would prefer just using a MVC or MVVM architecture, but to show my experience I used Clean Architecture.

## Features I built
- Home Page
- QR Code page
- QR Code Scanner Page
- Auto refresh Strategy

## Clean Architecture
- Some concepts of the Clean Architecture pattern defined by the Uncle boob in his book were used in this project.
    - Splitting the application in three layers:
        - data: In this layer we have the data sources and repositories. Api calls, local storage access, phone features (câmera, location, etc) are at this layer.
        - domain: In this layer we must have all the business logic for the application. The entities that representes our business and also the use cases. This layer does not know about the data and view layer, it's an isolated layer.
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
- I used the package BlOC to handle the state in the application. BlOC use Streams in it's API and it's a great solution to handle state.
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
For this simple apple I used the Navigator system using named routes.

## Best practices
There are a lot of best practices to follow when developing a mobile application. In this challenge I tried to follow some practices:
- Naming classess, functions, variables, folder and files with clarity and objectivity.
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
- I wrote BlOC tests. Only for the QrCodeHistoryBloc and QrCodeSeedBloc to demonstrate how bloc tests works.
- I wrote integration tests only for the HomePage to demonstrate how we can do integrations tests in Flutter.

- To run the unit and widgets tests, run `flutter test test/`
- To run the integration tests, run `flutter test integration_test/`

## External packages
- dio: Network API calls.
- get_it: Dependency injection
- bloc & flutter_bloc: State Management
- mobile_scanner & qr_flutter: QR Code page and scanner
- equatable & mockatail: Useful for testing

## Some Flutter's complex features I could use:
- Isolates
- Platform Channels
- Flavors

I didn't find any specific case to use the features above in this challenge.