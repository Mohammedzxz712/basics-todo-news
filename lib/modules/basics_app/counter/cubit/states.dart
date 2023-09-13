abstract class CountStates {}

class CountInitial extends CountStates {}

class CountMinus extends CountStates {
  final int counter;
  CountMinus(this.counter);
}

class CountPlus extends CountStates {
  final int counter;
  CountPlus(this.counter);
}
