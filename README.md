#ASScrollableMenuBar
ASScrollableMenuBar is a simple custom control, used for contain multiple menu items within menu bar.

##screenshot
![screenshot](http://f.cl.ly/items/273I2h3A3s1M3M371M08/Screen%20Shot%202011-12-23%20at%2010.45.09%20PM.png "screenshot")

##usage
``` objective-c
	ASScrollableMenuBar menuBar = [[ASScrollableMenuBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
	menuBar.delegate = self;
	menuBar.menuItems = [NSArray arrayWithObjects:@"OBJC", @"RUBY", @"JAVASCRIPT",
                              @"PYTHON", @"CSS", @"HTML", @"JAVA",  nil];
```
