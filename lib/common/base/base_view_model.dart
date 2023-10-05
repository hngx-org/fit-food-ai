import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BaseViewModel extends ChangeNotifier {
  @visibleForTesting
  @protected
  final NavigationEmitter navigator = NavigationEmitter();
  final Set<dynamic> _disposables = {};

  @protected
  Timer? _debouncer;
  void debounce(Duration duration, VoidCallback action) {
    _debouncer?.cancel();
    _debouncer = Timer(duration, action);
  }


  // @Deprecated(
  //     'Use the `navigator.dispatch` with `NavigationEvent` '
  //         'instead, this gives you '
  //         'more control and access to context'
  // )



  bool disposed = false;



  /// currently disposables can be
  /// [StreamSubscription], [ScrollController]
  void addDisposables(dynamic subscription) {
    _disposables.add(subscription);
  }

  @override
  void dispose() {
    for (final element in _disposables) {
      if (element is StreamSubscription) element.cancel();
      if (element is void Function()) {
        element.call();
      }
      if (element is ScrollController) {
        element.dispose();
      }
    }
    navigator.dispose();
    _debouncer?.cancel();
    disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}

class NavigationEmitter {
  final _subject = StreamController<NavigationEvent<dynamic>>.broadcast();
  Stream<NavigationEvent<dynamic>> get navigationStream => _subject.stream;

  void dispatch<T>(NavigationEvent<T> event) {
    if (!event.isContentHandled && false == _subject.isClosed) {
      _subject.sink.add(event);
    }
  }

  void dispose() {
    _subject.close();
  }
}

abstract class NavigationEvent<T> {
  NavigationEvent();
  bool _contentHandled = false;

  bool get isContentHandled {
    return _contentHandled;
  }

  @mustCallSuper
  Future<T?> navigate(BuildContext context) async {
    _contentHandled = true;
    return this as T;
  }
}


///==============================ViewModelProvider==============================
class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  const ViewModelProvider(
      {required this.create, super.key, this.child, this.builder});

  const factory ViewModelProvider.value(
      {required T value, required Widget child}) = ViewModelProviderValue;

  final Create<T>? create;
  final Widget? child;
  final Widget Function(BuildContext context, T viewModel)? builder;

  Widget _builder(BuildContext context, Widget? child) {
    final viewModel = context.read<T>();
    final subscription =
    viewModel.navigator.navigationStream.listen((event) async {
      if (!event.isContentHandled && context.mounted) {
        await event.navigate(context);
      }
    });
    viewModel.addDisposables(subscription);
    return (null != builder)
        ? builder!.call(context, viewModel)
        : child ?? const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: create!,
      builder: _builder,
      child: child,
    );
  }
}

class ViewModelProviderValue<T extends BaseViewModel>
    extends ViewModelProvider<T> {
  const ViewModelProviderValue(
      {required this.value, required super.child, super.key})
      : super(create: null);

  final T value;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: value, builder: super._builder, child: child);
  }
}

typedef DataBindingBuilder<T, R> = Widget Function(
    BuildContext context, R value, T viewModel
    );

///Factory class to assist in binding specific ui data changes to the view
class AppUiStateBinding {

  AppUiStateBinding._();

  static Selector<T, R> bind<T, R>({
    required R Function(T) value,
    required DataBindingBuilder<T, R> to, Key? key,
  }) {
    return Selector<T, R>(
      key: key,
      selector: (ctx, viewModel) => value(viewModel),
      builder: (ctx, value, _) => to(ctx, value, ctx.read<T>()),
    );
  }
}
