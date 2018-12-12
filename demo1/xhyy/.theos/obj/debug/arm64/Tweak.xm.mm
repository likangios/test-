#line 1 "Tweak.xm"


#import "AVOSCloud.framework/Headers/AVOSCloud.h"
#import <AdSupport/AdSupport.h>

@interface ControlManager : NSObject

@property(nonatomic,assign) NSInteger rate1;
@property(nonatomic,assign) NSInteger rate2;

+ (instancetype)sharInstance;
- (BOOL)vipIsValid;
@end

static ControlManager *shareInstance;

static CGFloat Second_Day = 24 * 60 * 60;

@implementation ControlManager
+ (instancetype) sharInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[ControlManager alloc]init];
    });
    return shareInstance;
}

- (BOOL)vipIsValid{
    NSError *error;
    NSString *name = [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
    AVUser *user = [AVUser logInWithUsername:name password:@"123456" error:&error];
    if (error) {
        return NO;
    }
    user = [AVUser currentUser];
    NSNumber *diff = [user objectForKey:@"diff"];
    NSNumber *rate1 = [user objectForKey:@"rate1"];
    NSNumber *rate2 = [user objectForKey:@"rate2"];

    self.rate1 = rate1.integerValue;
    self.rate2 = rate2.integerValue;

    NSDate *creatData = user.createdAt;
    NSDate *now = [NSDate date];
    if(now.timeIntervalSince1970 > (creatData.timeIntervalSince1970 + diff.intValue * Second_Day )){
        return NO;
    }
    else{
        return YES;
    }
}
@end



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class HsUserSettingViewController; @class HsBaseRequest; @class HsAppointmentSubmitView; @class HsDoctorVisitListDataHandler; @class HsTodayDocSchListDataHandler; @class HsBaseAppDelegate; 
static BOOL (*_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$)(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST, SEL, id); static BOOL _logos_method$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$)(_LOGOS_SELF_TYPE_NORMAL HsBaseRequest* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$(_LOGOS_SELF_TYPE_NORMAL HsBaseRequest* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$HsAppointmentSubmitView$testClick$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL, UIButton *); static void _logos_method$_ungrouped$HsAppointmentSubmitView$YDD_cancelTimer(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$HsAppointmentSubmitView$YDD_resumeTimer(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$HsAppointmentSubmitView$testClick2$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL, UIButton *); static void (*_logos_orig$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$)(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL, NSString *, id, id, void *); static void _logos_method$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL, NSString *, id, id, void *); static void (*_logos_orig$_ungrouped$HsAppointmentSubmitView$loadTableFooterView)(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$HsAppointmentSubmitView$loadTableFooterView(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$HsDoctorVisitListDataHandler$isEnableClickBtn$)(_LOGOS_SELF_TYPE_NORMAL HsDoctorVisitListDataHandler* _LOGOS_SELF_CONST, SEL, id); static BOOL _logos_method$_ungrouped$HsDoctorVisitListDataHandler$isEnableClickBtn$(_LOGOS_SELF_TYPE_NORMAL HsDoctorVisitListDataHandler* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$_ungrouped$HsBaseAppDelegate$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL HsBaseAppDelegate* _LOGOS_SELF_CONST, SEL, id, id); static BOOL _logos_method$_ungrouped$HsBaseAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL HsBaseAppDelegate* _LOGOS_SELF_CONST, SEL, id, id); static NSString * _logos_method$_ungrouped$HsUserSettingViewController$generateTradeNO(_LOGOS_SELF_TYPE_NORMAL HsUserSettingViewController* _LOGOS_SELF_CONST, SEL); static NSError * _logos_method$_ungrouped$HsUserSettingViewController$removeDocumentFile(_LOGOS_SELF_TYPE_NORMAL HsUserSettingViewController* _LOGOS_SELF_CONST, SEL); static NSError * _logos_method$_ungrouped$HsUserSettingViewController$removeLibraryFile(_LOGOS_SELF_TYPE_NORMAL HsUserSettingViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$HsUserSettingViewController$logoutRequest)(_LOGOS_SELF_TYPE_NORMAL HsUserSettingViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$HsUserSettingViewController$logoutRequest(_LOGOS_SELF_TYPE_NORMAL HsUserSettingViewController* _LOGOS_SELF_CONST, SEL); 

#line 55 "Tweak.xm"


static BOOL _logos_method$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn){
    BOOL rect = _logos_orig$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$(self, _cmd, btn);
    if([[ControlManager sharInstance] vipIsValid]){
    return YES;
    }
    else{
    return rect;    
    }

}



































static void _logos_method$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$(_LOGOS_SELF_TYPE_NORMAL HsBaseRequest* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
   if([self isKindOfClass:NSClassFromString(@"HsTodayRegCheckRequest")]){
            
            if([[ControlManager sharInstance] vipIsValid]){
               _logos_orig$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$(self, _cmd, arg1,arg1);
            }
            else{
                _logos_orig$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$(self, _cmd, arg1, arg2);  
            }
    }else{
        _logos_orig$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$(self, _cmd, arg1, arg2);
    }
}



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



@interface HsAppointmentSubmitView :UIView

@property(retain, nonatomic) UIButton *submitBtn; 

@property(retain, nonatomic) UIView *footView;

@property(retain, nonatomic) DDDContext *context;

- (void)actionReg:(id)arg1;
- (void)YDD_cancelTimer;
- (void)YDD_resumeTimer;
@end


static void _logos_method$_ungrouped$HsAppointmentSubmitView$testClick$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * btn){
	btn.selected = !btn.selected;
	UILabel *label = [self viewWithTag:888];
    if(btn.selected){
    label.text = @"0";
    [self YDD_resumeTimer];
    }
    else{
    [self YDD_cancelTimer];
    }
}














