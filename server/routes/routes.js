let appRouter = (app, seedRepo) => {
  app.get("/seed", (req, res) => {
    res.status(200).send(seedRepo.makeSeed(20));
  });
}

module.exports = appRouter;