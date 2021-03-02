# qr_generator

A simple app that can call the seed API and generate a QR code based on the seed.

## Context

- A client needs to display a QR code in their App.
- The QR code can be used to identify one's profile or a certain feature.

## UI

Home | QR Code
---- | -------
![Home](qr_generator/assets/app-home.png) | ![QR](qr_generator/assets/app-qr.png)

## Project architecture

![Architecture](qr_generator/assets/CLEAN_ARCH.png)

- Domain: Abstracts all the base logic interfaces without any specific implementations.
- Data: Implements Domain's interfaces with specific code, formats and packages.
- Presentation: Actual Flutter project with business logic that sets Domain's base types and fulfills with Data's implementations.
- Core: Common app components between project modules or features.

### Modules

![Modules](qr_generator/assets/Superformula_app.png)

- qr_generator: Flutter app where the Presentation layer is located. Has a `/packages` folder with every feature's Domain and Data layers.
- qr_gen: Dart package located in `qr_generator` packages. Encapsulates the functionality to get seed from API.
- qr_code_gen: Flutter package I made some time ago to encapsulate logic and ensure testability of the QR generation functionality.
- mobile_test_server: Node.js Rest API that has the `/seed` endpoint to get a seed object.

## How to run the project

## API

(in Open API 3.0 format)

```yaml
paths:
  /seed:
    get:
      description: Get a seed that can be used to generate a QR code
      responses:
        '200':
          description: seed generated
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Seed'
components:
  schemas:
    Seed:
      type: object
      properties:
        seed:
          type: string
          example: d43397d129c3de9e4b6c3974c1c16d1f
        expires_at:
          type: dateTime
          description: ISO date-time
          example: '1979-11-12T13:10:42.24Z'
```

## Tech stack

- API
  - Node.js
  - Express
  - MongoDB
- Mobile app
  - Flutter

## Advanced features

- ✅ Provide an auto-refresh strategy with the `expires_at` value. The app shows a refresh button in `qr_gen_page`.
- ✅ Provide an offline QR code access strategy. The app uses state management to show a list of the scanned items.
