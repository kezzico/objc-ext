#import <Foundation/Foundation.h>

typedef void (^code)();
typedef void (^callback)(NSError *error, id obj);
typedef id (^mapper)(id obj);
