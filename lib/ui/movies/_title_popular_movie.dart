part of 'movies_screen_page.dart';

class _TitlePopularMovie extends StatelessWidget {
  const _TitlePopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0, left: 16.0),
      child: Text(
        'Popular Movie',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
