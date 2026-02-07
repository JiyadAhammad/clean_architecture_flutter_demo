import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class CacheInterceptor extends Interceptor {
  static DioCacheInterceptor create() {
    final CacheOptions cacheOptions = CacheOptions(
      store: MemCacheStore(),
      hitCacheOnErrorCodes: <int>[500, 502, 503, 504],
      hitCacheOnNetworkFailure: true,
      maxStale: const Duration(days: 7),
    );

    return DioCacheInterceptor(options: cacheOptions);
  }
}
