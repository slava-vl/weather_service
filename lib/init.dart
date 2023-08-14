import 'domain/services/auth_service.dart';

class InitializeProvider {
  // late final Dio _dio;
  // Dio get dio => _dio;

  // late final ApiClient _apiClient;
  // ApiClient get apiClient => _apiClient;

  late final AuthService _authService;
  AuthService get authService => _authService;

  // late final SearchService _searchService;
  // SearchService get searchService => _searchService;

  // late final AuthService _authService;
  // AuthService get authService => _authService;

  // late final SharedPreferences _sharedPreferences;
  // SharedPreferences get sharedPreferences => _sharedPreferences;

  // late final SessionData _sessionData;
  // SessionData get sessionData => _sessionData;

  // late final UserService _userService;
  // UserService get userService => _userService;

  // late final DialogHandler _dialogHandler;
  // DialogHandler get dialogHandler => _dialogHandler;

  Future<void> initializeApp() async {
    _authService = AuthService();
    // _dialogHandler = DialogHandler();
    // _dio = Dio(
    //   BaseOptions(
    //     sendTimeout: const Duration(seconds: 30),
    //     connectTimeout: const Duration(seconds: 30),
    //     receiveTimeout: const Duration(seconds: 30),
    //   ),
    // );
    // _apiClient = _createApiClient(_dio);
    // _placeService = PlaceService(_apiClient);
    // _searchService = SearchService(_apiClient);
    // _sharedPreferences = await SharedPreferences.getInstance();
    // _sessionData = SessionData(_sharedPreferences);
    // _userService = UserService(_apiClient);
    // _authService = AuthService(_apiClient, _sessionData);
    // _dio.interceptors.add(TokenInterceptor(sessionData: _sessionData, authService: _authService));
  }

  // ApiClient _createApiClient(Dio dio) {
  //   if (kDebugMode) {
  //     dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  //   }
  //   return SafeApiClient(ApiClient(dio));
  // }
}
