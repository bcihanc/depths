import 'package:depths/depths.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stack_trace/stack_trace.dart';

class _AsyncPodBuilder<T> extends StatefulWidget {
  const _AsyncPodBuilder({
    super.key,
    required this.pod,
    required this.builder,
    this.loadingBuilder,
    this.useMock,
    this.mock,
    this.skipError = false,
    this.skipLoadingOnRefresh = true,
    this.skipLoadingOnReload = false,
  }) : assert(mock != null || useMock == null, 'mock must be provided if onlyMock is true');

  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;

  final Widget Function(BuildContext context, T data) builder;
  final Widget? Function()? loadingBuilder;

  final AsyncValue<T> pod;
  final T? mock;
  final bool? useMock;

  @override
  State<_AsyncPodBuilder<T>> createState() => _AsyncPodBuilderState<T>();
}

class _AsyncPodBuilderState<T> extends State<_AsyncPodBuilder<T>> {
  bool isErrorPrinted = false;

  @override
  Widget build(BuildContext context) {
    if (widget.useMock == true) {
      return Stack(
        children: [
          widget.builder(context, widget.mock!),
          if (kDebugMode)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.bug_report_outlined, color: Colors.white, size: 14),
                ),
              ),
            )
        ],
      );
    }

    return widget.pod.when(
      skipError: widget.skipError,
      skipLoadingOnReload: widget.skipLoadingOnReload,
      skipLoadingOnRefresh: widget.skipLoadingOnRefresh,
      data: (data) => widget.builder(context, data),
      loading: () =>
          widget.loadingBuilder?.call() ??
          (widget.mock == null
              ? CircularProgressIndicator.adaptive(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(context.colorScheme.primary))
              : Skeletonizer(child: widget.builder(context, widget.mock!))),
      error: (err, stack) {
        if (isErrorPrinted == false) {
          DepthsLoggers.advanced.e(err, stackTrace: stack);
          isErrorPrinted = true;
        }
        return GestureDetector(
            onTap: () {
              DepthsLoggers.advanced.e(err, stackTrace: stack);
              _showErrorBottomSheet(context, err, stack);
            },
            child: widget.mock != null
                ? Skeletonizer(
                    effect: SoldColorEffect(color: Colors.red.withOpacity(.4)),
                    child: widget.builder(
                      context,
                      widget.mock!,
                    ))
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
    bool? useMock,
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
        useMock: useMock,
        loadingBuilder: () => loading,
        builder: (context, data) => builder(data),
      );
}
