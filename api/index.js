const server = require("./lib/server");

const init = async () => {
  await server.start();
  console.log("Server running on %s", server.info.uri);
};

init();
