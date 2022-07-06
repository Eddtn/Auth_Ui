/// this is the server url
// const String BaseUrl = "https://ravenlivestream-api.com/";
const String BaseUrl = "http://kudel-reamp.herokuapp.com";

class ApiRoute {
  // base url
  /// this is used as a place holder incase
  /// base url needs to be added while creating routes
  // static const String _BaseUrl = "";

  // static const String _BaseUrl = "http://192.168.43.153:8080";

  ///? === route that ends with "/" need an id or something to append to it

  ////====================================
  //===========AUTHENTICATION=================//
  ////====================================

  static const String login = "/api/v1/auth/login";
  static const String emailVerification = "/api/auth/send/verification/email/";
  static const String otpVerificationCheck = "api/auth/verify/email/";
  // "/api/v1/onboarding/email_onboarding_check";
  static const String register = "/api/v1/onboarding/complete";

  ////====================================
  //===========Events=================//
  ////====================================
  static const String getForYouEvent = "/api/v1/events/for_you";
  static const String getTrendingEvent = "/api/v1/events/trending";
  static const String getEventByCategory = "/api/v1/events/categories";
  static String getUserEvent(String userId) => "/api/v1/users/$userId/events";
  static String getUserWishlist(String userId) =>
      "/api/v1/users/$userId/wish_list";
  ////====================================
  //===========Tickets=================//
  ////====================================
  static String getCurrentTickets(String userId) =>
      "/api/v1/users/$userId/subscriptions";

  ////====================================
  //===========Apartment=================//
  ////====================================
  static String GetApartment({required String apartmentId}) =>
      "/api/apartment/$apartmentId";
  static const String GetApartments = "/api/vendorApartment/";
  static const String GetTours = "/api/tour/";
  static const String GetAvailableApartments = "/api/apartments";
  static String UpdateApartmentAvailability(
          {required String id, required String apartmentId}) =>
      "/api/apartments/$id/availability/$apartmentId/update";
  static String CancelTour({required String id, required String tourId}) =>
      "/api/tour/users/$id/event/$tourId/cancel";
}
