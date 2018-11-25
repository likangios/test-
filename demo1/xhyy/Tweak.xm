
//#import "xhyy.h"

%hook HsTodayDocSchListDataHandler

// Hooking a class method
/*
+ (id)sharedInstance {
	return %orig;
}
*/

// Hooking an instance method with an argument.
/*
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}
*/

- (BOOL)isEnableClickBtn:(id)btn{
	%orig;
	return YES;
}

// Hooking an instance method with no arguments.
/*
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}
*/
%end



/*
%hook HsTodayDocSchListBusinessHandler
- (void)todayRegCheckRequest{
	//%orig;
    Message *message = [[Message alloc]init];
	message.ID = @"3-0-1-5";
	message.number = 100;

    NSObject *scheduleModel = [[[[(NSObject *)self valueForKeyPath:@"context"] valueForKeyPath:@"dataHandler"] valueForKeyPath:@"viewModel"] valueForKeyPath:@"scheduleModel"];
    NSDictionary *dic = @{@"HsAppointmentTypeKey":@1,
                          @"HsSchedulModelKey":scheduleModel
                          };
message.params = dic;
	
 BOOL rect =  [MessageCenter sendMessage:message];
NSLog(@"%d",rect);

}

%end
*/

%hook HsBaseRequest
- (void)startWithSuccessBlock:(id)arg1 failureBlock:(id)arg2
{
   if([self isKindOfClass:NSClassFromString(@"HsTodayRegCheckRequest")]){
        %orig(arg1,arg1);
    }
    else{
	%orig;
    }
}
%end





@interface DDDDataHandler:NSObject

@property(retain, nonatomic) NSObject *viewModel; 

@end


@interface DDDBusinessHandler:NSObject

- (void)doReg;

@end

@interface DDDContext:NSObject

@property(readonly, nonatomic) DDDBusinessHandler *businessHandler; 
@property(readonly, nonatomic) DDDDataHandler *dataHandler; 

@end

%hook HsAppointmentSubmitView

@interface HsAppointmentSubmitView :UIView

@property(retain, nonatomic) UIButton *submitBtn; 

@property(retain, nonatomic) UIView *footView;

@property(retain, nonatomic) DDDContext *context;

- (void)actionReg:(id)arg1;

@end

%new
- (void)testClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    UILabel *label = [self viewWithTag:888];
    if(btn.selected){
    label.text = @"0";
    }

        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        if(version.intValue < 3.0){
            for(int i = 0;i<10;i++){
                //[self actionReg:self.submitBtn];
                [self.context.businessHandler doReg];
            }
    		//[self performSelector:@selector(actionReg:) withObject:self.submitBtn afterDelay:0];
        }
}

- (void)observeValueForKeyPath:(NSString *)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4{
     UIButton *button = [self viewWithTag:999];
    UILabel *label = [self viewWithTag:888];
    label.text = [NSString stringWithFormat:@"%d",label.text.intValue+1];
    if ([arg1 isEqualToString:@"errorModel"]) {
            %orig;
        if (button.isSelected) {

  			NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        	if(version.intValue < 3.0){
                            [self.context.businessHandler doReg];
                  //  [self actionReg:self.submitBtn];
    			//[self performSelector:@selector(actionReg:) withObject:self.submitBtn afterDelay:0];
        }   }
    }
    else{
    	button.selected = NO;
        %orig;
    }
}
- (void)loadTableFooterView
{

	%orig;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始挂号" forState:UIControlStateNormal];
    [button setTitle:@"停止" forState:UIControlStateSelected];
    [button setBackgroundColor:[UIColor orangeColor]];
    button.tag = 999;
    button.frame = CGRectMake(20, 100, 100, 40);
    [button addTarget:self action:@selector(testClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];

    UILabel *label = [UILabel new];
    label.text = @"0";
    label.tag = 888;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(20, 150, 100, 40);
    [self addSubview:label];

}
%end




