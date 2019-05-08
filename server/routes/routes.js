let appRouter = (app) => {
  app.get("/seed", (req, res) => {
    res.status(200).send("Test response");
  });
}

module.exports = appRouter;