import * as functions from 'firebase-functions';

const uuidv1 = require('uuid/v1');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);
const db = admin.firestore();

export const fetchSeed = functions.https.onRequest(async (request, response) => {

    const milliseconds = (new Date).getTime() + (1000 * 120);
    const seedValue = uuidv1();

    await db.collection("/data").doc("qrcode")
                 .set({latest_seed: seedValue}, { merge: true });
    return response
            .status(200)
            .type("application/json")
            .send(JSON.stringify({seed: seedValue, expires_at: milliseconds}));
});
