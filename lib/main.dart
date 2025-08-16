import 'package:sizer/sizer.dart';
import 'package:wonder_shop/Features/auth/data/repos/loginRepoImpl.dart';
import 'package:wonder_shop/core/utils/appRouter.dart';
import 'package:wonder_shop/core/utils/simpleBlocObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/auth/data/dataSources/loginLocalDataSource.dart';
import 'core/utils/functions/setupServiceLocator.dart';

void main() async {
  await Hive.initFlutter();
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  final localDataSource = LoginLocalDataSourceImpl();
  final repository = LoginRepositoryImpl(localDataSource: localDataSource);
  await repository.seedUser();
  runApp(const wonder_shop());
}

class wonder_shop extends StatelessWidget {
  const wonder_shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:  (context, orientation, deviceType) {
     return MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
