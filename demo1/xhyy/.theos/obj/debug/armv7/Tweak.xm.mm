#line 1 "Tweak.xm"

#import "xhyy.h"


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

@class HsTodayDocSchListBusinessHandler; @class HsTodayDocSchListDataHandler; 
static BOOL (*_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$)(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST, SEL, id); static BOOL _logos_method$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$observeValueForKeyPath$ofObject$change$context$)(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST, SEL, NSString *, id, id, void *); static void _logos_method$_ungrouped$HsTodayDocSchListDataHandler$observeValueForKeyPath$ofObject$change$context$(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST, SEL, NSString *, id, id, void *); static void (*_logos_orig$_ungrouped$HsTodayDocSchListBusinessHandler$todayRegCheckRequest)(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListBusinessHandler* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$HsTodayDocSchListBusinessHandler$todayRegCheckRequest(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListBusinessHandler* _LOGOS_SELF_CONST, SEL); 

#line 4 "Tweak.xm"





















static BOOL _logos_method$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn){
	_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$(self, _cmd, btn);
	return YES;
}
static void _logos_method$_ungrouped$HsTodayDocSchListDataHandler$observeValueForKeyPath$ofObject$change$context$(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListDataHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * arg1, id arg2, id arg3, void * arg4){

}
















static void _logos_method$_ungrouped$HsTodayDocSchListBusinessHandler$todayRegCheckRequest(_LOGOS_SELF_TYPE_NORMAL HsTodayDocSchListBusinessHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	
    Message *message = [[Message alloc]init];
	message.ID = @"3-0-1-5";
	message.number = 100;

    NSObject *scheduleModel = [[[[(NSObject *)self valueForKeyPath:@"context"] valueForKeyPath:@"dataHandler"] valueForKeyPath:@"viewModel"] valueForKeyPath:@"scheduleModel"];
    NSDictionary *dic = @{@"HsAppointmentTypeKey":@1,
                          @"HsSchedulModelKey":scheduleModel
                          };
message.params = dic;
	
MessageCenter
 BOOL rect =  [MessageCenter sendMessage:message];
NSLog(@"%d",rect);

}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$HsTodayDocSchListDataHandler = objc_getClass("HsTodayDocSchListDataHandler"); MSHookMessageEx(_logos_class$_ungrouped$HsTodayDocSchListDataHandler, @selector(isEnableClickBtn:), (IMP)&_logos_method$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$, (IMP*)&_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$isEnableClickBtn$);MSHookMessageEx(_logos_class$_ungrouped$HsTodayDocSchListDataHandler, @selector(observeValueForKeyPath:ofObject:change:context:), (IMP)&_logos_method$_ungrouped$HsTodayDocSchListDataHandler$observeValueForKeyPath$ofObject$change$context$, (IMP*)&_logos_orig$_ungrouped$HsTodayDocSchListDataHandler$observeValueForKeyPath$ofObject$change$context$);Class _logos_class$_ungrouped$HsTodayDocSchListBusinessHandler = objc_getClass("HsTodayDocSchListBusinessHandler"); MSHookMessageEx(_logos_class$_ungrouped$HsTodayDocSchListBusinessHandler, @selector(todayRegCheckRequest), (IMP)&_logos_method$_ungrouped$HsTodayDocSchListBusinessHandler$todayRegCheckRequest, (IMP*)&_logos_orig$_ungrouped$HsTodayDocSchListBusinessHandler$todayRegCheckRequest);} }
#line 68 "Tweak.xm"
