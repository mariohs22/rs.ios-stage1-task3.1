#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if (([numbers count] == 0) || !numbers) return nil;
    NSString *result = @"";
    long cnt = [numbers count];
    for (long i=cnt; i>0; i--) {
        long current = [[numbers objectAtIndex:cnt-i] longValue];
        NSString *sign = (current > 0)? @"+" : @"-";
        if (current>1 || current<-1) {
            if ((i-1) <= 0) {
                result = [result stringByAppendingFormat:@" %@ %ld", sign, labs(current)];
            } else if ((i-1) == 1) {
                result = [result stringByAppendingFormat:@" %@ %ldx", sign, labs(current)];
            } else {
                result = [result stringByAppendingFormat:@" %@ %ldx^%ld", sign, labs(current), i-1];
            }
        } else if (current == 1 || current == -1) {
            result = [result stringByAppendingFormat:@" %@ x", sign];
        }
    }
    if ([result hasPrefix:@" + "]) {
        result = [result substringFromIndex:3];
    } else {
        [result stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@"-"];
    }
    return result;
}
@end
