import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../commons/commons.dart';
import '../constants/constants.dart';
import '../di/service_locator.dart';
import 'base_navigator.dart';
import 'base_view_model.dart';

abstract class BaseState<W extends StatefulWidget, VM extends BaseViewModel,
    N extends BaseNavigator> extends State<W> implements BaseNavigator {
  final VM viewModel = serviceLocator<VM>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget buildBody();

  N getNavigator();
  PreferredSize? buildAppBar() {
    return null;
  }

  PageIdentifier getPageIdentifier();

  Widget? buildendDrawerScreen() {
    return null;
  }

  Color? setBackgroundColor() {
    return Colors.white;
  }

  void loadPageData({dynamic value});

  Future<bool> provideOnWillPopScopeCallBack() async {
    return Future.value(true);
  }

  @override
  void initState() {
    viewModel.setNavigator(getNavigator());
    loadPageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            key: scaffoldKey,
            endDrawer: buildendDrawerScreen(),
            appBar: buildAppBar(),
            backgroundColor:
                setBackgroundColor() ?? HexColor.fromHex("#FBFBFB"),
            body: ChangeNotifierProvider.value(
              value: viewModel,
              child: SafeArea(child: buildBody()),
            )),
      );

  void push({required Widget widget}) {
    Navigator.of(context)
        .push(MaterialPageRoute(
          builder: (context) => widget,
        ))
        .then((value) => loadPageData(value: value));
  }

  Widget showProgressBar({bool? reduceSize}) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }

  @override
  void showMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      final snackBar = SnackBar(
        content: Wrap(
          children: [
            const Icon(
              Icons.error,
              size: 18,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              message,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 120, left: 20, right: 20),
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: Colors.red.shade700,
        duration: const Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
