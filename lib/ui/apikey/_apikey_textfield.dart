part of 'apikey_screen_page.dart';

class _ApiKeyTextField extends StatefulWidget {
  const _ApiKeyTextField({super.key});

  @override
  State<_ApiKeyTextField> createState() => _ApiKeyTextFieldState();
}

class _ApiKeyTextFieldState extends State<_ApiKeyTextField> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(
      () {
        context.read<ValidationApiKey>().onChangeText =
            textEditingController.text;
      },
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isError = context.watch<ValidationApiKey>().isInvalidForm;

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        errorText: isError ? 'Form not valid' : null,
        suffixIcon: IconButton(
            onPressed: () {
              textEditingController.text = "";
            },
            icon: const Icon(Icons.close)),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
