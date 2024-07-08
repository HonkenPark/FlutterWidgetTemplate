import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:widget_template/constants.dart';
import 'package:path/path.dart' as path;

import 'widgets/sign_in/sign_in.dart' as sign_in;
import 'widgets/collapsing_app_bar/collapsing_app_bar.dart' as collapsing_app_bar;
import 'widgets/buttons/buttons.dart' as buttons;
import 'widgets/splash/splash.dart' as splash;
import 'widgets/navigation_rail/navigation_rail.dart' as navigation_rail;
import 'widgets/grid_view/gridview_screen.dart' as gridview;
import 'widgets/tab_bars/tab_bars.dart' as tab_bars;
import 'widgets/sectioned_settings/sectioned_settings.dart' as sectioned_settings;
import 'package:widget_template/widgets/animated_text/animated_text.dart' as animated_text;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    logStackTraceError(details.exceptionAsString(), details.stack);
  };

  runZonedGuarded(() {
    runApp(const Launch());
  }, (error, stackTrace) {
    logStackTraceError(error.toString(), stackTrace);
  });
}

String formatStackTrace(StackTrace stackTrace) {
  List<String> lines = stackTrace.toString().split('\n');
  if (lines.isNotEmpty) {
    List<String> formattedLines = lines.where((line) {
      return line.contains('.dart');
    }).toList();
    if (formattedLines.isNotEmpty) {
      return formattedLines.first;
    }
  }
  return stackTrace.toString();
}

Future<void> logStackTraceError(String error, StackTrace? stackTrace) async {
  String separator = (!kIsWeb && defaultTargetPlatform == TargetPlatform.windows) ? '\\' : '/';
  final exePath = Platform.resolvedExecutable;
  final exeDir = File(exePath).parent.path;
  final logDirectory = Directory(path.join(exeDir, 'log'));
  // if (!(await logDirectory.exists())) {
  //   await logDirectory.create(recursive: true);
  // }
  // String formattedStackTrace = formatStackTrace(stackTrace!);
  // final logFile = File('${logDirectory.path}${separator}error_log.log');
  // final errorMessage = '[${DateFormat('yyyy-MM-dd HH:mm:ss:SSS').format(DateTime.now())}][ERROR][$formattedStackTrace]$error\nStackTrack:\n$stackTrace\n\n';
  // logFile.writeAsStringSync(errorMessage, mode: FileMode.append, flush: true);
  // if (logFile.lengthSync() > maximumLogSize * 1024 * 1024) {
  //   logFile.deleteSync();
  // }
}

class Launch extends StatefulWidget {
  const Launch({super.key});

  @override
  State<Launch> createState() => _LaunchState();
}

/// Currently launch is separated by the [Widget] base,
/// But it will be launched by [Screen] in each [Template].
class _LaunchState extends State<Launch> {
  bool isDarkMode = false;

  void moveToScreen(BuildContext context, String title, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => bodyWidget(title, widget),
      ),
    );
  }

  void backToMain(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: isDarkMode
              ? const ColorScheme.dark(
                  primary: primaryDarkColor,
                )
              : ColorScheme.light(
                  primary: primaryLightColor,
                )),
      home: Scaffold(
        body: Center(
          child: Builder(builder: (ctx) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Set Dark Mode'),
                    Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = value;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(),
                TextButton(
                  child: const Text('Splash Widget'),
                  onPressed: () => moveToScreen(ctx, 'Splash Widget', const splash.Splash()),
                ),
                TextButton(
                  child: const Text('Sign In Widget'),
                  onPressed: () => moveToScreen(ctx, 'Sign In Widget', const sign_in.SignIn()),
                ),
                TextButton(
                  child: const Text('Collapsing App Bar Widget'),
                  onPressed: () => moveToScreen(ctx, 'Collapsing App Bar Widget', const collapsing_app_bar.CollapsingAppbar()),
                ),
                TextButton(
                  child: const Text('Navigation Rail Widget'),
                  onPressed: () => moveToScreen(ctx, 'Navigation Rail Widget', const navigation_rail.NavigationRailWidget()),
                ),
                TextButton(
                  child: const Text('Buttons Widget'),
                  onPressed: () => moveToScreen(ctx, 'Buttons Widget', const buttons.Buttons()),
                ),
                TextButton(
                  child: const Text('GridView Widget'),
                  onPressed: () => moveToScreen(ctx, 'GridView Widget', const gridview.GridViewScreen()),
                ),
                TextButton(
                  child: const Text('TabBar Widget'),
                  onPressed: () => moveToScreen(ctx, 'TabBar Widget', const tab_bars.CustomTabBarsPage()),
                ),
                TextButton(
                  child: const Text('Settings Widget'),
                  onPressed: () => moveToScreen(ctx, 'Settings Widget', const sectioned_settings.SectionedSettingsWidget()),
                ),
                TextButton(
                  child: const Text('Animated Text Widget'),
                  onPressed: () => moveToScreen(ctx, 'Animated Text Widget', const animated_text.AnimatedText()),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

Widget bodyWidget(String title, Widget body) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Center(
      child: body,
    ),
  );
}


// Get.rawSnackbar(
//   duration: const Duration(seconds: 2),
//   backgroundColor: ColorSeed.errorBgSnackBar.color,
//   messageText: Text(
//     'URL링크를 다시 확인해주세요.\n$videoUrl/$videoId',
//     style: const TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
// );