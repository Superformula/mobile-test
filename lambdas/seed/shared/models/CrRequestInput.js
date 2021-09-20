class RequestInput {
  constructor(userIdentity, body) {
    this.userIdentity = userIdentity;
    this.body = body;
  }
}

exports.CrRequestInput = RequestInput;
