import 'package:flutter/material.dart';

class WeatherInfoWidget extends StatelessWidget {
  final String? cityName;
  final String? date;
  String? iconUrl;
  final String? temperature;
  final String? weatherType;

  WeatherInfoWidget(
      {super.key,
      this.cityName,
      this.date,
      this.iconUrl,
      this.temperature,
      this.weatherType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            cityName ?? "N/A",
            style: const TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            date ?? "N/A",
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(iconUrl ?? ""),
              const SizedBox(width: 20),
              Text(
                temperature ?? "N/A",
                style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            weatherType ?? "N/A",
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class WeatherDetailsCard extends StatelessWidget {
  final String? windSpeed;
  final String? rainChances;
  final String? humidity;
  final String? pressure;
  const WeatherDetailsCard(
      {super.key,
      this.windSpeed,
      this.rainChances,
      this.humidity,
      this.pressure});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      color: Colors.blueAccent.shade100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.air, color: Colors.white, size: 30),
                    const SizedBox(height: 10),
                    const Text(
                      'Wind',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      windSpeed ?? "N/A", // Example wind data
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // Rain Information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.water_drop, color: Colors.white, size: 30),
                    const SizedBox(height: 10),
                    const Text(
                      'Rain',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      rainChances ?? "N/A", // Example rain data
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Humidity Information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.thermostat, color: Colors.white, size: 30),
                    const SizedBox(height: 10),
                    const Text(
                      'Humidity',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      humidity ?? "N/A",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // Pressure Information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.compress, color: Colors.white, size: 30),
                    const SizedBox(height: 10),
                    const Text(
                      'Pressure',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      pressure ?? "N/A", // Example pressure data
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const WeatherSearchBar({super.key, required this.onSearch});

  @override
  _WeatherSearchBarState createState() => _WeatherSearchBarState();
}

class _WeatherSearchBarState extends State<WeatherSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Enter city name...",
            prefixIcon: const Icon(Icons.search, color: Colors.blue),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _controller.clear();
                    },
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          ),
          onSubmitted: (query) {
            widget.onSearch(query); // Call the search function
          },
        ),
      ),
    );
  }
}
