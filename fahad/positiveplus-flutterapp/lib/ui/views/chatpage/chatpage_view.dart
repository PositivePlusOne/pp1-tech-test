import 'package:flutter/material.dart';
import 'package:positiveplus/ui/widgets/custom_appbar_widget.dart';
import 'package:stacked/stacked.dart';

import 'chatpage_viewmodel.dart';

class ChatpageView extends StackedView<ChatpageViewModel> {
  ChatpageView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget builder(
    BuildContext context,
    ChatpageViewModel viewModel,
    Widget? child,
  ) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFf6f6ec),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: CustomAppBar(size: size, scaffoldKey: scaffoldKey),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFFf6f6ec),
          child: const Center(
            child: Text(
              "Chat Page",
              style: TextStyle(
                fontFamily: "AlbertSans",
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  ChatpageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatpageViewModel();
}
