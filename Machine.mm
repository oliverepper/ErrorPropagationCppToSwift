#include <stdexcept>
#include "Vector.hpp"
#include "Machine.h"

@implementation Machine

- (BOOL)misuseVector:(NSError **)errorPtr
{
    Vector v{2};

    BOOL success = YES;

    try
    {
        v[2] = 100;
    }
    catch(std::out_of_range& ex)
    {
        if(errorPtr) {
            NSString *domain = @"de.oliver-epper.Vector";
            NSString *desc = NSLocalizedString([[NSString alloc] initWithUTF8String:ex.what()], @"");
            NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : desc };

            *errorPtr = [NSError errorWithDomain:domain
                                            code:1
                                        userInfo:userInfo];    
        }

        success = NO;
    }

    return success;
}
@end