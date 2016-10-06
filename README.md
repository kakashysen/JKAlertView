<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS%207%2B-blue.svg?style=flat-square" alt="Platform: iOS 7+" />
    <img src="https://img.shields.io/badge/language-Obj--C-orange.svg" alt="Language: Objective C" />
    <img src="https://img.shields.io/badge/pod-0.2-green.svg?style=flat-square" alt="CocoaPods compatible" />
    <img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat-square" alt="License: MIT" />
</p>

# JKAlertView

**JKAlertView** is a simple and beautiful alert view, you can use it to show remote notifications  or whatever you want.

![](https://github.com/kakashysen/JKAlertView/blob/master/demo.gif)

## Compatibility

**JKAlertView** requires iOS 7+ and is compatible with iPhone 4 and later.

### CocoaPods

Installation for [CocoaPods](https://cocoapods.org) is simple enough:

    pod 'JKAlertView'

And `import "JKAlertView.h"` in the files you would like to use it.


## Usage

You only need to create a JKAlertView instance and set the needes values.

```objectivec
    JKAlertView *alertView = [[JKAlertView alloc] initWithFontName:@"verdana"];
    alertView.headerImage = [UIImage imageNamed:@"bg_img.jpg"];
    alertView.titleText = @"The Git";
    alertView.detailText = @"Is a version control system that is used for software development and other version control tasks.";
    alertView.linkText = @"git-scm";
    alertView.url = @"https://git-scm.com/";
    alertView.footerText = @"Wikipedia";
    [alertView show];
```

### Properties

* `headerImage` **(requiered)** The header image in the top of the alert, minimum size is 270x155. You can use large images long as you keep the aspect ratio 54:31.
* `titleText` **(requiered)** The text of the title alert, maximum 32 characters .
* `detailText` **(requiered)** The body or content text of the alert, maximum 200 characters.
* `titleTextColor` (optional) The text color of the title.
* `detailTextColor` (optional) The text color of the detail.
* `linkText` (optional) The text of the link.
* `linkTextColor` (optional) The text color of the link.
* `url` (optional) The string url of the link.
* `footerText` (optional) The text of the footer.




