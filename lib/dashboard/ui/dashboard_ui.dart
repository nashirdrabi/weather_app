import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_reports/constants/constants.dart';
import 'package:weather_reports/dashboard/navigator/dashboard_navigator.dart';
import 'package:weather_reports/dashboard/ui/widgets/dashboard_custom_widget.dart';
import 'package:weather_reports/dashboard/viewmodel/dashboard_viewmodel.dart';

import '../../base/base_state.dart';

class DashboardUi extends StatefulWidget {
  const DashboardUi({super.key});

  @override
  State<DashboardUi> createState() => _DashboardUiState();
}

class _DashboardUiState
    extends BaseState<DashboardUi, DashboardViewmodel, DashboardNavigator>
    implements DashboardNavigator {
  @override
  Widget buildBody() {
    return Column(children: [
      WeatherSearchBar(onSearch: (value) {
        viewModel.getCurrentWeather(location: value);
      }),
      Consumer<DashboardViewmodel>(
        builder: (_, vm, ___) => Expanded(
          child: vm.showLoading
              ? showProgressBar()
              : (vm.weatherDataResponse == null)
                  ? const Center(
                      child: Text("No Data Found"),
                    )
                  : ListView(
                      children: <Widget>[
                        WeatherInfoWidget(
                          iconUrl: vm.iconUrl,
                          weatherType:
                              vm.weatherDataResponse?.current?.condition?.text,
                          cityName: vm.weatherDataResponse?.location?.name,
                          date: vm.weatherDataResponse?.location?.localtime,
                          temperature:
                              vm.weatherDataResponse?.current?.tempC.toString(),
                        ),
                        WeatherDetailsCard(
                          humidity: vm.weatherDataResponse?.current?.humidity
                              .toString(),
                          pressure: vm.weatherDataResponse?.current?.pressureMb
                              .toString(),
                          rainChances:
                              vm.weatherDataResponse?.current?.cloud.toString(),
                          windSpeed: vm.weatherDataResponse?.current?.windKph
                              .toString(),
                        ),
                      ],
                    ),
        ),
      ),
    ]);
  }

  @override
  DashboardNavigator getNavigator() {
    return this;
  }

  @override
  PageIdentifier getPageIdentifier() {
    return PageIdentifier.dashboard;
  }

  @override
  void loadPageData({value}) {
    viewModel.getCurrentLocationAndWeather();
  }
}
