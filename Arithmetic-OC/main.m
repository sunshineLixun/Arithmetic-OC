//
//  main.m
//  Arithmetic-OC
//
//  Created by lixun on 2017/5/23.
//  Copyright © 2017年 sunshine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#pragma mark - 桶排序
void bucketSort(){
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
		} else {
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
}

#pragma mark - 冒泡排序
void bubbleSort(){
	NSNumber *t;
	NSMutableArray *b = [NSMutableArray array];
	for (NSInteger i = 0; i < 10; i++) {
		NSInteger a = (NSInteger)arc4random()%100;
		[b addObject:@(a)];
	}
	for (NSInteger i = 0; i < b.count - 1; i++) { //n个数排序,只用进行n-1趟
		for (NSInteger j = 0; j < b.count - 1; j++) { //从第1位开始比较直到最后一位尚未归为的数 因为只进行n-1趟排序,所以最后一位则是n-1。
			if (b[j] < b[j + 1]) {
				t = b[j];
				b[j] = b[j+ 1];
				b[j + 1] = t;
			}
		}
	}
	NSLog(@"%@",b);
}

int main(int argc, char * argv[]) {

	@autoreleasepool {
		bubbleSort();
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}





