#include "Machine.h"

int main() {
    @autoreleasepool {
        Machine *m = [[Machine alloc] init];

        NSError *anyError;
        BOOL success = [m misuseVector:&anyError];
        if(!success) {
            NSLog(@"The Machine had an error: %@", anyError);
        }
    }

    return 0;
}