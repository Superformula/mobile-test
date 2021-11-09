const helpers = require("../../../helpers/dateHelpers");
const { v4: uuidv4 } = require("uuid");

module.exports = function () {
  let operations = {
    GET,
  };

  function GET(req, res, next) {
    res.status(200).json({
      data: {
        id: uuidv4(),
        expiresAt: helpers.dateWhithMinutes(1),
      },
    });
  }

  GET.apiDoc = {
    summary: "Fetch seed.",
    operationId: "getSeed",
    responses: {
      200: {
        description: "Get a seed that can be used to generate a QR code",
        schema: {
          type: "object",
          items: {
            $ref: "#/definitions/Seed",
          },
        },
      },
    },
  };

  return operations;
};
