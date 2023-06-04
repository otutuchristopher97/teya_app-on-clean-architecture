class AppAnalyticEvent {
  String name;
  Map<String, Object?>? parameters;
  AppAnalyticEvent({
    required this.name,
    this.parameters,
  });
}
