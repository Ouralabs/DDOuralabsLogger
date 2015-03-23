# DDOuralabsLogger

## Requirements

DDOuralabsLogger requires that [Ouralabs](http://www.ouralabs.com) is integrated.

## Dependencies

- [Ouralabs](https://www.ouralabs.com)

## Installation

DDOuralabsLogger is available through [CocoaPods](http://cocoapods.org). To install
it, add the following line to your Podfile:

    pod "DDOuralabsLogger"

In your app delegate, add the Ouralabs logger to CocoaLumberjack. This logger simply forwards logs to the Ouralabs.

```objective-c
[DDLog addLogger:[DDOuralabsLogger sharedInstance] withLevel:DDLogLevelAll];
```

To use the dynamic log levels, see the CocaoLumberjack [documentation](https://github.com/CocoaLumberjack/CocoaLumberjack/blob/master/Documentation/DynamicLogLevels.md)

Use the following code to determine what log level should be applied.

```objective-c
[Ouralabs setSettingsChangedBlock:^(BOOL liveTail, OULogLevel logLevel) {
    // Set the appropriate log level based on logLevel.
}];
```

The settingsChangedBlock gets called every time Ouralabs detects that there is a settings change. Settings can be changed either from the Ouralabs dashboard or the sdk itself.

## Author

Ouralabs, support@ouralabs.com

## License

DDOuralabsLogger is available under the MIT license. See the LICENSE file for more info.
