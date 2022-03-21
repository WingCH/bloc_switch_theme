import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState.initial()) {
    on<ThemeModeSwitched>(_onThemeModeSwitched);
  }

  void _onThemeModeSwitched(ThemeModeSwitched event, Emitter<ThemeState> emit) {
    ThemeMode newThemeMode = event.themeMode;
    emit(
      ThemeState(themeMode: newThemeMode),
    );
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
