import 'package:get/get.dart';

import '../pages/admin/bindings/admin_binding.dart';
import '../pages/admin/views/admin_view.dart';
import '../pages/bookingPage/bindings/booking_page_binding.dart';
import '../pages/bookingPage/views/booking_page_view.dart';
import '../pages/home/bindings/home_binding.dart';
import '../pages/home/views/home_view.dart';
import '../pages/login/bindings/login_binding.dart';
import '../pages/login/views/login_view.dart';
import '../pages/signUp/bindings/sign_up_binding.dart';
import '../pages/signUp/views/sign_up_view.dart';
import '../pages/venueDetails/bindings/venue_details_binding.dart';
import '../pages/venueDetails/views/venue_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: Routes.VENUE_DETAILS,
      page: () => const VenueDetailsView(),
      binding: VenueDetailsBinding(),
    ),
    GetPage(
      name: Routes.BOOKING_PAGE,
      page: () => BookingPageView(),
      binding: BookingPageBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}
