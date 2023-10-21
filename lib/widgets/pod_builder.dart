import 'package:depths/depths.dart';
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

class _AsyncPodBuilder<T> extends HookWidget {
  const _AsyncPodBuilder({
    super.key,
    required this.pod,
    required this.builder,
    this.loadingBuilder,
    this.mock,
    this.skipError = false,
    this.skipLoadingOnRefresh = true,
    this.skipLoadingOnReload = false,
  });

  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;

  final Widget Function(BuildContext context, T? data) builder;
  final Widget Function(BuildContext context)? loadingBuilder;

  final AsyncValue<T> pod;
  final T? mock;

  @override
  Widget build(BuildContext context) {
    return pod.when(
      skipError: skipError,
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      data: (data) => builder(context, data),
      loading: () => loadingBuilder?.call(context) ?? (mock == null ? const CircularProgressIndicator.adaptive() : Skeletonizer(child: builder(context, mock))),
      error: (err, stack) {
        useEffectOnce(() {
          DepthsLoggers.advanced.e(err, stackTrace: stack);
          return;
        });
        return GestureDetector(
            onTap: () {
              showModalBottomSheet(
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
            },
            child: Icon(Icons.error_outline, color: context.colorScheme.error));
      },
    );
  }
}

extension AsyncValueX<T> on AsyncValue<T> {
  Widget widgetData(Widget Function(T? data) builder) => _AsyncPodBuilder(
        pod: this,
        loadingBuilder: (context) => const SizedBox.shrink(),
        builder: (context, data) => builder(data),
      );

  Widget widgetDataWithMock(T mock, Widget Function(T? data) builder) => _AsyncPodBuilder(
        pod: this,
        mock: mock,
        builder: (context, data) => builder(data),
      );

  Widget widgetDataOrThrow(Widget Function(T data) builder) => _AsyncPodBuilder(
        pod: this,
        loadingBuilder: (context) => const SizedBox.shrink(),
        builder: (context, data) => data == null ? throw Exception('data is null') : builder(data),
      );
  Widget widgetDataAndLoadOrThrow({required Widget Function(T value) data, required Widget Function() loadingWidget}) => _AsyncPodBuilder(
        pod: this,
        loadingBuilder: (context) => loadingWidget(),
        builder: (context, value) => value == null ? throw Exception('data is null') : data(value),
      );

  Widget widgetDataAndLoad({required Widget Function(T? value) data, required Widget Function() loadingWidget}) => _AsyncPodBuilder(
        pod: this,
        loadingBuilder: (context) => loadingWidget(),
        builder: (context, value) => data(value),
      );

  Widget widgetDataWithMockOrThrow(T mock, Widget Function(T data) builder) => _AsyncPodBuilder(
        pod: this,
        mock: mock,
        builder: (context, data) => data == null ? throw Exception('data is null') : builder(data),
      );
}
