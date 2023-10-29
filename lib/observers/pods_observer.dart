import 'package:depths/depths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DepthsPodObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    DepthsLoggers.basic.t('name          : ${provider.name} \ninitialValue  : $value');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    DepthsLoggers.basic.i('name      : ${provider.name} \noldValue  : $previousValue \nnewValue  : ${newValue.toString()}');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    DepthsLoggers.basic.w('name : ${provider.name}');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    DepthsLoggers.advanced.e('Provider failed: ${provider.name ?? provider.runtimeType}');
  }
}
