# QR Code Generator 

A simple client-server app, written in Flutter, that demonstrates functionality to display and scan QR Codes. The QR Code images are rendered based on randomly generated `Strings` provided by a backend server (also written in `Dart`). 

## Architecture/Structure 

The app consists of the following core packages: 

 - lib
    - app
    - data 
    - domain        
- test              
- web 
    - qr_server     


#### **App**

Synonymous with a **Presentation** package, this set of components encapsulates the display, or forward-facing, components of the app -- UI views, navigation, and UI based utilities. The UI consists of three main screens (or pages):

- The `Home` page - which displays a Floating Action Button (FAB) that provides menu options for "Scan" and "QR Code". When a FAB option is tapped, the user will be driven to either the `Scan` or `QR Code` page. 
- The `Scan` page - displays a camera view for scanning QR Code images. 
- The `QR Code` page - upon launch, will trigger `GET` requests to the backend server for a `Seed` (an object that contains a `String` and an `expiresAt` `DateTime` object that denotes an expiration time for the QR Code image). Upon receiving the `Seed` object, a QR Code image is rendered on the page, with an associated countdown timer that shows when the image will expire. (The default value of the expiration time is 60 seconds). When a QR Code expires, a `Refresh Seed` button will appear that will allow the user to generate another QR Code.  

#### **Data** 

The data package provides the components that handle data transfers between the app's backend server and its UI. Based on the `Clean Architecture` paradigm, the logic in this package is designed to be reusable but specific to "qr code generating" apps, or apps that focus on fetching seeds for QR Code generation. It includes components such as: 
- The `GetSeedUseCase` - class that defines the app's seed-based transactions: getting seeds. 
- `RepositoryImpl` - repository (or data store) implementations - `remote_client` (to get seeds from remote sources, namely servers), and `cache_client` (to get seeds from local caches, if any). 

#### **Domain** 

In keeping with `Clean Architecture`, the components in this package live at the highest level of abstraction, and represent logic that is the most reusable across a variety of apps; they need only require `Seed` models, whether or not they use them for QR Code generation. These components include: 
- `Models` - for the `Seed` data models - the domain model and the server (or data transfer object) model; 
- `Repository` - an abstract class (or interface) that defines the data store operations for a `Seed` entity. 

> Note that, due to this app's simplicity, the functional purposes of the `data` and `domain` packages do overlap. Nevertheless, the packages are still separated to highlight the separation of responsibilities that would be necessary in an enterprise or production app. 

#### **Web** 

This contains the server logic for the app. ("Web" is perhaps a bit of a misnomer.) It consists of two simple `Dart` based command-line tools (housed in `qr_server/bin`): 
- `qr_code_gen.dart` - The server logic that receives `GET` requests from its clients and generates `Seed` responses in return. 
- `qr_code_gen_test.dart` - A command-line client tool to test the server; makes `GET` requests to the server and prints out the responses. 

#### **Test** 

The set of tests - unit and widget tests - for the app's logic. 



