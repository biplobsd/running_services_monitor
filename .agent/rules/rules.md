---
trigger: always_on
---

## Widget rules
1. Don't create widget methods — create a separate class widget file in the `widgets/` folder
2. Don't put multiple classes in one file
3. Don't create private variables (no `_`-prefixed fields in widgets)
4. Don't add comments in code

## State management rules
5. Never use `setState` — use `BlocSelector` or `BlocListener` instead
6. Never use `BlocConsumer` — use `BlocSelector` + `BlocListener` separately
7. Always use `BlocSelector` to read state in `build`; pass specific typed data (not the full state object)
8. Use a record type in `BlocSelector` when you need multiple values from a single bloc

## Localization rules
9. All user-visible text must use localization via `context.loc.*` — no hardcoded strings
10. When adding new localization keys, manually update ALL of the following (Flutter gen-l10n is not available in CI):
    - `lib/l10n/app_en.arb` (source of truth)
    - `lib/l10n/gen/app_localizations.dart` (abstract getter)
    - `lib/l10n/gen/app_localizations_en.dart` (English implementation)
    - All other `lib/l10n/gen/app_localizations_*.dart` locale files
    - `lib/l10n/gen/l10n_keys.dart` (key constants + resolver switch)