dispatch_source_t timer;


static void _logos_method$_ungrouped$HsAppointmentSubmitView$YDD_cancelTimer(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if (timer) {
        dispatch_source_cancel(timer);
    }
}


static void _logos_method$_ungrouped$HsAppointmentSubmitView$YDD_resumeTimer(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    [self YDD_cancelTimer];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    NSInteger rate = [[ControlManager sharInstance] rate1];
    dispatch_source_set_timer(timer,DISPATCH_TIME_NOW,1.0/rate*NSEC_PER_SEC, 0); 
    dispatch_source_set_event_handler(timer, ^{
        [self.context.businessHandler doReg];

            dispatch_async(dispatch_get_main_queue(), ^{
                 UILabel *label = [self viewWithTag:888];
    			label.text = [NSString stringWithFormat:@"%d",label.text.intValue+1];
    		});
    });
    dispatch_resume(timer);
}


static void _logos_method$_ungrouped$HsAppointmentSubmitView$testClick2$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * btn){
    btn.selected = !btn.selected;
    UILabel *label = [self viewWithTag:888];
    if(btn.selected){
    label.text = @"0";
    }
    [self.context.businessHandler doReg];
}

static void _logos_method$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * arg1, id arg2, id arg3, void * arg4){
     UIButton *button = [self viewWithTag:999];
     UIButton *button2 = [self viewWithTag:777];

    if ([arg1 isEqualToString:@"errorModel"]) {
            _logos_orig$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$(self, _cmd, arg1, arg2, arg3, arg4);
            if(button2.isSelected){
       	    
       	    UILabel *label = [self viewWithTag:888];
    		label.text = [NSString stringWithFormat:@"%d",label.text.intValue+1];
            NSInteger rate = [[ControlManager sharInstance] rate2];
            [self.context.businessHandler performSelector:@selector(doReg) withObject:nil afterDelay:1.0/rate];
            }
            else if(button.isSelected){
            
                
                
            }
            else{
            


            }
            













   
    }
    else{
       	button2.selected = NO;
    	button.selected = NO;
    	[self YDD_cancelTimer];
        _logos_orig$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$(self, _cmd, arg1, arg2, arg3, arg4);
    }
}

