//
//  main.m
//  Arithmetic-OC
//
//  Created by lixun on 2017/5/23.
//  Copyright © 2017年 sunshine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

static inline NSMutableArray *kGetArray(){
	NSMutableArray *b = [NSMutableArray array];
	for (NSInteger i = 0; i < 10; i++) {
		NSInteger a = (NSInteger)arc4random()%100;
		[b addObject:@(a)];
	}
	return b;
}


#pragma mark - 桶排序
NSArray *bucketsort(NSArray *list){

	NSMutableArray *a = @[].mutableCopy;
	NSMutableArray *c = [NSMutableArray array];
	
	//初始化数组a中所有元素都为0
	for (NSInteger i = 0; i <= 10; i++) {
		a[i] = @0;
	}
	
	//遍历b中所有元素 当出现数组a中出现b中元素 数组a的这个元素就+1
	for (NSNumber *num in list) {
		
		NSInteger index = [num integerValue];
		//index = 5,2,3,1,8
		
		if (a[index]) {
			a[index] = @([a[index] integerValue] + 1);
		} else {
			a[index] = @0;
		}
		
	}
	
	//遍历数组a
	
	//从大到小
//	for (NSInteger i = 10; i < a.count; i --) {
//		//找到数组a中被增加的元素
//		if ([a[i] integerValue] > 0) {
//			[c addObject:@(i)];
//		}
//	}
	
	//从小到大
	for (NSInteger i = 0; i <= 10; i++) {
		if ([a[i] integerValue] > 0) {
			[c addObject:@(i)];
		}
	}
	
	if (c.count > 0) {
		return c;
	} else {
		return nil;
	}
}



#pragma mark - 冒泡排序
NSArray *bubblesort(NSMutableArray *list){
	NSNumber *t;
	for (NSInteger i = 0; i < list.count - 1; i++) { //n个数排序,只用进行n-1趟
		for (NSInteger j = 0; j < list.count - 1; j++) { //从第1位开始比较直到最后一位尚未归为的数 因为只进行n-1趟排序,所以最后一位则是n-1。
			if (list[j] > list[j + 1]) {
				t = list[j];
				list[j] = list[j+ 1];
				list[j + 1] = t;
			}
		}
	}
	return list;
}


NSArray *quicksort(NSMutableArray *array, NSInteger left, NSInteger right){
	
	if (left > right) {
		return nil;
	}

	//temp 基准数
	NSInteger temp = [array[left] integerValue];
	NSInteger t = 0;
	
	while (left != right) {
		//从右向左找
		while ([array[right] integerValue] > temp && left < right) {
			right --;
		}
		
		//从左向右找
		while ([array[left] integerValue] < temp && left < right) {
			left ++;
		}
		
		//未相遇
		if (left < right) {
			//交换位置
			t = [array[left] integerValue];
			array[left] = array[right];
			array[right] = @(t);
		}
	}
	
	//left == right 确定基准数位置
	array[left] = @(temp);
	
	//递归
	//处理基准数左边数据
	quicksort(array, left, left - 1);
	//处理基准数右边数据
	quicksort(array, left + 1, right);
	
	return array;
	
}



int main(int argc, char * argv[]) {

	@autoreleasepool {
//		quicksort(kGetArray(), 0, 9);
		NSArray *b = @[@5,@2,@3,@1,@8,@6];
		NSLog(@"%@",bubblesort(b.mutableCopy));
		
//		NSLog(@"%@",quicksort([b mutableCopy], 0, 4));
		
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}





