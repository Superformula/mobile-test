# SuperFormula Test
## Build Instructions For Windows

1. Install [Flutter](https://flutter.dev/docs/get-started/install) SDK on local machine
2. Make sure you've installed Android Studio or VScode with their respective flutter plugins.
3. Clone the repo
4. Generating **json serialization** code for your models use this command:

```engine='sh'
cd path/to-your-project
flutter pub get 
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## Design Pattern 
The design pattern currently being use is based on the **Domain Driven Design (DDD)** where features are grouped under a single domain and this helps our code to be more:

1. **Maintainability**: no messed code, no cross-referencing between segments.
2. **Scalability**: You can add new functionality more easily
3. **Testability**: You can mock dependencies.

## Project Structure #

Our project consist of a **core**, **domain**, **pages**, **router**, and **services** folder at a high level and is broken down as shown below

**Core** consist of functions, features and widgets that will be used thoughtout the app.

 **Domain** consist of features folders and each of these folder has the following folders:
- **Models**: Defines the structure of the data
- **Providers**: Provides data to views, update view states
- **Repository**: Contains classes that is use fetches data from a both local and remote sources
 
**Pages** this holds views/widget that has a navigation route associated with them in the app of the project and are grouped based on domain

**Router** contains the routing for all pages

## Directory structure # 
    .             
    ├── libs                    
    │   ├── core                
    │   ├── domain
    │   │   └── feature   
    │   │       ├── models      
    │   │       ├── providers   
    │   │       └── repository  # classes that pulls data remotely or locally
    │   ├── router              # definition of navigation routes in the app
    │   ├── pages               # contains widget that has a route to them          
    │   ├── services            
    └── test                    # unit test