static void _logos_method$_ungrouped$HsAppointmentSubmitView$loadTableFooterView(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$HsAppointmentSubmitView$loadTableFooterView(self, _cmd);
    if([[ControlManager sharInstance] vipIsValid]){
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button setTitle:@"停止" forState:UIControlStateSelected];
    
    [button setBackgroundColor:[UIColor purpleColor]];
    button.tag = 999;
    button.frame = CGRectMake(20, 100, 100, 40);
    [button addTarget:self action:@selector(testClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];

     UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"捡漏模式" forState:UIControlStateNormal];
    [button2 setTitle:@"停止" forState:UIControlStateSelected];
    [button2 setBackgroundColor:[UIColor orangeColor]];
    
    button2.tag = 777;
    button2.frame = CGRectMake(200, 100, 100, 40);
    [button2 addTarget:self action:@selector(testClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button2];


    UILabel *label = [UILabel new];
    label.text = @"0";
    label.tag = 888;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    
    label.frame = CGRectMake(20, 150, 100, 40);
    [self addSubview:label];
    }
}































static BOOL _logos_method$_ungrouped$HsDoctorVisitListDataHandler$isEnableClickBtn$(_LOGOS_SELF_TYPE_NORMAL HsDoctorVisitListDataHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
	  BOOL rect = _logos_orig$_ungrouped$HsDoctorVisitListDataHandler$isEnableClickBtn$(self, _cmd, arg1);
    if([[ControlManager sharInstance] vipIsValid]){
    return YES;
    }
    else{
    return rect;    
    }
}




static BOOL _logos_method$_ungrouped$HsBaseAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL HsBaseAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2){
 
	 [AVOSCloud setApplicationId:@"IJhTnFwGR17jMSbMchDk1kq8-gzGzoHsz" clientKey:@"SYxHQzNvcBgO2ePUXlyzI7iR"];
    [AVOSCloud clearLastModifyCache];
     NSString *name = [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
    NSError *error;
    [AVUser logInWithUsername:name password:@"123456" error:&error];
    if (error) {
    	 NSLog(@"========login error is %@",error.description);
        if (error.code == 211) {
            AVUser *user = [[AVUser alloc]init];
            user.username = name;
            user.password = @"123456";
            [user signUp:&error];
        }
        NSLog(@"========2login error is %@",error.description);
    }
    else{
    	NSString *nickName = [[UIDevice currentDevice] name];
        [[AVUser currentUser] setObject:nickName forKey:@"phoneName"];
        [[AVUser currentUser] save];

    }
    BOOL rect = _logos_orig$_ungrouped$HsBaseAppDelegate$application$didFinishLaunchingWithOptions$(self, _cmd, arg1, arg2);
    return rect;
}









































@interface HsUserSettingViewController :UIViewController

- (NSString *)generateTradeNO;
- (NSError *)removeDocumentFile;
- (NSError *)removeLibraryFile;
@end



static NSString * _logos_method$_ungrouped$HsUserSettingViewController$generateTradeNO(_LOGOS_SELF_TYPE_NORMAL HsUserSettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    static int kNumber = 32;

    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRST";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

static NSError * _logos_method$_ungrouped$HsUserSettingViewController$removeDocumentFile(_LOGOS_SELF_TYPE_NORMAL HsUserSettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	
	NSError *error = nil;
	NSString *AccountPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/network"];
	[[NSFileManager defaultManager] removeItemAtPath:AccountPath error:&error];
	







	return error;
}

static NSError * _logos_method$_ungrouped$HsUserSettingViewController$removeLibraryFile(_LOGOS_SELF_TYPE_NORMAL HsUserSettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	
	NSError *error;
	NSString *CookiesPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Cookies"];
	[[NSFileManager defaultManager] removeItemAtPath:CookiesPath error:&error];

	






	return error;
}

static void _logos_method$_ungrouped$HsUserSettingViewController$logoutRequest(_LOGOS_SELF_TYPE_NORMAL HsUserSettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
		
	if([[ControlManager sharInstance] vipIsValid]){

		NSHTTPCookieStorage *storae = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    	NSArray *cookies = [storae cookies];
    	for (NSHTTPCookie * cookie in  cookies) {
        	[storae deleteCookie:cookie];
    	}
	       
	     	NSError *error1 = [self removeDocumentFile];
	     	if(!error1){
	     		exit(1);
	     	}
	     	else{
	     	    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"tip" message:error1.description preferredStyle:UIAlertControllerStyleAlert];
    			[alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    			}]];
    		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:NULL];
	     	}
    }
    else{
    	_logos_orig$_ungrouped$HsUserSettingViewController$logoutRequest(self, _cmd);
    }

}












