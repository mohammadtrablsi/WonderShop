import 'package:dio/dio.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/Features/auth/data/repos/loginRepoImpl.dart';
import 'package:wonder_shop/Features/home/domain/entities/book_entity.dart';
import 'package:wonder_shop/constants.dart';
import 'package:wonder_shop/core/utils/api_service.dart';
import 'package:wonder_shop/core/utils/app_router.dart';
import 'package:wonder_shop/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/auth/data/dataSources/loginLocalDataSource.dart';
import 'core/utils/functions/setup_service_locator.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();
  // ✅ Create local data source
  var dio=Dio();
  final apiService=ApiService(dio);
  final localDataSource = LoginLocalDataSourceImpl(apiService);
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
        // theme: ThemeData.dark().copyWith(
        //   // scaffoldBackgroundColor: kPrimaryColor,
        //   // textTheme:
        //   // GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        // ),
      );
    });
  }
}
