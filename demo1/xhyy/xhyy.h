
#import <Foundation/Foundation.h>

@interface Message : NSObject

@property(retain, nonatomic) NSDictionary *params;

@property(nonatomic) unsigned long long number;

@property(copy, nonatomic) NSString *ID;

@end

@interface MessageCenter : NSObject

+ (BOOL)sendMessage:(id)arg1;

@end


