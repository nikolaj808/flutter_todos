import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/blocs/user/user_bloc.dart';
import 'package:flutter_todos/firebase_options.dart';
import 'package:flutter_todos/repositories/authentication_repository.dart';
import 'package:flutter_todos/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: FlutterTodosObserver(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc()..add(const UserAppInitialized()),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthenticationRepository(),
          ),
        ],
        child: const MaterialApp(
          title: 'Flutter Todos',
          home: SplashPage(),
        ),
      ),
    );
  }
}

class FlutterTodosObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    log(
      'Created',
      name: bloc.runtimeType.toString(),
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    log(
      '$change',
      name: bloc.runtimeType.toString(),
    );
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    log(
      '$event',
      name: bloc.runtimeType.toString(),
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    log(
      'Closed',
      name: bloc.runtimeType.toString(),
    );
  }
}
