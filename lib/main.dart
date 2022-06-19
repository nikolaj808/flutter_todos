import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/blocs/user/user_bloc.dart';
import 'package:flutter_todos/firebase_options.dart';
import 'package:flutter_todos/repositories/authentication_repository.dart';
import 'package:flutter_todos/repositories/todos_repository.dart';
import 'package:flutter_todos/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  const AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  const TodosRepository todosRepository = TodosRepository();

  BlocOverrides.runZoned(
    () => runApp(
      const App(
        authenticationRepository: authenticationRepository,
        todosRepository: todosRepository,
      ),
    ),
    blocObserver: FlutterTodosObserver(),
  );
}

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  final TodosRepository todosRepository;

  const App({
    super.key,
    required this.authenticationRepository,
    required this.todosRepository,
  });

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
          RepositoryProvider.value(
            value: authenticationRepository,
          ),
          RepositoryProvider.value(
            value: todosRepository,
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
