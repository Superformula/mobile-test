const expect = require("expect");
const server = require("./server"); // Import Server/Application

// Start application before running the test case
beforeAll(done => {
  server.events.on("start", () => {
    done();
  });

  server.start();
});

// Stop application after running the test case
afterAll(done => {
  server.events.on("stop", () => {
    done();
  });
  server.stop();
});

test("should success with server connection", async function(done) {
  expect.assertions(1);
  const options = {
    method: "GET",
    url: "/"
  };
  const data = await server.inject(options);
  expect(data.statusCode).toBe(200);
  done();
});

test("should receive seed", async function(done) {
  expect.assertions(3);
  const options = {
    method: "GET",
    url: "/api/qr"
  };
  const data = await server.inject(options);

  expect(data.statusCode).toBe(200);
  expect(data.result.seed).toBeDefined();
  expect(data.result.expires_at).toBeDefined();
  done();
});
