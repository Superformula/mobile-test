import 'harness/app.dart';

Future main() async {
  final harness = Harness()..install();

  test("GET /seed returns 200", () async {
    expectResponse(await harness.agent.get("/seed"), 200);
  });
}
