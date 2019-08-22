#import <UIKit/UIKit.h>
@interface ApolloLongPressGestureRecognizer: UILongPressGestureRecognizer
@end

BOOL tabBarGestureLoaded = NO;

%hook ApolloLongPressGestureRecognizer

- (id)initWithTarget:(id)target action:(SEL)runAction {
    
    //Allow only the first gesture initialization, tabBar is first initialized.
    if(!tabBarGestureLoaded){
        tabBarGestureLoaded = YES;
        return %orig(target, runAction);
    } else {
        return self;
    }

}

%end


%ctor {
	%init(ApolloLongPressGestureRecognizer=objc_getClass("Apollo.ApolloLongPressGestureRecognizer"));
}
