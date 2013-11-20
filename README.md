GMInstallation

Generate and store an unique identifier. AppStore-safe. 

Use SSKeychain to store the generated string into it. (https://github.com/soffes/sskeychain - Thanks to Sam Soffes).

To use:

1. Add all clasess to your project
2. Import "GMInstallation.h" into your AppDelegate
3. Call in application:didFinishLaunchingWithOptions: the next method:
    
// Generate unique identifier (installation)
[GMInstallation generateOrLoadUUIDForPreKey:@"PREF_KEY_NAME_TO_STORE_THE_UNIQUE_IDENTIFIER"];
