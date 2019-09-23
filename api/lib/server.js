"use strict";

const Hapi = require("@hapi/hapi");
const cryptoRandomString = require("crypto-random-string");
const dayjs = require("dayjs");

const server = Hapi.server({
  port: 3000,
  host: "localhost"
});

server.route({
  method: "GET",
  path: "/",
  handler: () => {
    return "";
  }
});

server.route({
  method: "GET",
  path: "/api/qr",
  handler: () => {
    return {
      seed: cryptoRandomString({ length: 32 }),
      expires_at: dayjs().add(2, "day")
    };
  }
});

const init = async () => {
  await server.start();
  console.log("Server running on %s", server.info.uri);
};

process.on("unhandledRejection", err => {
  console.log(err);
  process.exit(1);
});

init();

module.exports = server;
