//
//  main.m
//  Arithmetic-OC
//
//  Created by lixun on 2017/5/23.
//  Copyright © 2017年 sunshine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
	@autoreleasepool {
		
#pragma mark - 桶排序
		NSArray *b = @[@5,@2,@3,@1,@8];
		NSMutableArray *a = @[].mutableCopy;
		
		//初始化数组a中所有元素都为0
		for (NSInteger i = 0; i <= 10; i++) {
			a[i] = @0;
		}
		
		//遍历b中所有元素 当出现数组a中出现b中元素 数组a的这个元素就+1
		for (NSNumber *num in b) {
			
			NSInteger index = [num integerValue];
			//index = 5,2,3,1,8
			
			if (a[index]) {
				a[index] = @([a[index] integerValue] + 1);
			}else{
				a[index] = @0;
			}
			
		}
		
		//遍历数组a
		for (NSInteger i = 10; i < a.count; i --) {
			//找到数组a中被增加的元素
			if ([a[i] integerValue] > 0) {
				NSLog(@"%ld",i);
			}
		}
		
		
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
