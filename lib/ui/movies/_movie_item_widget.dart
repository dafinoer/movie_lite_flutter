part of 'movies_screen_page.dart';

class _MovieItemWidget extends StatelessWidget {
  const _MovieItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    this.desc,
  });

  final String imageUrl;
  final String title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        height: 150.0,
        width: double.infinity,
        child: Row(
          children: [
            _ImageItem(imageUrl: imageUrl),
            Expanded(
              child: _ContentText(
                title: title,
                desc: desc,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageItem extends StatelessWidget {
  const _ImageItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: 100.0,
      height: 200.0,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          image: DecorationImage(image: imageProvider),
        ),
      ),
    );
  }
}

class _ContentText extends StatelessWidget {
  const _ContentText({super.key, required this.title, this.desc});

  final String title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              desc ?? 'No Description',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}
