# Running Services Monitor

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-Framework-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
![Platform](https://img.shields.io/badge/Platform-Android-brightgreen)
[![Release](https://img.shields.io/github/v/release/biplobsd/running_services_monitor?label=Release&logo=github)](https://github.com/biplobsd/running_services_monitor/releases)
[![GitHub stars](https://img.shields.io/github/stars/biplobsd/running_services_monitor?style=social)](https://github.com/biplobsd/running_services_monitor/stargazers)
[![GitHub Downloads](https://img.shields.io/github/downloads/biplobsd/running_services_monitor/total?logo=github&label=Downloads)](https://github.com/biplobsd/running_services_monitor/releases)
[![F-Droid Downloads](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fgithub.com%2Fkitswas%2Ffdroid-metrics-dashboard%2Fraw%2Frefs%2Fheads%2Fmain%2Fprocessed%2Fmonthly%2Fme.biplobsd.rsm.json&query=%24.total_downloads&logo=fdroid&label=Downloads&color=blue)](https://f-droid.org/packages/me.biplobsd.rsm/)
[![IzzyOnDroid Downloads](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fdlstats.izzyondroid.org%2Fiod-stats-collector%2Fstats%2Fbasic%2Fyearly%2Frolling.json&query=%24.['me.biplobsd.rsm']&label=IzzyOnDroid%20Downloads&color=blue)](https://apt.izzysoft.de/packages/me.biplobsd.rsm)

Running Services Monitor helps you monitor running services on your Android device.
With a clean and intuitive interface, you can easily view system and user apps, check their status efficiently.

<a href="https://play.google.com/store/apps/details?id=me.biplobsd.rsm"><img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" height="75" alt="Get it on Google Play" align="middle"></a>
<a href="https://apt.izzysoft.de/packages/me.biplobsd.rsm"><img src="https://gitlab.com/IzzyOnDroid/repo/-/raw/master/assets/IzzyOnDroidButtonGreyBorder_nofont.png" height="50" alt="Get it at IzzyOnDroid" align="middle"></a>
<a href="https://f-droid.org/packages/me.biplobsd.rsm"><img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png" height="75" alt="Get it on F-Droid" align="middle"></a>
<a href="https://www.amazon.com/gp/mas/dl/android?p=me.biplobsd.rsm"><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/res/images/amazon-appstore-badge-english-black.png" height="50" alt="Get it on Amazon Appstore" align="middle"></a>
<a href="https://www.openapk.net/running-services-monitor/me.biplobsd.rsm/"><img src="https://www.openapk.net/images/openapk-badge.png" height="75" alt="Get it on OpenAPK" align="middle"></a>
<a href="https://github.com/biplobsd/running_services_monitor/releases/latest"><img src="https://raw.githubusercontent.com/Kunzisoft/Github-badge/4711835e032fe2735dc80c1329beb4685899aa91/get-it-on-github.svg" alt="Download APK" height="75" align="middle"></a>

![Feature Graphic](fastlane/metadata/android/en-US/images/featureGraphic.png)

## Features

- **Monitor Running Services**: View a comprehensive list of all running services on your device.
- **Categorized View**: Easily switch between All, User, and System apps.
- **Search Functionality**: Quickly find specific apps with the built-in search bar.
- **App Details**: Get detailed information about each app, including package name, version, and more.
- **Root & Shizuku Integration**: First checks for root permission, then falls back to Shizuku for advanced system interactions (where supported).
- **Material Design 3**: A modern and beautiful UI that adapts to your device's theme.
- **Dark/Light Mode**: Toggle between dark and light themes for comfortable viewing.
- **Localization**: Support for English, Bangla, Chinese and other languages.

## 📱 Screenshots

> Screenshots are stored in [`fastlane/metadata/android/en-US/images/phoneScreenshots`](fastlane/metadata/android/en-US/images/phoneScreenshots)|

## Requirements

### Essential

- **Android 7.0 (API 24) or higher**
- **Root access** (preferred) OR **Shizuku app** installed and running

### Permissions

- `QUERY_ALL_PACKAGES` - To list all installed apps
- Root permission OR Shizuku permission - The app first checks for root access, then falls back to Shizuku if root is unavailable

## Installation

### Option A: Rooted Device (Recommended)

1. Install the app from any of the sources above
2. When prompted, grant root permission
3. The app will use root access for all operations

### Option B: Non-Rooted Device (Using Shizuku)

#### 1. Install Shizuku

Download and install Shizuku from:

- [Google Play Store](https://play.google.com/store/apps/details?id=moe.shizuku.privileged.api)
- [GitHub Releases](https://github.com/RikkaApps/Shizuku/releases)

#### 2. Start Shizuku Service

##### Wireless Debugging:

1. Enable **Developer Options** on your device
2. Enable **Wireless Debugging** in Developer Options
3. Open Shizuku app
4. Tap **"Pair"** or **"Start"**
5. Follow the on-screen pairing instructions

## How It Works

This app uses root access or Shizuku to execute privileged ADB commands:

1. **Permission Check**: The app first checks for root permission. If root is not available, it falls back to Shizuku
2. **Root Integration**: If rooted, executes commands directly with superuser privileges
3. **Shizuku Integration**: If not rooted, connects to the Shizuku service running on your device
4. **Dumpsys Commands**: Executes `dumpsys activity services` to get running service information
5. **Parsing**: Parses the dumpsys output to extract service details (package name, PID, process name, etc.)
6. **Categorization**: Separates services into System and User categories

## Why Root or Shizuku?

Starting from Android 8.0 (API 26), the `ActivityManager.getRunningServices()` API was deprecated and restricted. Third-party apps can no longer query all running services on the device for privacy and security reasons.

**Root access** provides the most seamless experience:

- Direct access to system commands
- No additional setup required
- Works on all rooted devices

**Shizuku** provides an alternative for non-rooted devices:

- Running a privileged service that can access system APIs
- Allowing apps to execute ADB commands without root
- Working on non-rooted devices via Wireless Debugging (Android 11+) or USB ADB

## Building from Source

```bash
# Clone the repository
git clone https://github.com/biplobsd/running_services_monitor.git
cd running_services_monitor

# Get dependencies
flutter pub get

# Generate code (Freezed models and localization)
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n

# Run on connected device
flutter run

# Build release APK (universal)
flutter build apk --release

# Build release APK (split per ABI for smaller file sizes)
flutter build apk --release --split-per-abi

# Build App Bundle for Play Store
flutter build appbundle --release
```

## Adding New Translations

### Using AI Agent (Recommended)

Use the following prompt with an AI agent to automate the entire process:

```
Add <language> localization to this project:
1. Create app_<localeName>.arb in lib/l10n/ by translating all values from lib/l10n/app_en.arb. Keep the keys unchanged.
2. Add the new locale to AppConstants.supportedLanguages in lib/core/constants.dart
3. Add the locale to android/app/src/main/res/xml/locales_config.xml
4. Run "flutter gen-l10n" and "dart run build_runner build --delete-conflicting-outputs" commands
5. how to create a PR for this change
```

After completion, verify all translations are correct.

### Manual Steps

#### Flutter Part

1. Create a new `app_<localeName>.arb` file in `lib/l10n/` (e.g., `app_es.arb` for Spanish)

2. Translate all fields from `app_en.arb` file to the new language

3. Add the new language to `lib/core/constants.dart`:

   ```dart
   static const List<Lang> supportedLangs = [
     Lang(Locale('en'), 'English'),
     Lang(Locale('bn'), 'বাংলা'),
     Lang(Locale('zh'), '简体中文'),
     Lang(Locale('<localeName>'), '<Native Language Name>'), // Add here
   ];
   ```

4. Run the following command in the project root:
   ```bash
   flutter gen-l10n
   ```

#### Android Part

1. Add the new locale to `android/app/src/main/res/xml/locales_config.xml`:
   ```xml
   <locale android:name="<localeName>" />
   ```

## License

This project is licensed under the [MIT License](LICENSE). Copyright (c) 2025 Biplob Kumar Sutradhar.

## Support

If you find this app useful, consider buying me a coffee:

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/biplobsd)

## Credits

- **Shizuku** by RikkaApps - https://github.com/RikkaApps/Shizuku
- **Flutter** - https://flutter.dev

## Contributors

Thanks to all the amazing people who have contributed to this project!

<a href="https://github.com/biplobsd/running_services_monitor/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=biplobsd/running_services_monitor" />
</a>

## Reviews

[![Top 6 Best Android Privacy Apps You Should Use in 2025 | Stop Tracking, Secure Files & Data](https://img.youtube.com/vi/ykGuJ9J4poo/0.jpg)](https://youtu.be/ykGuJ9J4poo?si=1ERuKMY6YK8FYXs-&t=143)
<br>[**Top 6 Best Android Privacy Apps You Should Use in 2025 | Stop Tracking, Secure Files & Data**](https://youtu.be/ykGuJ9J4poo?si=1ERuKMY6YK8FYXs-&t=143) by [Anurag - The Geek](https://www.youtube.com/@anurag-thegeek)

[![10 APPS DIFERENCIADOS pro seu Android! 🔥 (Dezembro 2025)](https://img.youtube.com/vi/klIFntXWO6E/0.jpg)](https://youtu.be/klIFntXWO6E?si=XRi2NuV9iZ-7sYV_&t=216)
<br>[**10 APPS DIFERENCIADOS pro seu Android! 🔥 (Dezembro 2025)**](https://youtu.be/klIFntXWO6E?si=XRi2NuV9iZ-7sYV_&t=216) by [VegaData](https://www.youtube.com/@VegaData)

[![7 Melhores APLICATIVOS para CELULAR em 2025 #51](https://img.youtube.com/vi/lkVc1B7vN0Q/0.jpg)](https://youtu.be/lkVc1B7vN0Q?si=pwvze4AZL1iDbFQk&t=127)
<br>[**7 Melhores APLICATIVOS para CELULAR em 2025 #51**](https://youtu.be/lkVc1B7vN0Q?si=pwvze4AZL1iDbFQk&t=127) by [ODORIZZI](https://www.youtube.com/@odorizzioficial)

## Star History

<a href="https://www.star-history.com/#biplobsd/running_services_monitor&type=timeline&legend=top-left">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=biplobsd/running_services_monitor&type=timeline&theme=dark&legend=top-left" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=biplobsd/running_services_monitor&type=timeline&legend=top-left" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=biplobsd/running_services_monitor&type=timeline&legend=top-left" />
 </picture>
</a>

## Disclaimer

This app is for informational purposes only. It displays running services but does not modify system behavior. Use responsibly and respect user privacy.

---

**Note**: This app is designed for users who want to monitor running services on their device, similar to the "Running Services" feature that was available in Android Developer Options in older Android versions (before it was hidden in newer versions like HyperOS).
