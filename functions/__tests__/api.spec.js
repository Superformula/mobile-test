const api = require("../src/app").api
const request = require('supertest')

describe("GET /seed ", () => {
  test("It should respond with seed and expired_at", async () => {
    const response = await request(api).get("/seed?name=robson");
    const base64string = response.body.seed
    const expires_at = new Date(response.body.expires_at)
    expect(typeof base64string).toBe('string');
    expect(expires_at instanceof Date).toBe(true);
    expect(response.statusCode).toBe(200);
  });
});