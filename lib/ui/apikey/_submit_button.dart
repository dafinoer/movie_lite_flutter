part of 'apikey_screen_page.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiTokenCubit, ApiTokenState>(
      listener: (context, state) {
        if (state is ApiTokenSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Success Save Token')),
          );
          Future.delayed(const Duration(milliseconds: 1000))
              .then((value) => context.go('/home'));
        } else if (state is ApiTokenError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failure save token')),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous is ApiTokenLoading || current is ApiTokenLoading,
      builder: (context, state) {
        if (state is ApiTokenLoading) {
          return ElevatedButton(
            onPressed: null,
            child: Text(
              'Loading...',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }

        return ElevatedButton(
          onPressed: () => onSubmit(context),
          child: Text(
            'Submit',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
    );
  }

  void onSubmit(BuildContext context) {
    final validateApiKey = context.read<ValidationApiKey>()..validate();
    final apiKeyValue = validateApiKey.textApiKey;

    if (!validateApiKey.isInvalidForm && apiKeyValue != null) {
      context.read<ApiTokenCubit>().onSaveApiToken(apiKeyValue);
    }
  }
}
