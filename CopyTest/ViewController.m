//
//  ViewController.m
//  CopyTest
//
//  Created by Daruo on 2018/7/19.
//  Copyright © 2018年 BeeSmart. All rights reserved.
//

#import "ViewController.h"
#import "Apple.h"
#import "Orange.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //非容器型对象
    NSString * testStr = @"123";
    NSString * copyStr = [testStr copy];// 这里是深拷贝
    NSString * deepCopyStr = [testStr mutableCopy];//深拷贝
    
    NSLog(@"%@-----%@-------%@",testStr,copyStr,deepCopyStr);
    testStr = @"this is new str";
    NSLog(@"%@-----%@-------%@",testStr,copyStr,deepCopyStr);
    NSLog(@"%p----%p-----%p",testStr,copyStr,deepCopyStr);
    
    
    //Apple 类 没有实现NSCopying协议
    Apple *apple01 = [[Apple alloc] initWithColor:@"red" AndTaste:@"sweet"];
    Apple *apple02 =  [[Apple alloc] initWithColor:@"orange" AndTaste:@"sour"];
    NSArray *array = @[apple01,apple02];
    NSArray *array1 = [array copy]; //浅拷贝
    NSMutableArray *array2= [array mutableCopy]; //数组深拷贝 元素浅拷贝
    NSLog(@"%p-----%p------%p",array,array1,array2);
    NSLog(@"\narray---%@\narray1----%@\narray2------%@",array[0],array1[0],array2[0]);
    
    
    //Orange 类 实现了NSCopying协议
    Orange *orange01 = [[Orange alloc] initWithColor:@"red" AndTaste:@"sweet"];
    Orange *orange02 =  [[Orange alloc] initWithColor:@"orange" AndTaste:@"sour"];
    NSArray *array3 = @[orange01,orange02];
    NSArray *array4 = [array3 copy];  //浅拷贝
    NSMutableArray *array5 = [array3 mutableCopy];//深拷贝 但数组元素是浅拷贝
    NSMutableArray *array6 = [[NSMutableArray alloc] initWithArray:array3 copyItems:YES];//深拷贝，且数组元素也是深拷贝
    NSLog(@"%p-----%p------%p-----%p",array3,array4,array5,array6);
    NSLog(@"\narray3---%@\narray4----%@\narray5-----%@\narray6----%@",array3[0],array4[0],array5[0],array6[0]);
    
    
    NSMutableArray *array7 = [NSMutableArray array];
    for (Orange *orange in array3) {
        [array7 addObject:[orange copy]];
    }
    
    NSLog(@"%p----%p",array3,array7);
    NSLog(@"%@---%@",array3[0],array7[0]);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
