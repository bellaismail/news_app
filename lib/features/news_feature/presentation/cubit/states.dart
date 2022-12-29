abstract class NewsStates{}

class NewsInitState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}

class NewsGetTeslaNewsSuccessState extends NewsStates{}
class NewsGetTeslaNewsErrorState extends NewsStates{}
class NewsGetTeslaNewsLoadingState extends NewsStates{}

class NewsGetAppleNewsSuccessState extends NewsStates{}
class NewsGetAppleNewsErrorState extends NewsStates{}
class NewsGetAppleNewsLoadingState extends NewsStates{}

class NewsGetBusinessNewsSuccessState extends NewsStates{}
class NewsGetBusinessNewsErrorState extends NewsStates{}
class NewsGetBusinessNewsLoadingState extends NewsStates{}

class NewsGetSearchNewsSuccessState extends NewsStates{}
class NewsGetSearchNewsErrorState extends NewsStates{}
class NewsGetSearchNewsLoadingState extends NewsStates{}

class NewChangeThemeModeState extends NewsStates{}
class NewGetThemeModeFromSpState extends NewsStates{}