import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/utils/images.dart';
import 'package:new_app/features/news_feature/presentation/cubit/states.dart';
import 'package:new_app/features/news_feature/presentation/screens/business_screen/business_screen.dart';
import 'package:new_app/features/news_feature/presentation/screens/setting_screen/setting_screen.dart';
import 'package:new_app/core/sahred/local_data_helper/cache_helper.dart';
import '../../../../core/sahred/remote_data_helper/dio_helper.dart';
import '../screens/apple_screen/apple_news_screen.dart';
import '../screens/tesla_screen/tesla_news_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);

  List<dynamic> businessList = [];
  List<dynamic> appleList = [];
  List<dynamic> teslaList = [];
  List<dynamic> searchList = [];

  ThemeMode themeMode = ThemeMode.light;
  int currentIndex = 0;
  List bodyList = const <Widget>[
    BusinessScreen(),
    AppleScreen(),
    TeslaScreen(),
    SettingScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavIconList = [
    BottomNavigationBarItem(
        icon: Image.asset(
          AppImages.businessImage,
          width: 25,
          height: 25.0,
        ),
        label: "business".toUpperCase()),
    BottomNavigationBarItem(
        icon: Image.asset(
          AppImages.appleImage,
          width: 25,
          height: 25.0,
        ),
        label: "Apple".toUpperCase()),
    BottomNavigationBarItem(
        icon: Image.asset(
          AppImages.teslaImage,
          width: 25,
          height: 25.0,
        ),
        label: "Tesla".toUpperCase()),
    BottomNavigationBarItem(
        icon: Image.asset(
          AppImages.settingImage,
          width: 25,
          height: 25.0,
        ),
        label: "setting".toUpperCase()),
  ];
  changeBottomNav(index) {
    currentIndex = index;
    if (index == 1) {
      getAppleNews();
    } else if (index == 2) {
      getTeslaNews();
    } else if (index == 3) {
      //setting state
    }
    emit(NewsBottomNavState());
  }

  getTeslaNews() {
    emit(NewsGetTeslaNewsLoadingState());
    if (teslaList.isEmpty) {
      try {
        DioHelper.getData(url: '/v2/everything', queryMap: {
          'q': 'tesla',
          'from': '2022-12-28',
          'sortBy': 'publishedAt',
          'apiKey': '69e6adda29d94cb8a2bbade87d3b4726',
        })
            .then((value) => {
                  teslaList = value.data['articles'],
                  emit(NewsGetTeslaNewsSuccessState()),
                })
            .catchError((onError) {
          emit(NewsGetTeslaNewsErrorState());
        });
      } catch (e) {
        emit(NewsGetTeslaNewsErrorState());
      }
    }
  }

  getAppleNews() {
    emit(NewsGetAppleNewsLoadingState());
    if (appleList.isEmpty) {
      try {
        DioHelper.getData(url: '/v2/everything', queryMap: {
          'q': 'apple',
          'from': '2022-12-27',
          'to': '2022-12-27',
          'sortBy': 'popularity',
          'apiKey': '69e6adda29d94cb8a2bbade87d3b4726',
        })
            .then((value) => {
                  print('*** ${value.data} ***'),
                  appleList = value.data['articles'],
                  emit(NewsGetAppleNewsSuccessState()),
                })
            .catchError((onError) {
          emit(NewsGetAppleNewsErrorState());
        });
      } catch (e) {
        emit(NewsGetAppleNewsErrorState());
      }
    }
  }

  getBusinessNews() {
    emit(NewsGetBusinessNewsLoadingState());
    if (businessList.isEmpty) {
      try {
        DioHelper.getData(url: '/v2/top-headlines', queryMap: {
          'country': 'us',
          'category': 'business',
          'apiKey': '69e6adda29d94cb8a2bbade87d3b4726',
        })
            .then((value) => {
                  businessList = value.data['articles'],
                  emit(NewsGetBusinessNewsSuccessState()),
                })
            .catchError((onError) {
          emit(NewsGetBusinessNewsErrorState());
        });
      } catch (e) {
        emit(NewsGetBusinessNewsErrorState());
      }
    }
  }

  void changeThemeMode(val) {
    if (!val) {
      CacheHelper.setThemeMode("themeMode", true);
      getThemeFromSP();
    } else {
      CacheHelper.setThemeMode("themeMode", false);
      getThemeFromSP();
    }
    emit(NewChangeThemeModeState());
  }

  void getThemeFromSP() {
    themeMode = CacheHelper.getThemeFromSP("themeMode") == true
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(NewGetThemeModeFromSpState());
  }

  void changeWillSearching({search}) {
    emit(NewsGetSearchNewsLoadingState());
    try {
      DioHelper.getData(url: '/v2/everything', queryMap: {
        'q': '$search',
        'from': '2022-12-27',
        'to': '2022-12-27',
        'sortBy': 'popularity',
        'apiKey': '69e6adda29d94cb8a2bbade87d3b4726',
      }).then((value) {
        searchList = value.data["articles"];
        emit(NewsGetSearchNewsSuccessState());
      }).catchError((onError) {
        emit(NewsGetSearchNewsErrorState());
      });
    } catch (e) {
      emit(NewsGetSearchNewsErrorState());
    }
  }
}
