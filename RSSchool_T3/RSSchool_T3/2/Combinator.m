#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    if (!array || [array count] != 2) {return nil;}
    unsigned long long n = [[array objectAtIndex:1] longLongValue];
    unsigned long long m = [[array objectAtIndex:0] longLongValue];
    for (unsigned long long k=0; k<=n; k++) {
        if (binomial(n, k) == m) return [NSNumber numberWithLongLong:k];
    }
    return nil;
}

unsigned long long binomial(unsigned long long n, unsigned long long k) {
    unsigned long long c = 1, i;
    if (k > n-k) // take advantage of symmetry
        k = n-k;
    for (i = 1; i <= k; i++, n--) {
        if (c/i > UINT_MAX/n) // return 0 on overflow
            return 0;
        c = c / i * n + c % i * n / i;  // split c * n / i into (c / i * i + c % i) * n / i
    }
    return c;
}

@end
