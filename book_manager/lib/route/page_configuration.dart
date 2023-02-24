class PageConfiguration {
  final String path;

  const PageConfiguration._(this.path);

  factory PageConfiguration.home() => const PageConfiguration._('/');
  factory PageConfiguration.settings() =>
      const PageConfiguration._('/settings');
  factory PageConfiguration.about() => const PageConfiguration._('/about');

  bool get isHome => path == '/';
  bool get isSettings => path == '/settings';
  bool get isAbout => path == '/about';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageConfiguration &&
          runtimeType == other.runtimeType &&
          path == other.path;

  @override
  int get hashCode => path.hashCode;
}
