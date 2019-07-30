import * as functions from 'firebase-functions';

export const seed = functions.https.onRequest((request, response) => {
    response.send("Hello from Firebase!");
});
