class StatusModels {
  final int maximumValue;
  final int minimumValue;

  StatusModels({required this.maximumValue, required this.minimumValue}) : assert(maximumValue > minimumValue);
}
