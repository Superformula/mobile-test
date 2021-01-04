import 'package:bloc_test/bloc_test.dart';
import 'package:qr_code_test/blocs/slider/slider.dart';
import 'package:test/test.dart';

void main() {
  SliderBloc sliderBloc;

  setUpAll(() {
    sliderBloc = SliderBloc(menuWidth: 180.0);
  });

  group("QRFetchBloc", () {
    test("The initial state must be 'QRLoading'", () {
      expect(sliderBloc.state, -180.0);
    });

    blocTest<SliderBloc, double>(
        "Testing how the bloc behaves when the button is toggled repeatedly",
        build: () => sliderBloc,
        act: (bloc) => bloc
          ..add(const ToggleSlider())
          ..add(const ToggleSlider())
          ..add(const ToggleSlider())
          ..add(const ToggleSlider()),
        expect: const [
          16.0,
          -180,
          16.0,
          -180,
        ],
        verify: (bloc) {
          expect(bloc.state, equals(-180));
        });
  });
}