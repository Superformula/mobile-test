import * as functions from 'firebase-functions';
import * as crypto from 'crypto';
import * as moment from "moment";

const RESPONSE_STATUS_CODE = 200;
const RESPONSE_CONTENT_TYPE = "application/json";

const SEED_ENCODING = "hex";
const SEED_LENGTH = 32;
const SEED_TTL = 1;
const SEED_TTL_UNIT = "minute";

export const seed = functions.https.onRequest(
    (_req, res) => {
        res.contentType(RESPONSE_CONTENT_TYPE);

        res.send(
            JSON.stringify({
                    seed: crypto.randomBytes(SEED_LENGTH).toString(SEED_ENCODING),
                    expires_at: moment.utc().add(SEED_TTL, SEED_TTL_UNIT).toISOString()
                }
            )
        );

        res.status(RESPONSE_STATUS_CODE);

        res.end();
    }
);
