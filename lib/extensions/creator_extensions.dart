part of depths;

typedef CreatorDateBuilder<T> = Widget Function(BuildContext context, Ref ref, T data);
typedef CreatorLoadingBuilder<T> = Widget Function(BuildContext context, Ref ref);
typedef CreatorErrorBuilder<T> = Widget Function(BuildContext context, Ref ref, FlutterErrorDetails error);

typedef CreatorRun<T> = T Function(Function() onError);

extension EmitterX<T> on Emitter<T> {
  Widget widget({
    required CreatorDateBuilder<T> builder,
    CreatorErrorBuilder<T>? errorBuilder,
    CreatorLoadingBuilder<T>? loadingBuilder,
    T? mock,
    bool useMock = false,
    bool sliver = false,
  }) {
    // assert(mock != null || loadingBuilder != null, 'mock or loadingBuilder must be provided');
    // assert(mock != null || useMock == true, '$debugName mock must be provided if useMock is true');

    return Watcher((context, ref, _) {
      if (useMock && mock != null) {
        return sliver ? SliverToBoxAdapter(child: builder(context, ref, mock)) : builder(context, ref, mock);
      }
      try {
        final currentAsyncData = ref.watch(asyncData);
        final loading = currentAsyncData.status == AsyncDataStatus.waiting;
        final state = currentAsyncData.data;

        if (loading) {
          if (loadingBuilder != null) {
            return loadingBuilder(context, ref);
          } else if (mock != null) {
            return sliver
                ? Skeletonizer.sliver(ignoreContainers: true, enabled: true, child: builder(context, ref, mock))
                : Skeletonizer(ignoreContainers: true, enabled: true, child: builder(context, ref, mock));
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        } else {
          if (state == null) {
            final flutterErrorDetails = FlutterErrorDetails(exception: ArgumentError.notNull(debugName), stack: StackTrace.current);
            return errorBuilder?.call(context, ref, flutterErrorDetails) ?? ErrorWidget('$debugName is null');
          } else {
            return builder(context, ref, state);
          }
        }
      } catch (e, s) {
        final flutterErrorDetails = FlutterErrorDetails(exception: e, stack: s);
        return errorBuilder?.call(context, ref, flutterErrorDetails) ?? ErrorWidget(e);
      }
    });
  }
}

extension CreatorX<T> on Creator<T> {
  Watcher widget({
    required CreatorDateBuilder<T> builder,
    CreatorErrorBuilder<T>? errorBuilder,
  }) {
    return Watcher((context, ref, _) {
      try {
        final state = ref.watch(this);
        if (state == null) {
          final flutterErrorDetails = FlutterErrorDetails(exception: ArgumentError.notNull(debugName), stack: StackTrace.current);
          return errorBuilder?.call(context, ref, flutterErrorDetails) ?? ErrorWidget('$debugName is null');
        } else {
          return builder(context, ref, state);
        }
      } catch (e, s) {
        final flutterErrorDetails = FlutterErrorDetails(exception: e, stack: s);
        return errorBuilder?.call(context, ref, flutterErrorDetails) ?? ErrorWidget(e);
      }
    });
  }
}

// extension RefX on Ref {
//   void listen<T>(CreatorBase<FutureOr<T>> creator, void Function(Change<T> change) onChange, {String? name, bool? keepAlive, List<Object?>? args}) {
//     if (creator is Creator<T>) {
//       watch(Creator((ref) {
//         onChange(ref.watch(creator.change));
//       }, name: name ?? (creator.name != null ? '${creator.name}_listen' : 'listen'), keepAlive: keepAlive ?? creator.keepAlive, args: args ?? creator.args));
//     } else if (creator is Emitter<T>) {
//       watch(Emitter((ref, emit) async {
//         onChange(await ref.watch(creator.change));
//       }, name: name ?? (creator.name != null ? '${creator.name}_listen' : 'listen'), keepAlive: keepAlive ?? creator.keepAlive, args: args ?? creator.args));
//     } else {
//       throw Exception('creator must be Creator or Emitter');
//     }
//   }
// }
