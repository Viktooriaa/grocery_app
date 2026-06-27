library;

import 'package:flutter/widgets.dart';

class ProviderScope extends StatelessWidget {
  final Widget child;

  const ProviderScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) => child;
}

abstract class ProviderListenable<T> {
  T read(WidgetRef ref);

  void addListener(VoidCallback listener) {}

  void removeListener(VoidCallback listener) {}
}

class WidgetRef {
  final _ConsumerRefMixin? _owner;

  WidgetRef._(this._owner);

  T watch<T>(ProviderListenable<T> provider) {
    _owner?._listen(provider);
    return provider.read(this);
  }

  T read<T>(ProviderListenable<T> provider) {
    return provider.read(this);
  }
}

class Provider<T> implements ProviderListenable<T> {
  final T Function(WidgetRef ref) _create;

  Provider(this._create);

  @override
  T read(WidgetRef ref) => _create(ref);

  @override
  void addListener(VoidCallback listener) {
    // Stateless Provider нічого не слухає
  }

  @override
  void removeListener(VoidCallback listener) {
    // Stateless Provider нічого не слухає
  }
}

class NotifierProvider<N extends Notifier<T>, T>
    implements ProviderListenable<T> {
  final N Function() _create;
  final Set<VoidCallback> _listeners = {};
  N? _notifier;

  late final NotifierProviderNotifier<N, T> notifier =
      NotifierProviderNotifier<N, T>._(this);

  NotifierProvider(this._create);

  N _getNotifier() {
    final current = _notifier;
    if (current != null) return current;

    final created = _create();
    created._notify = _notify;
    created._state = created.build();
    _notifier = created;
    return created;
  }

  @override
  T read(WidgetRef ref) => _getNotifier().state;

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void _notify() {
    for (final listener in List<VoidCallback>.from(_listeners)) {
      listener();
    }
  }
}

class NotifierProviderNotifier<N extends Notifier<T>, T>
    implements ProviderListenable<N> {
  final NotifierProvider<N, T> _provider;

  NotifierProviderNotifier._(this._provider);

  @override
  N read(WidgetRef ref) => _provider._getNotifier();

  @override
  void addListener(VoidCallback listener) {
    _provider.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _provider.removeListener(listener);
  }
}

abstract class Notifier<T> {
  late T _state;
  late VoidCallback _notify;

  T build();

  T get state => _state;

  set state(T value) {
    _state = value;
    _notify();
  }
}

abstract class ConsumerWidget extends StatefulWidget {
  const ConsumerWidget({super.key});

  Widget build(BuildContext context, WidgetRef ref);

  @override
  State<ConsumerWidget> createState() => _ConsumerWidgetState();
}

class _ConsumerWidgetState extends State<ConsumerWidget>
    with _ConsumerRefMixin {
  @override
  Widget build(BuildContext context) => widget.build(context, ref);
}

abstract class ConsumerStatefulWidget extends StatefulWidget {
  const ConsumerStatefulWidget({super.key});
}

abstract class ConsumerState<T extends ConsumerStatefulWidget> extends State<T>
    with _ConsumerRefMixin {}

mixin _ConsumerRefMixin<T extends StatefulWidget> on State<T> {
  late final WidgetRef ref = WidgetRef._(this);
  final Map<ProviderListenable<dynamic>, VoidCallback> _subscriptions = {};

  void _listen(ProviderListenable<dynamic> provider) {
    if (_subscriptions.containsKey(provider)) return;

    void listener() {
      if (mounted) setState(() {});
    }

    _subscriptions[provider] = listener;
    provider.addListener(listener);
  }

  @override
  void dispose() {
    for (final entry in _subscriptions.entries) {
      entry.key.removeListener(entry.value);
    }
    _subscriptions.clear();
    super.dispose();
  }
}
