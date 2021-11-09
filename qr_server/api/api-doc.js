const apiDoc = {
  swagger: "2.0",
  basePath: "/",
  info: {
    title: "Qr server API.",
    version: "1.0.0",
  },
  definitions: {
    Seed: {
      type: "object",
      properties: {
        seed: {
          type: "string",
        },
        expiresAt: {
          type: "string",
        },
      },
      required: ["seed", "expiresAt"],
    },
  },
  paths: {},
};

module.exports = apiDoc;
