# Backend

Currently deployed function: https://us-central1-superformula-mobile-test.cloudfunctions.net/seed

### Firebase

The backend uses a firebase function.

You can run the functions locally:

```bash
firebase serve --only functions

```

To deploy the cloud functions you must create a Firebase account, setup a new project, and run the following command:

```bash
firebase deploy --only functions
```

More information can be found here: https://cloud.google.com/functions/docs/tutorials/

### API

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
