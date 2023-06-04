import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:teya/src/core/analytics/app_analytic_event.dart';

class AppAnalytics {
  late FirebaseAnalytics _analytics;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  static final AppAnalytics _instance = AppAnalytics._internal();
  static AppAnalytics get it => AppAnalytics._internal();
  factory AppAnalytics() => _instance;

  AppAnalytics._internal() {
    _initializeFirebaseAnalyticsInstance();
  }

  void _initializeFirebaseAnalyticsInstance() {
    _analytics = FirebaseAnalytics.instance;
  }

  void setScreen({required String screen}) {
    _analytics.setCurrentScreen(screenName: screen);
  }

  void setCurrentUserIdentity(String email) async {
    _analytics.setUserId(id: email);
  }

  void clearIdentity() {
    _analytics.setUserId(id: null);
  }

  void setUserProperty({required String name, String? value}) {
    _analytics.setUserProperty(name: name, value: value);
  }

  void logEvent(AppAnalyticEvent analyticEvents) async {
    try {
      _analytics.logEvent(
        name: analyticEvents.name,
        parameters: analyticEvents.parameters,
      );
    } catch (e, _) {
      debugPrint('Ignoring error: $e');
    }
  }
}
