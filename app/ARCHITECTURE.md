# Application Architecture

This is a description of the architecture used in the app.

**NOTE: Even though this app is very simple in nature I still implemented this architecture to demonstrate its use and how it can scale when used for larger projects.**

## Layered Architecture

The application follows a simple layered architecture modeled after elements of the CLEAN architecture combined with the BLoC and Provider architecture.

The architecture is made up of 3 primary layers arranged in an onion skin.

![alt text][logo]

**NOTE: The names of our onion skin layers may not reflect image.**

***In this app the UseCases/Interactors are called BLoCs (Business Logic Components)***

These layers follow strict dependency rules.
- Dependency always goes from outer layer to inner layer.
- Inner layers are not allowed to depend on outer layers.


### App (Presentation)

This is the application itself and the user interface.

This is where we create the pages of widgets, get input from the user and display output to the user.

It also handles navigation from one area of the app to another.

#### Providers

Within the app we use the Provider library to enable access to BLoCs by our Flutter widget tree.

Rather than passing state down the tree to the various widgets, the widgets call up the tree to access state via a Provider.

```
  @override
  Widget build(BuildContext context) {
    // This calls up the context tree to find the nearest provider of <StateType>
    final state = Provider.of<StateType>(context);
    return <our widget tree which references state>;
  }

```

***There is no business logic in this layer!***

***This layer is written in Flutter using Dart.***


### Data
The data layer provides access to all the data by implementing the abstractions defined in the domain layer.

This includes data repository, persistence, networking, json serialization and caching.

***This layer is written in Dart and should not have any dependency on Flutter.***


### Domain
This is where the business logic lives as well as a set of abstractions that are implemented by the data layer.

#### Abstractions
Since lower layers are not permitted to have dependencies on higher layers, this layer defines a set of abstractions that are then implemented by higher layers. This allows code in this layer to call up into higher layers without having explicit dependencies on those layers.

#### BLoCs
A BLoC is a class that contains all the business logic for a functional area of the app. A BLoC is similar to a ViewModel or a Manager in other architectures.

A BLoC has simple well defined inputs and outputs.

The App layer takes input from the UI and passes it to a BLoC which processes that data and returns results ready for consumption by the UI.

BLoCs are very reactive in nature using observables to communicate state changes up to higher layers.

#### Models
This layer also contains the model objects used to interact with data access abstractions defined in this layer.

***This layer is written in Dart and should not have any dependency on Flutter.***


### Core

The core layer provides common support code used by all outer layers.

***This layer is written in Dart and should not have any dependency on Flutter.***


[logo]: layers.png
