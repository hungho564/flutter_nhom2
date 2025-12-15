// bai thuc hanh ngay 22/10/2025
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF5B86E5),
      ),
      home: const MyWelcome(),
    );
  }
}

class MyWelcome extends StatelessWidget {
  const MyWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications), 
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.extension), 
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style.copyWith(height: 1.05),
                    children: [
                      TextSpan(
                        text: 'Welcome,\n',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 80,
                            ),
                      ),
                      TextSpan(
                        text: 'Charlie',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.w200,
                              fontSize: 80,
                            ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    filled: true,
                    fillColor: cs.surface, 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: cs.primary.withOpacity(0.35), 
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: cs.primary, 
                        width: 1.6,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 100),

                Text(
                  'Saved Places',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                ),

                const SizedBox(height: 8),

                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    _PlaceCard(image: AssetImage('assets/photo-1.png')),
                    _PlaceCard(image: AssetImage('assets/photo-2.png')),
                    _PlaceCard(image: AssetImage('assets/photo-3.png')),
                    _PlaceCard(image: AssetImage('assets/photo-4.png')),
                  ],
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildPlaceCard(String assetPath, {VoidCallback? onTap}) {
  return _PlaceCard(image: AssetImage(assetPath), onTap: onTap);
}

class _PlaceCard extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback? onTap;
  const _PlaceCard({required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12), 
      child: AspectRatio(
        aspectRatio: 16 / 10, 
        child: Ink.image(
          image: image, 
          fit: BoxFit.cover,
          child: InkWell(onTap: onTap ?? () {}),
        ),
      ),
    );
  }
}
