# Superformula Mobile Test

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-green.svg)](https://conventionalcommits.org) 

[![macaco](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white) [![macaco](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)]() [![macaco](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/felcesar/)

## Getting Started

- Flutter version used in development `2.2.3`
- Used null-safe wherever possible

### Building
Building the project, run the following commands in the root dir
(assuming you have a basic flutter & dart environment):

```bash
$flutter pub get
$flutter pub run build_runner [build/watch]
```
### Running
You must have a valid device/simulator connected to get the device name. (You can also use VSCode Flutter extensions to make running and debugging through the GUI)

```bash
$flutter run -d [device_name]
```

### Run tests
In the root directory run:

```bash
$flutter test
```

## Directory structure

The directory structure was made to reflect the [DDD approach layers](https://resocoder.com/wp-content/uploads/2020/03/DDD-Flutter-Diagram-v3.svg), those being:

- `presentation`: This layer contains all widgets for the app, responsible to display to the user the data coming from the `domain` and orchestrated by the application layer.
- `application`: Orchestrates the communication from the `presentation` layer with the domain. No matter where the data originates, its **first destination** is going to be the application layer. TLDR: The role of the application layer is to decide "what to do next" with the data.
- `domain`: Independent self-contained part of the application, not concerned with any technology used in the remaining of the app. Also responsible for determining how the other parts are structured and how they will interact with each other. Also containing the essential business logic. ( validation, data grouping, uniquely identify data)
- `infrastructure`:  Deals with APIs, Firebase libraries, databases, and device sensors. Usually composed of data sources and data transfer objects.

## Features/comments

### Linter
For the linting rules we first enable all lint rules through the `all_lint_rules.yaml` file, and then through `analysis_options.yaml` we disable the ones that do not fit the current standard we are aiming for. This approach allows us to include the good practices AND the remaining rules in our coding style.

  - It is easy to maintain our list when new rules are added. It is just a matter of copy-pasting the official list onto our all_lint_rules.yaml file.
  - The selected set of rules were inspired by packages that are well estabilished flutter packages like: [provider](https://github.com/rrousselGit/provider) and [freezed](https://github.com/rrousselGit/freezed)
  - This approach is opinionated and can be changed to adapt to the project needs.

### Bloc (State Management)
Bloc is a well-known and estabilished library to handle state management. It allows us to separate the presentation from the business logic improving the application scalability (especially used with a service locator pattern) and testability. The separation of the business logic (*application*) and the *presentation* makes this a very good approach to use with the Domain Driven Development (DDD)

### Freezed package
Provide us with helpful code generation that allows us to properly implement immutable objects around the project ( better conforming to the DDD approach). Also, help us with *classes* and *unions*.

### Not using the `dartz` package
Dartz package is an amazing tool with a lot of classes that allow us to better conform to the DDD approach, making error states 'unrepresentable'. Although for this challenge we will e using only a small subset of the entire library. That being said we manually implemented the class `Either` and `ValueObject` to use in this project.
- Completely opinionated decisions. (avoid using extra libraries whenever possible)

### Check internet connection  lib (`data_connection_checker`)
For this challenge, we used the `data_connection_checker` to verify if there is an internet connection. You should not  use the current network status for deciding whether you can reliably make a network connection. With this package, we also verify if we can open sockets to a specified list of addresses.
- Modifications were made to make the library **null-safe**.
- This choice is completely opinionated and can be easily changed to use the connectivity package and some additional modifications.

### Caching
A caching workflow/structure has been implemented, although the caching directly conflicts with the 'expiration' of the QR code that was generated (unless it lasts for a long time). For handling the caching, I used the "DataSource" pattern to determine in the repository if we should try to fetch from the remote data source or the local data source. Bear in mind that this use case has to be refined to be functional.

### [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
The Conventional Commits specification is a  convention on top of commit messages. It provides an easy set of rules for creating an explicit commit history. Those rules were followed whenever possible. Bear in mind that the commit purposes should mix up in the initial phase of the project ( as we build everything from scratch)

## Lambda Folder

This folder contains the lambda functions (AWS lambda) used to create the endpoint as requested in the `QR-generator-test.md` description. This was added as a reference on how the `/seed` endpoint was implemented. Bear in mind that thos was a very simplistic implementation, made directly in JS, and deployed directly in `AWS Lamnda` + `AWS Api Gateway`. A full project stack would include:

- Typescript
- Auto deploy script
- Webpack configuration
- More related technologies

## Roadmap

 - Integration tests
 - CI/CD
 - Widget Tests
 - Persistent Seeds from server (actually validate them with another endpoint)

