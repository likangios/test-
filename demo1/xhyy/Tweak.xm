
//#import "xhyy.h"
#import "AVOSCloud.framework/Headers/AVOSCloud.h"
#import <AdSupport/AdSupport.h>

@interface ControlManager : NSObject

@property(nonatomic,assign) NSInteger rate1;
@property(nonatomic,assign) NSInteger rate2;
@property(nonatomic,strong) NSString *username;
@property(nonatomic,strong) NSString *phoneName;

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
    NSString *username = [user objectForKey:@"username"];
    NSString *phoneName = [user objectForKey:@"phoneName"];
    self.rate1 = rate1.integerValue;
    self.rate2 = rate2.integerValue;
    self.username = username;
    self.phoneName = phoneName;

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


%hook HsTodayDocSchListDataHandler

- (BOOL)isEnableClickBtn:(id)btn{
    BOOL rect = %orig;
    if([[ControlManager sharInstance] vipIsValid]){
    return YES;
    }
    else{
    return rect;    
    }

}

// Hooking a class method
/*
+ (id)sharedInstance {
	return %orig;
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
            
            if([[ControlManager sharInstance] vipIsValid]){
               %orig(arg1,arg1);
            }
            else{
                %orig;  
            }
    }else{
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
- (void)YDD_cancelTimer;
- (void)YDD_resumeTimer;
@end

@interface HsRegisterModel:NSObject

@property(readonly, nonatomic) NSString *deptName; 
@property(readonly, nonatomic) NSString *docName; 
@property(readonly, nonatomic) NSString *patName; 
@property(readonly, nonatomic) NSString *phoneNo; 
@property(readonly, nonatomic) NSNumber *cost; 
@property(readonly, nonatomic) NSString *expectDate; 
@property(readonly, nonatomic) NSString *expectTime; 
@property(readonly, nonatomic) NSString *createTime; 


@end

@interface HsAppointmentSubmitViewModel:NSObject

@property(readonly, nonatomic) HsRegisterModel *registerModel; 

@end

%new
- (void)testClick:(UIButton *)btn{
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

/*
- (void)testClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    UILabel *label = [self viewWithTag:888];
    if(btn.selected){
    label.text = @"0";
    }
        for(int i = 0;i<3;i++){
                [self.context.businessHandler doReg];
        }
}
*/

dispatch_source_t timer;

%new
- (void)YDD_cancelTimer{
    if (timer) {
        dispatch_source_cancel(timer);
    }
}

%new
- (void)YDD_resumeTimer{
    [self YDD_cancelTimer];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    NSInteger rate = [[ControlManager sharInstance] rate1];
    dispatch_source_set_timer(timer,DISPATCH_TIME_NOW,1.0/rate*NSEC_PER_SEC, 0); //每秒执行5次
    dispatch_source_set_event_handler(timer, ^{
        [self.context.businessHandler doReg];

            dispatch_async(dispatch_get_main_queue(), ^{
                 UILabel *label = [self viewWithTag:888];
    			label.text = [NSString stringWithFormat:@"%d",label.text.intValue+1];
    		});
    });
    dispatch_resume(timer);
}

%new
- (void)testClick2:(UIButton *)btn{
    btn.selected = !btn.selected;
    UILabel *label = [self viewWithTag:888];
    if(btn.selected){
    label.text = @"0";
    }
    [self.context.businessHandler doReg];
}

