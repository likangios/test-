#line 1 "Tweak.xm"




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

@class HsBaseRequest; @class HsTodayDocSchListDataHandler; @class HsAppointmentSubmitView; 
static BOOL (*_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$)(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST, SEL, id); static BOOL _logos_method$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$)(_LOGOS_SELF_TYPE_NORMAL HsBaseRequest* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$(_LOGOS_SELF_TYPE_NORMAL HsBaseRequest* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$HsAppointmentSubmitView$testClick$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL, UIButton *); static void (*_logos_orig$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$)(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL, NSString *, id, id, void *); static void _logos_method$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL, NSString *, id, id, void *); static void (*_logos_orig$_ungrouped$HsAppointmentSubmitView$loadTableFooterView)(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$HsAppointmentSubmitView$loadTableFooterView(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST, SEL); 

#line 4 "Tweak.xm"





















static BOOL _logos_method$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn){
	_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$(self, _cmd, btn);
	return YES;
}







































static void _logos_method$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$(_LOGOS_SELF_TYPE_NORMAL HsBaseRequest* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
   if([self isKindOfClass:NSClassFromString(@"HsTodayRegCheckRequest")]){
        _logos_orig$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$(self, _cmd, arg1,arg1);
    }
    else{
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

@end


static void _logos_method$_ungrouped$HsAppointmentSubmitView$testClick$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * btn){
    btn.selected = !btn.selected;
    UILabel *label = [self viewWithTag:888];
    if(btn.selected){
    label.text = @"0";
    }
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        if(version.intValue < 3.0){
            for(int i = 0;i<3;i++){
                
                [self.context.businessHandler doReg];
            }
    		
        }
}

static void _logos_method$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * arg1, id arg2, id arg3, void * arg4){
     UIButton *button = [self viewWithTag:999];
    UILabel *label = [self viewWithTag:888];
    label.text = [NSString stringWithFormat:@"%d",label.text.intValue+1];
    label.text = [NSString stringWithFormat:@"%d",label.text.intValue+1];
    

    if ([arg1 isEqualToString:@"errorModel"]) {
            _logos_orig$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$(self, _cmd, arg1, arg2, arg3, arg4);
        if (button.isSelected) {

  			NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        	if(version.intValue < 3.0){
                            [self.context.businessHandler doReg];
                  
    			
        }   }
    }
    else{
    	button.selected = NO;
        _logos_orig$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$(self, _cmd, arg1, arg2, arg3, arg4);
    }
}

static void _logos_method$_ungrouped$HsAppointmentSubmitView$loadTableFooterView(_LOGOS_SELF_TYPE_NORMAL HsAppointmentSubmitView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$_ungrouped$HsAppointmentSubmitView$loadTableFooterView(self, _cmd);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button setTitle:@"停止" forState:UIControlStateSelected];
    
    [button setBackgroundColor:[UIColor purpleColor]];
    button.tag = 999;
    button.frame = CGRectMake(20, 100, 100, 40);
    [button addTarget:self action:@selector(testClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];

    UILabel *label = [UILabel new];
    label.text = @"0";
    label.tag = 888;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.hidden = YES;
    label.frame = CGRectMake(100, 150, 100, 40);
    [self addSubview:label];

}





static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$HsTodayDocSchListDataHandler = objc_getClass("HsTodayDocSchListDataHandler"); MSHookMessageEx(_logos_class$_ungrouped$HsTodayDocSchListDataHandler, @selector(isEnableClickBtn:), (IMP)&_logos_method$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$, (IMP*)&_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$);Class _logos_class$_ungrouped$HsBaseRequest = objc_getClass("HsBaseRequest"); MSHookMessageEx(_logos_class$_ungrouped$HsBaseRequest, @selector(startWithSuccessBlock:failureBlock:), (IMP)&_logos_method$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$, (IMP*)&_logos_orig$_ungrouped$HsBaseRequest$startWithSuccessBlock$failureBlock$);Class _logos_class$_ungrouped$HsAppointmentSubmitView = objc_getClass("HsAppointmentSubmitView"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$HsAppointmentSubmitView, @selector(testClick:), (IMP)&_logos_method$_ungrouped$HsAppointmentSubmitView$testClick$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$HsAppointmentSubmitView, @selector(observeValueForKeyPath:ofObject:change:context:), (IMP)&_logos_method$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$, (IMP*)&_logos_orig$_ungrouped$HsAppointmentSubmitView$observeValueForKeyPath$ofObject$change$context$);MSHookMessageEx(_logos_class$_ungrouped$HsAppointmentSubmitView, @selector(loadTableFooterView), (IMP)&_logos_method$_ungrouped$HsAppointmentSubmitView$loadTableFooterView, (IMP*)&_logos_orig$_ungrouped$HsAppointmentSubmitView$loadTableFooterView);} }
#line 186 "Tweak.xm"
