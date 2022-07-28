import 'package:flutter/material.dart';
import './injection.dart' as di;
import 'package:device_preview/device_preview.dart';
import 'package:m_core/m_core.dart';
import 'package:m_search/m_search.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(
      DevicePreview(
          enabled: true, builder: (context) => const MyApp())
  );
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SearchUsersCubit>(
            create: (context) => di.locator<SearchUsersCubit>(),
          ),
          BlocProvider<SearchIssuesCubit>(
            create: (context) => di.locator<SearchIssuesCubit>(),
          ),
          BlocProvider<SearchRepoCubit>(
            create: (context) => di.locator<SearchRepoCubit>(),
          ),
        ],
        child: MaterialApp(
          title: 'Sejuta Cita',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(title: 'Sejuta Cita'),
        );
    );
  }
}

