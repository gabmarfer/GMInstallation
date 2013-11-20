**GMInstallation**
==================

Generate and store an unique identifier. AppStore-safe. 

Use SSKeychain to store the generated string into it. (https://github.com/soffes/sskeychain - Thanks to Sam Soffes).

**Usage**
-----------------

- Add all clasess to your project
- Import "GMInstallation.h" into your AppDelegate
- Call in application:didFinishLaunchingWithOptions: the next method:

```objc  
// Generate unique identifier (installation)

[GMInstallation generateOrLoadUUIDForPreKey:@"PREF_KEY_NAME_TO_STORE_THE_UNIQUE_IDENTIFIER"];
```
