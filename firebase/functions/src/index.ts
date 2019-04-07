import * as functions from 'firebase-functions';


const uuidv1 = require('uuid/v1');

export const fetchSeed = functions.https.onRequest((request, response) => {

    const milliseconds = (new Date).getTime() + (1000 * 120);

    return response
            .status(200)
            .type("application/json")
            .send(JSON.stringify({seed: "seed333-" + uuidv1(), expires_at: milliseconds}));
});
