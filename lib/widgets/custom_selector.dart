import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CSelector<T, E> extends StatelessWidget {
  final Widget Function(BuildContext, E) builder;
  final E Function(T) selector;
  const CSelector({
    required this.builder,
    required this.selector,
  });
  @override
  Widget build(BuildContext context) {
    final value = context.select<T, E>(selector);
    return builder(context, value);
  }
}