- (void)observeValueForKeyPath:(NSString *)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4{
     UIButton *button = [self viewWithTag:999];
     UIButton *button2 = [self viewWithTag:777];

    if ([arg1 isEqualToString:@"errorModel"]) {
            %orig;
            if(button2.isSelected){
       	    //捡漏 
       	    UILabel *label = [self viewWithTag:888];
    		label.text = [NSString stringWithFormat:@"%d",label.text.intValue+1];
            NSInteger rate = [[ControlManager sharInstance] rate2];
            [self.context.businessHandler performSelector:@selector(doReg) withObject:nil afterDelay:1.0/rate];
            }
            else if(button.isSelected){
            //抢
                //[self.context.businessHandler performSelector:@selector(doReg) withObject:nil afterDelay:0.2];
                //[self.context.businessHandler doReg];
            }
            else{
            //正常


            }
            /*
            if([[[[arg2 valueForKeyPath:@"errorModel"] valueForKeyPath:@"userInfo"] valueForKeyPath:@"msg"] isEqualToString:@"该就诊人已有一个预约申请正在处理中,请耐心等待"]){
                 button.selected = NO;
            }
            else{
                if (button.isSelected) {
                    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
                    if(version.intValue < 3.0){
                            [self.context.businessHandler doReg];
                    }   
                }

            }
            */
   
    }
    else{

    /*
@property(readonly, nonatomic) NSString *deptName; 
@property(readonly, nonatomic) NSString *docName; 
@property(readonly, nonatomic) NSString *patName; 
@property(readonly, nonatomic) NSString *phoneNo; 
@property(readonly, nonatomic) NSNumber *cost; 
@property(readonly, nonatomic) NSString *expectDate; 
@property(readonly, nonatomic) NSString *expectTime; 
@property(readonly, nonatomic) NSString *createTime; 

@property(readonly, nonatomic) HsRegisterModel *registerModel; 
    */
        HsAppointmentSubmitViewModel *model = (HsAppointmentSubmitViewModel *)arg2;
        NSString *deptName = model.registerModel.deptName;
        NSString *docName = model.registerModel.docName;
        NSString *patName = model.registerModel.patName;
        NSString *phoneNo = model.registerModel.phoneNo;
        NSString *expectDate = model.registerModel.expectDate;
        NSNumber *cost = model.registerModel.cost;
        NSString *expectTime = model.registerModel.expectTime;
        NSString *createTime = model.registerModel.createTime;
    NSString *des = [NSString stringWithFormat:@"%@:%@:%@:%@:%@:%@:%@:%d",deptName,docName,patName,phoneNo,expectDate,expectTime,createTime,cost.intValue];
        AVObject *testObject = [AVObject objectWithClassName:@"RecordObject"];
        NSString *username = [[ControlManager sharInstance] username];
        NSString *phoneName = [[ControlManager sharInstance] phoneName];
        [testObject setObject:username forKey:@"username"];
        [testObject setObject:phoneName forKey:@"phoneName"];
        [testObject setObject:des forKey:@"des"];
        [testObject save];
       	button2.selected = NO;
    	button.selected = NO;
    	[self YDD_cancelTimer];
        %orig;
    }
}
- (void)loadTableFooterView
{
	%orig;
    if([[ControlManager sharInstance] vipIsValid]){
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button setTitle:@"停止" forState:UIControlStateSelected];
    //[button setBackgroundColor:[UIColor orangeColor]];
    [button setBackgroundColor:[UIColor purpleColor]];
    button.tag = 999;
    button.frame = CGRectMake(20, 100, 100, 40);
    [button addTarget:self action:@selector(testClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];

     UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"捡漏模式" forState:UIControlStateNormal];
    [button2 setTitle:@"停止" forState:UIControlStateSelected];
    [button2 setBackgroundColor:[UIColor orangeColor]];
    //[button setBackgroundColor:[UIColor purpleColor]];
    button2.tag = 777;
    button2.frame = CGRectMake(200, 100, 100, 40);
    [button2 addTarget:self action:@selector(testClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button2];


    UILabel *label = [UILabel new];
    label.text = @"0";
    label.tag = 888;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    //label.hidden = YES;
    label.frame = CGRectMake(20, 150, 100, 40);
    [self addSubview:label];
    }
}
%end

/*
%hook UIViewController
- (void)viewWillAppear:(BOOL)animated{
    %orig;
     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"tip" message:NSStringFromClass(self.class) preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:NULL];
}
%end

%hook  AFSecurityPolicy
- (BOOL)evaluateServerTrust:(SecTrustRef)serverTrust
                  forDomain:(NSString *)domain
{
    BOOL rect = %orig;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"tip" message:rect?@"rect=YES":@"rect=NO" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:NULL];
    return rect;
}
%end
*/
%hook  HsDoctorVisitListDataHandler
- (BOOL)isEnableClickBtn:(id)arg1{
	  BOOL rect = %orig;
    if([[ControlManager sharInstance] vipIsValid]){
    return YES;
    }
    else{
    return rect;    
    }
}
%end

%hook HsBaseAppDelegate

- (BOOL)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2{
 
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
    BOOL rect = %orig;
    return rect;
}
%end


//HsSessionOBJ sessionOBJUnicode

// 切换账号登录

/*
%hook HsSessionOBJ
- (NSString *)sessionOBJUnicode{

	NSString *cacheUnicode =[[NSUserDefaults standardUserDefaults] objectForKey:@"tempUnicode"];
    if (cacheUnicode.length) {
        return cacheUnicode;
    }
    else{
        return  %orig;
    }

}
%end

%hook HsNetworkProxy
- (NSString *)unicode{

	NSString *cacheUnicode =[[NSUserDefaults standardUserDefaults] objectForKey:@"tempUnicode"];
    if (cacheUnicode.length) {
        return cacheUnicode;
    }
    else{
        return  %orig;
    }

}
%end

*/


%hook HsUserSettingViewController

@interface HsUserSettingViewController :UIViewController

- (NSString *)generateTradeNO;
- (NSError *)removeDocumentFile;
- (NSError *)removeLibraryFile;
@end

%new
- (NSString *)generateTradeNO
{
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
%new
- (NSError *)removeDocumentFile{
	
	NSError *error = nil;
	NSString *AccountPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/network"];
	[[NSFileManager defaultManager] removeItemAtPath:AccountPath error:&error];
	/*
	NSString *AccountPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/network"];
	NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:AccountPath];
	NSError *error;
	for (NSString *fileName in enumerator) {
    	[[NSFileManager defaultManager] removeItemAtPath:[AccountPath stringByAppendingPathComponent:fileName] error:&error];
	}
	*/
	return error;
}
%new
- (NSError *)removeLibraryFile{
	
	NSError *error;
	NSString *CookiesPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Cookies"];
	[[NSFileManager defaultManager] removeItemAtPath:CookiesPath error:&error];

	/*
	NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:CookiesPath];
	NSError *error = nil;
	for (NSString *fileName in enumerator) {
    	[[NSFileManager defaultManager] removeItemAtPath:[CookiesPath stringByAppendingPathComponent:fileName] error:&error];
	}
	*/
	return error;
}

- (void)logoutRequest{
		
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
    	%orig;
    }

}
%end











