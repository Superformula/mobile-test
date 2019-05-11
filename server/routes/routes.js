let appRouter = (app, seedRepo) => {
  app.get('/seed', (req, res) => {
    res.status(200).send(seedRepo.makeSeed(20));
  });

  app.get('/validate', (req, res) => {
    let isValid = seedRepo.validateCode(req.query.code);
    res.status(200).send({ is_valid: isValid });
  });
}

module.exports = appRouter;