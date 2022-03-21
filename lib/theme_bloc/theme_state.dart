part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState({
    required this.themeMode,
  });

  const ThemeState.initial() : this(themeMode: ThemeMode.system);

  @override
  List<Object> get props => [themeMode];
}
