const index = require('./index');

let event = {
  resource: '/seed',
  path: '/seed',
  httpMethod: 'GET',
  headers: {
    Accept: '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'CloudFront-Forwarded-Proto': 'https',
    'CloudFront-Is-Desktop-Viewer': 'true',
    'CloudFront-Is-Mobile-Viewer': 'false',
    'CloudFront-Is-SmartTV-Viewer': 'false',
    'CloudFront-Is-Tablet-Viewer': 'false',
    'CloudFront-Viewer-Country': 'DE',
    'Content-Type': 'application/json',
    Host: '2gm7s0ndvl.execute-api.us-east-1.amazonaws.com',
    'Postman-Token': 'afbc35ec-21db-4ca3-a8dc-27b6a5204974',
    'User-Agent': 'PostmanRuntime/7.28.0',
    Via: '1.1 f1d5d7779515e0233ce392877610b704.cloudfront.net (CloudFront)',
    'X-Amz-Cf-Id': '_Md2TnfKuPCMUVrRyWA95nC6ojdVQvyzY28DBhptH-XiWljQF7159w==',
    'X-Amzn-Trace-Id': 'Root=1-60a1fbef-51bcf2a82c5e1d7a7b31dced',
    'x-api-key':
      'OGZjN2I2MzUtMmRjZC00YzRhLWEzOWMtNTBiYjhhNTEwZGY5|qnlz4JqV!1J-c%4SQZBIisnz1s__xh2qYFZD7I-%MZF-FKGk&kKLq5+tg$.aWKOP',
    'X-Forwarded-For': '92.116.151.77, 130.176.87.74',
    'X-Forwarded-Port': '443',
    'X-Forwarded-Proto': 'https',
  },
  multiValueHeaders: {
    Accept: ['*/*'],
    'Accept-Encoding': ['gzip, deflate, br'],
    'CloudFront-Forwarded-Proto': ['https'],
    'CloudFront-Is-Desktop-Viewer': ['true'],
    'CloudFront-Is-Mobile-Viewer': ['false'],
    'CloudFront-Is-SmartTV-Viewer': ['false'],
    'CloudFront-Is-Tablet-Viewer': ['false'],
    'CloudFront-Viewer-Country': ['DE'],
    'Content-Type': ['application/json'],
    Host: ['2gm7s0ndvl.execute-api.us-east-1.amazonaws.com'],
    'Postman-Token': ['afbc35ec-21db-4ca3-a8dc-27b6a5204974'],
    'User-Agent': ['PostmanRuntime/7.28.0'],
    Via: ['1.1 f1d5d7779515e0233ce392877610b704.cloudfront.net (CloudFront)'],
    'X-Amz-Cf-Id': ['_Md2TnfKuPCMUVrRyWA95nC6ojdVQvyzY28DBhptH-XiWljQF7159w=='],
    'X-Amzn-Trace-Id': ['Root=1-60a1fbef-51bcf2a82c5e1d7a7b31dced'],
    'x-api-key': [
      'OGZjN2I2MzUtMmRjZC00YzRhLWEzOWMtNTBiYjhhNTEwZGY5|qnlz4JqV!1J-c%4SQZBIisnz1s__xh2qYFZD7I-%MZF-FKGk&kKLq5+tg$.aWKOP',
    ],
    'X-Forwarded-For': ['92.116.151.77, 130.176.87.74'],
    'X-Forwarded-Port': ['443'],
    'X-Forwarded-Proto': ['https'],
  },
  queryStringParameters: null,
  multiValueQueryStringParameters: null,
  pathParameters: {
    'service-id': 'aws',
    'box-id': 'II0xKcWRrLHoLRjE0Bu7wo2CztcupWeH',
  },
  stageVariables: null,
  requestContext: {
    resourceId: 'yojcpt',
    resourcePath: '/boxes/{box-id}/devices/{service-id}',
    httpMethod: 'POST',
    extendedRequestId: 'fdRNeECwIAMFd6Q=',
    requestTime: '17/May/2021:05:15:27 +0000',
    path: '/deploy-dev/boxes/II0xKcWRrLHoLRjE0Bu7wo2CztcupWeH/devices/aws',
    accountId: '767733184305',
    protocol: 'HTTP/1.1',
    stage: 'deploy-dev',
    domainPrefix: '2gm7s0ndvl',
    requestTimeEpoch: 1621228527730,
    requestId: 'f2995d70-6959-4a17-81b5-2c4f3b3f678d',
    identity: {
      cognitoIdentityPoolId: null,
      cognitoIdentityId: null,
      apiKey:
        'OGZjN2I2MzUtMmRjZC00YzRhLWEzOWMtNTBiYjhhNTEwZGY5|qnlz4JqV!1J-c%4SQZBIisnz1s__xh2qYFZD7I-%MZF-FKGk&kKLq5+tg$.aWKOP',
      principalOrgId: null,
      cognitoAuthenticationType: null,
      userArn: null,
      apiKeyId: 'vj3p87mu38',
      userAgent: 'PostmanRuntime/7.28.0',
      accountId: null,
      caller: null,
      sourceIp: '92.116.151.77',
      accessKey: null,
      cognitoAuthenticationProvider: null,
      user: null,
    },
    domainName: '2gm7s0ndvl.execute-api.us-east-1.amazonaws.com',
    apiId: '2gm7s0ndvl',
  },
  body: '{\n    "service": "AWS",\n    "credentials": {\n        "accessKey": "AKIAI*********",\n        "secretAccessKey": "otnJc*********",\n        "ca": "-----BEGIN CERTIFICATE-----\\nMIIDQTCCAimgAwIBA**********",\n        "endpoint": "a2mx2suo5f5iok-ats.iot.us-east-1.amazonaws.com"\n    },\n    "credentialsId": "Gq8W4iAlOYa440ZWBrtxfUu82JTnw8Re",\n    "deviceId": "samplename",\n    "moduleId": "II0xKcWRrLHoLRjE0Bu7wo2CztcupWeH",\n    "readWriteConfig": {\n        "isRead": true,\n        "isWrite": false,\n        "source": "00:02:01:0b:80:cb",\n        "inputId": "iolink1",\n        "config": {\n            "frequency": "interval",\n            "interval": 2000\n        },\n        "icon": "fas fa-thermometer-half",\n        "vendorId": 310,\n        "deviceId": 706\n    },\n    "deviceDescription": "sampledescription",\n    "advancedConfig": {\n        "usePort": false,\n        "useShadow": false\n    }\n}',
  isBase64Encoded: false,
};

index
  .handler(event)
  .then((data) => {
    console.log(data);
  })
  .catch((error) => {
    console.log(error);
  });
