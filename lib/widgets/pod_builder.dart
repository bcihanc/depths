import 'package:depths/depths.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stack_trace/stack_trace.dart';

class BuildsCountWidget extends HookWidget {
  const BuildsCountWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final buildCount = useBuildsCount();
    return Stack(alignment: Alignment.topRight, children: [
      child,
      Container(
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            buildCount.toString(),
            style: context.textStyle.copyWith(fontSize: 8, color: context.colorScheme.onPrimary),
          ),
        ),
      ),
    ]);
  }
}

class _AsyncPodBuilder<T> extends StatelessWidget {
  const _AsyncPodBuilder({
    super.key,
    required this.pod,
    required this.builder,
    this.loadingBuilder,
    this.onlyMock,
    this.mock,
    this.skipError = false,
    this.skipLoadingOnRefresh = true,
    this.skipLoadingOnReload = false,
  }) : assert(mock != null || onlyMock == null, 'mock must be provided if onlyMock is true');

  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;

  final Widget Function(BuildContext context, T data) builder;
  final Widget? Function()? loadingBuilder;

  final AsyncValue<T> pod;
  final T? mock;
  final bool? onlyMock;

  @override
  Widget build(BuildContext context) {
    if (onlyMock == true)
      return Stack(
        children: [
          builder(context, mock!),
          if (kDebugMode)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('m',
                      style: context.textStyle.copyWith(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            )
        ],
      );

    return pod.when(
      skipError: skipError,
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      data: (data) => builder(context, data),
      loading: () =>
          loadingBuilder?.call() ??
          (mock == null
              ? CircularProgressIndicator.adaptive(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(context.colorScheme.primary))
              : Skeletonizer(child: builder(context, mock!))),
      error: (err, stack) {
        return GestureDetector(
            onTap: () {
              DepthsLoggers.advanced.e(err, stackTrace: stack);
              _showErrorBottomSheet(context, err, stack);
            },
            child: mock != null
                ? Stack(
                    children: [
                      Skeletonizer(effect: SoldColorEffect(color: Colors.red.withOpacity(.4)), child: builder(context, mock!)),
                      if (kDebugMode)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('e',
                                  style: context.textStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        )
                    ],
                  )
                : Icon(Icons.error_outline, color: context.colorScheme.error));
      },
    );
  }

  Future<dynamic> _showErrorBottomSheet(BuildContext context, Object err, StackTrace stack) {
    return showModalBottomSheet(
      useRootNavigator: true,
      showDragHandle: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(err.toString(), style: context.textStyle.copyWith(color: context.colorScheme.error)),
                const SizedBox(height: 8),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: Trace.from(stack).frames.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Text((index + 1).toString()),
                    title: Text(Trace.from(stack).frames[index].toString()),
                    subtitle: Text(Trace.from(stack).frames[index].location.toString()),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

extension AsyncValueX<T> on AsyncValue<T> {
  Widget widget(
    Widget Function(T value) builder, {
    Key? key,
    Widget? loading,
    T? mock,
    bool? onlyMock,
    bool skipLoadingOnRefresh = true,
    bool skipLoadingOnReload = false,
    bool skipError = false,
  }) =>
      _AsyncPodBuilder(
        key: key,
        pod: this,
        skipError: skipError,
        skipLoadingOnReload: skipLoadingOnReload,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        mock: mock,
        onlyMock: onlyMock,
        loadingBuilder: () => loading,
        builder: (context, data) => builder(data),
      );
}
