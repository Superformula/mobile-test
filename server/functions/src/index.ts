import * as crypto from 'crypto';
import * as functions from 'firebase-functions';
import * as moment from 'moment';

// paths:
//   /seed:
//     get:
//       description: Get a seed that can be used to generate a QR code
//       responses:
//         '200':
//           description: seed generated
//           content:
//             application/json:
//               schema:
//                 $ref: '#/components/schemas/Seed'
// components:
//   schemas:
//     Seed:
//       type: object
//       properties:
//         seed:
//           type: string
//           example: d43397d129c3de9e4b6c3974c1c16d1f
//         expires_at:
//           type: dateTime
//           description: ISO date-time
//           example: '1979-11-12T13:10:42.24Z'
//
export const seed = functions.https.onRequest((_req, res) => {
    // Docs don't specify a length but the example is 32 chars or 16 bytes.
    const randomString = crypto.randomBytes(16).toString('hex')

    // Docs don't specify a TTL so we'll expire 1 minute from now for easy testing.
    const expiresAt = moment.utc().add(1, "minute");

    res.contentType("application/json")
    res.send(JSON.stringify({ seed: randomString, expires_at: expiresAt.toISOString() }))
    res.status(200)
    res.end()
});
