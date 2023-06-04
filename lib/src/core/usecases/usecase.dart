///[Future].
mixin UseCases<T, Params> {
  Future<T?>? call(Params params);
}

///[Future].
mixin NoParamUseCases<T> {
  Future<T?>? call();
}

///[Streams].
mixin StreamUseCases<T, Params> {
  Stream<T?> call(Params params);
}
