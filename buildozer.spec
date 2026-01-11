[app]
# (str) Title of your application
title = QuestFund

# (str) Package name
package.name = questfund

# (str) Package domain (needed for android/ios packaging)
package.domain = org.yourname

# (str) Source code where the main.py lives
source.dir = .

# (list) Source files to include (let's include everything)
source.include_exts = py,png,jpg,kv,atlas

# (str) Application version
version = 0.1

# (list) Application requirements
# plyer is needed for the Guardian Engine (accelerometer)
requirements = python3,kivy,plyer,requests

# (str) Custom source folders for requirements
# (list) Garden requirements
# (str) Presplash of the application
# (str) Icon of the application
# icon.filename = %(source.dir)s/data/icon.png

# (list) Supported orientations
orientation = portrait

# (list) Permissions
# These are CRITICAL for the Guardian Engine and Ads
android.permissions = INTERNET, ACCESS_NETWORK_STATE, VIBRATE, BODY_SENSORS

# (int) Target Android API, should be as high as possible.
android.api = 31

# (int) Minimum API your APK will support.
android.minapi = 21

# (str) Android logcat filters to use
android.logcat_filters = *:S python:D

# (str) The Android arch to build for
android.archs = arm64-v8a, armeabi-v7a

# (bool) indicates whether the screen should stay on
# Useful for ADHD users so the screen doesn't dim during a quest
android.wakelock = True

[buildozer]
# (int) Log level (0 = error only, 1 = info, 2 = debug (with command output))
log_level = 2

# (int) Display warning if buildozer is run as root (0 = off, 1 = on)
warn_on_root = 1
