import 'package:depths/depths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DepthsPodObserver extends ProviderObserver {
  DepthsPodObserver({
    this.add = true,
    this.update = true,
    this.dispose = true,
    this.fail = true,
  });

  final bool add;
  final bool update;
  final bool dispose;
  final bool fail;

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (add == false) return;
    DepthsLoggers.basic.t('name          : ${provider.name} \ninitialValue  : $value');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (update == false) return;

    final exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    DepthsLoggers.basic
        .i('name      : ${provider.name} \noldValue  : $previousValue \nnewValue  : ${newValue.toString().replaceAll(exp, '').replaceAll('\n', '')}');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    if (dispose == false) return;
    DepthsLoggers.basic.w('name : ${provider.name}');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    if (fail == false) return;
    DepthsLoggers.advanced.e('Provider failed: ${provider.name ?? provider.runtimeType}');
  }
}
