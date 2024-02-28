import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jdih_bumn/bloc/get_peraturan_hukum/get_peraturan_hukum_bloc.dart';
import 'package:jdih_bumn/bloc/get_produk_hukum/get_produk_hukum_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_berita/get_berita_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_disclaimer/get_disclaimer_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_faq/get_faq_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_infografis/get_infografis_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_peraturan/get_peraturan_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_peraturan_populer.dart/get_peraturan_populer_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_peraturan_terbaru/get_peraturan_terbaru_bloc.dart';

import 'package:jdih_bumn/bloc/stage/get_putusan/get_putusan_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_struktur_jdih/get_struktur_jdih_bloc.dart';
import 'package:jdih_bumn/bloc/stage/get_tentang_jdih/get_tentang_jdih_bloc.dart';
import 'package:jdih_bumn/cubit/get_page_peraturan/get_page_peraturan_cubit.dart';
import 'package:jdih_bumn/data/datasources/peraturan_hukum_datasource.dart';
import 'package:jdih_bumn/data/datasources/produk_hukum_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/berita_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/disclaimer_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/faq_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/infografis_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_populer_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_terbaru_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/putusan_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/struktur_jdih_datasource.dart';
import 'package:jdih_bumn/data/datasources/stage/tentang_jdih_datasource.dart';
import 'package:jdih_bumn/data/repositories/peraturan_paging_repository.dart';
import 'package:jdih_bumn/presentation/splash_screen_lottie/splash_screen_lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  // BlocOverrides.runZoned(() => runApp(const MyApp()),
  //     blocObserver: AppBlocObserver());
  //https://www.youtube.com/watch?v=CNUBhb_cM6E
  //https://pub.dev/packages/flutter_launcher_icons

  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null) 
      .then((_) => runApp(const MyApp()));
  //lock potrait only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));

  Bloc.observer = GlobalBlocObserver();
  //runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PeraturanPagingRepository repository;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetPeraturanHukumBloc(PeraturanHukumDatasource()),
          //child: Container(),
        ),
        //error this buildcontext doesnt include provider solusinya
        //pasang blocprovidernya
        BlocProvider(
          create: (context) => GetProdukHukumBloc(ProdukHukumDataSource()),
        ),
        BlocProvider(
          create: (context) => GetTentangJdihBloc(TentangJdihDatasource()),
        ),
        BlocProvider(create: (context) => GetFaqBloc(FaqDatasource())),
        BlocProvider(
          create: (context) => GetPutusanBloc(PutusanDatasource()),
        ),
        BlocProvider(
          create: (context) => GetInfografisBloc(InfografisDatasource()),
        ),
        BlocProvider(
          create: (context) => GetStrukturJdihBloc(StrukturJdihDatasource()),
        ),
        BlocProvider(
          create: (context) => GetDisclaimerBloc(DisclaimerDatasource()),
        ),
        BlocProvider(
          create: (context) => GetBeritaBloc(BeritaDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetPeraturanPopulerBloc(PeraturanPopulerDatasource()),
        ),
        BlocProvider(
          create: (context) => GetPeraturanBloc(PeraturanDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetPeraturanTerbaruBloc(PeraturanTerbaruDatasource()),
        ),
        BlocProvider(
          create: (context) => GetPagePeraturanCubit(
              PeraturanPagingRepository(PeraturanDatasource())),
        ),
      ],
      child: MaterialApp(
        title: 'JDIH BUMN',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,

          ///here
        ),
        //homescreen yang ada bottom navbar
        //home: const KamusHukumScreen(),
        //home: const PeraturanScreen(),
        home: const SplashScrenLottie(),
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
      ),
    );
  }
}

class AppBlocObserver extends BlocObserver {
  ///We can run something, when we create our Bloc
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    ///We can check, if the BlocBase is a Bloc or a Cubit
    if (bloc is Cubit) {
      print("This is a Cubit");
    } else {
      print("This is a Bloc");
    }
  }

  ///We can react to events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print("an event Happened in $bloc the event is $event");
  }

  ///We can even react to transitions
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    /// With this we can specifically know, when and what changed in our Bloc
    print(
        "There was a transition from ${transition.currentState} to ${transition.nextState}");
  }

  ///We can react to errors, and we will know the error and the StackTrace
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(
        "Error happened in $bloc with error $error and the stacktrace is $stackTrace");
  }

  ///We can even run something, when we close our Bloc
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print("BLOC is closed");
  }
}

class GlobalBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('${bloc.runtimeType} $event', name: 'Test log');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('${bloc.runtimeType} $change', name: 'Test log');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('${bloc.runtimeType} $transition', name: 'Test log');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('${bloc.runtimeType} $error $stackTrace', name: 'Test log');
  }
}
