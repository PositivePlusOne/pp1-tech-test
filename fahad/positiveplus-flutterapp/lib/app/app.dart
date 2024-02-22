import 'package:positiveplus/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:positiveplus/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:positiveplus/ui/views/home/home_view.dart';
import 'package:positiveplus/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:positiveplus/ui/views/navbar/navbar_view.dart';
import 'package:positiveplus/services/api_service.dart';
import 'package:positiveplus/ui/views/searchpage/searchpage_view.dart';
import 'package:positiveplus/ui/views/chatpage/chatpage_view.dart';
import 'package:positiveplus/ui/views/guidance/guidance_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: NavbarView),
    MaterialRoute(page: SearchpageView),
    MaterialRoute(page: ChatpageView),
    MaterialRoute(page: GuidanceView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
