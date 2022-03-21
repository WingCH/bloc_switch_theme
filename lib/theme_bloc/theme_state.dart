part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState({
    required this.themeMode,
  });

  const ThemeState.initial() : this(themeMode: ThemeMode.system);

  ThemeState.fromJson(Map<String, dynamic> json)
      : themeMode = ThemeMode.values.byName(json['themeMode']);

  Map<String, dynamic>? toJson() {
    return {'themeMode': themeMode.name};
  }

  @override
  List<Object> get props => [themeMode];
}
