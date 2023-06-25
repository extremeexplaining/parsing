#import "Stak.h"

@implementation Stak


-(id)init {
    self=[super init];
    if (self!=nil) {
        _stackArray = [[NSMutableArray alloc] init];
    }
    return self;
}

// reverse the array
-(id)initWithReversedArray:(NSArray *)arr {
    self=[super init];
    if (self!=nil) {
        arr = [[arr reverseObjectEnumerator] allObjects];
        _stackArray = [arr mutableCopy];
    }
    return self;
}


#pragma mark - Push

-(void)push:(id)object {
    [self push:object at:0];
}

-(void)push:(id)object at:(int)i {
    int maxIndex = (int) _stackArray.count;
    int index = maxIndex - i;
    
    if (index < 0 || !object) {
        return;
    }
    
    [_stackArray insertObject:object atIndex:index];
}

-(void)press:(id)object {
    [_stackArray insertObject:object atIndex:0];
}

#pragma mark - Pop

-(id)pop {
    return [self popAt:0];
}

-(id)plop {
    int maxIndex = (int) _stackArray.count - 1;
    return [self popAt:maxIndex];
}

-(id)popAt:(int)i {
    int maxIndex = (int) _stackArray.count - 1;
    int index = maxIndex - i;
    
    if (index < 0) {
        return nil;
    }
    
    id object = _stackArray[index];
    [_stackArray removeObjectAtIndex:index];
    return object;
}


#pragma mark - Peek

-(id)peek {
    return [self peekAt:0];
}

-(id)peekAt:(int)i {
    int maxIndex = (int) _stackArray.count - 1;
    int index = maxIndex - i;
    
    if (index < 0) {
        return nil;
    }
    
    id object = _stackArray[index];
    return object;
}


#pragma mark - General

-(BOOL)empty {
    return (_stackArray.count < 1);
}

-(void)flush {
    [_stackArray removeAllObjects];
}

-(int)count {
    return (int) _stackArray.count;
}


#pragma mark - Description

-(NSString *)description {
    if(_stackArray == nil){
        return @"Stack Error";
    }
    
    NSString *result = @"";
    
    if([_stackArray count] == 0){
        return @"Stack is empty";
    }
    
    for (int i=0; i<[_stackArray count]; i++) {
       // NSString *str = _stackArray[i]; // gotcha this is a node and not a string!
        NSString *str = [NSString stringWithFormat:@"%@", _stackArray[i]];
        result = [result stringByAppendingString:str];
        result = [result stringByAppendingString:@" "];
    }
    
    if (result.length > 2) {
        result = [result stripLastChar];
    }
    
    return result;
}

@end
