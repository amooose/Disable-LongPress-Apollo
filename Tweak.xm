#import <UIKit/UIKit.h>

@interface ApolloLongPressGestureRecognizer: UILongPressGestureRecognizer
@end


%hook ApolloLongPressGestureRecognizer

- (id)initWithTarget:(id)target action:(SEL)runAction {
    return self;
}

%end


%ctor {
	%init(ApolloLongPressGestureRecognizer=objc_getClass("Apollo.ApolloLongPressGestureRecognizer"));
}