static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$HsTodayDocSchListDataHandler = objc_getClass("HsTodayDocSchListDataHandler"); MSHookMessageEx(_logos_class$_ungrouped$HsTodayDocSchListDataHandler, @selector(isEnableClickBtn:), (IMP)&_logos_method$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$, (IMP*)&_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$);Class _logos_class$_ungrouped$HsBaseRequest = objc_getClass("HsBaseRequest"); MSHookMessageEx(_logos_class$_ungrouped$HsBaseRequest, @selector(startWithSuccessBlock:failureBlock:), (IMP)&_logos_method$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$, (IMP*)&_logos_orig$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$);Class _logos_class$_ungrouped$HsAppointmentSubmitView = objc_getClass("HsAppointmentSubmitView"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$HsAppointmentSubmitView, @selector(testClick:), (IMP)&_logos_method$_ungrouped$HsAppointmentSubmitView$testClick$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$HsAppointmentSubmitView, @selector(YDD_cancelTimer), (IMP)&_logos_method$_ungrouped$HsAppointmentSubmitView$YDD_cancelTimer, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$HsAppointmentSubmitView, @selector(YDD_resumeTimer), (IMP)&_logos_method$_ungrouped$HsAppointmentSubmitView$YDD_resumeTimer, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$HsAppointmentSubmitView, @selector(testClick2:), (IMP)&_logos_method$_ungrouped$HsAppointmentSubmitView$testClick2$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$HsAppointmentSubmitView, @selector(observeValueForKeyPath:ofObject:change:context:), (IMP)&_logos_method$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$, (IMP*)&_logos_orig$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$);MSHookMessageEx(_logos_class$_ungrouped$HsAppointmentSubmitView, @selector(loadTableFooterView), (IMP)&_logos_method$_ungrouped$HsAppointmentSubmitView$loadTableFooterView, (IMP*)&_logos_orig$_ungrouped$HsAppointmentSubmitView$loadTableFooterView);Class _logos_class$_ungrouped$HsDoctorVisitListDataHandler = objc_getClass("HsDoctorVisitListDataHandler"); MSHookMessageEx(_logos_class$_ungrouped$HsDoctorVisitListDataHandler, @selector(isEnableClickBtn:), (IMP)&_logos_method$_ungrouped$HsDoctorVisitListDataHandler$isEnableClickBtn$, (IMP*)&_logos_orig$_ungrouped$HsDoctorVisitListDataHandler$isEnableClickBtn$);Class _logos_class$_ungrouped$HsBaseAppDelegate = objc_getClass("HsBaseAppDelegate"); MSHookMessageEx(_logos_class$_ungrouped$HsBaseAppDelegate, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$_ungrouped$HsBaseAppDelegate$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$_ungrouped$HsBaseAppDelegate$application$didFinishLaunchingWithOptions$);Class _logos_class$_ungrouped$HsUserSettingViewController = objc_getClass("HsUserSettingViewController"); { char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$HsUserSettingViewController, @selector(generateTradeNO), (IMP)&_logos_method$_ungrouped$HsUserSettingViewController$generateTradeNO, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSError *), strlen(@encode(NSError *))); i += strlen(@encode(NSError *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$HsUserSettingViewController, @selector(removeDocumentFile), (IMP)&_logos_method$_ungrouped$HsUserSettingViewController$removeDocumentFile, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSError *), strlen(@encode(NSError *))); i += strlen(@encode(NSError *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$HsUserSettingViewController, @selector(removeLibraryFile), (IMP)&_logos_method$_ungrouped$HsUserSettingViewController$removeLibraryFile, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$HsUserSettingViewController, @selector(logoutRequest), (IMP)&_logos_method$_ungrouped$HsUserSettingViewController$logoutRequest, (IMP*)&_logos_orig$_ungrouped$HsUserSettingViewController$logoutRequest);} }
#line 504 "Tweak.xm"
