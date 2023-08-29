import 'dart:async';

import 'package:flutter/material.dart';
import 'package:creator/creator.dart';

extension EmitterX<T> on Emitter<T> {
  Watcher watcher(
    Widget Function(BuildContext context, Ref ref, T value) builder, {
    Key? key,
    final Widget Function(BuildContext context, String error)? errorBuilder,
    final Widget? loading,
    final String? builderName,
    final String? listenerName,
    final void Function(Ref ref)? listener,
    Widget? child,
  }) {
    return Watcher(
        builderName: builderName,
        listener: listener,
        key: key,
        listenerName: listenerName,
        child: child, (context, ref, child) {
      const defaultIndicator =
          Center(child: CircularProgressIndicator.adaptive());

      try {
        final currentAsyncData = ref.watch(asyncData);
        if (currentAsyncData.status == AsyncDataStatus.active) {
          final state = currentAsyncData.data;
          if (state != null) {
            return builder(context, ref, state);
          } else {
            return const SizedBox.shrink();
          }
        } else {
          return loading ?? defaultIndicator;
        }
      } catch (error) {
        var errorWidget = errorBuilder?.call(context, error.toString());
        return errorWidget ?? Text(error.toString());
      }
    });
  }
}

extension CreatorX<T> on Creator<T> {
  Watcher watcher(
    Widget Function(BuildContext context, Ref ref, T value) builder, {
    Key? key,
    final Widget Function(BuildContext context, String error)? errorBuilder,
    final Widget? loading,
    final String? builderName,
    final String? listenerName,
    final void Function(Ref ref)? listener,
    Widget? child,
  }) {
    return Watcher(
        builderName: builderName,
        listener: listener,
        key: key,
        listenerName: listenerName,
        child: child, (context, ref, child) {
      try {
        final state = ref.watch(this);
        if (state != null) {
          return builder(context, ref, state);
        } else {
          return const SizedBox.shrink();
        }
      } catch (error) {
        var errorWidget = errorBuilder?.call(context, error.toString());
        return errorWidget ?? Text(error.toString());
      }
    });
  }
}

extension RefX on Ref {
  void listen<T>(CreatorBase<FutureOr<T>> creator,
      void Function(Change<T> change) onChange,
      {String? name, bool? keepAlive, List<Object?>? args}) {
    if (creator is Creator<T>) {
      watch(Creator((ref) {
        onChange(ref.watch(creator.change));
      },
          name: name ??
              (creator.name != null ? '${creator.name}_listen' : 'listen'),
          keepAlive: keepAlive ?? creator.keepAlive,
          args: args ?? creator.args));
    } else if (creator is Emitter<T>) {
      watch(Emitter((ref, emit) async {
        onChange(await ref.watch(creator.change));
      },
          name: name ??
              (creator.name != null ? '${creator.name}_listen' : 'listen'),
          keepAlive: keepAlive ?? creator.keepAlive,
          args: args ?? creator.args));
    } else {
      throw Exception('creator must be Creator or Emitter');
    }
  }
}
