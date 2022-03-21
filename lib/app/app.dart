import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme_bloc/theme_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        ThemeMode themeMode = state.themeMode;
        return MaterialApp(
          title: 'Flutter Demo',
          theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
          themeMode: themeMode,
          home: const MyHomePage(title: 'Bloc theme switch'),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Column(
              children: <Widget>[
                ...ThemeMode.values.map((themeMode) {
                  return RadioListTile<ThemeMode>(
                    value: themeMode,
                    groupValue: state.themeMode,
                    title: Text(themeMode.name),
                    onChanged: (newThemeMode) {
                      if (newThemeMode != null) {
                        context
                            .read<ThemeBloc>()
                            .add(ThemeModeSwitched(themeMode: newThemeMode));
                      }
                    },
                  );
                }).toList()
              ],
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
