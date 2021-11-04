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
          expires_at: {
            type: "string",
          },
        },
        required: ["seed", "expires_at"],
      },
    },
    paths: {},
  };
  
  module.exports = apiDoc;
  