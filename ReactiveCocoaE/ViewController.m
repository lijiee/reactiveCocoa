//
//  ViewController.m
//  ReactiveCocoaE
//
//  Created by 李杰 on 16/9/8.
//  Copyright © 2016年 李杰. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"
#import "Masonry.h"
#import "TwoViewController.h"
@interface ViewController ()
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UITextField *myTextView;
@end

@implementation ViewController
- (IBAction)oneClick:(id)sender {
    TwoViewController *two = [self.storyboard instantiateViewControllerWithIdentifier:@"TwoViewController"];
    two.delegateSignal = [RACSubject subject];
    [two.delegateSignal subscribeNext:^(id x) {
        
    }];
    [self presentViewController:two animated:YES completion:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self inintView];
    //创建一个信号
    RACSignal *singal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSArray *array = @[@1,@2];
        //发送信号
        [subscriber sendNext:array];
        //如果不发送信号。最好发送信号完毕，内部销毁信号
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"信号被摧毁了");
        }];
    }];
    //订阅信号
    [singal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
//    //创建信号
//
//    RACSubject *subject = [RACSubject subject];
//
//    //订阅信号
//    [subject subscribeNext:^(id x) {
//        NSLog(@"订阅第一个信号");
//    }];
//    [subject subscribeNext:^(id x) {
//        NSLog(@"订阅第二个信号");
//
//    }];
//
//    [subject sendNext:@1];
//    [subject sendNext:@2];

    //创建concat信号:按照一定顺序拼接信号，当发出多个信号后，有序接受
    
//    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@1];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//
//    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@2];
//        return nil;
//    }];
//    RACSignal *concatSignal = [signalA concat:signalB];
//    [concatSignal subscribeNext:^(id x) {
//
//        NSLog(@"%@",x);
//    }];
    //then :用于连接两个信号，当第一个信号完成，才会连接then返回的信号
    
//    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext: @1];
//        [subscriber sendCompleted];
//        return nil;
//    }] then:^RACSignal *{
//        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//            [subscriber sendNext:@2];
//            return nil;
//        }];
//    }] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    //merge：把多个信号合并为一个信号 ，任何一个信号有新值都会调用
//    RACSignal *singalC = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@1];
//        return nil;
//    }];
//    RACSignal *singalD = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@2];
//        return nil;
//    }];
//    RACSignal *mergeSignal = [singalC merge:singalD];
//
//    [mergeSignal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
    //zipWith:把两个信号压缩成一个信号，只有当两个信号同时发出信号的时候，才会触发next；并把两个信号合并成一个元组
//    RACSignal *signalF = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@1];
//        return nil;
//
//    }];
//    RACSignal *signalE = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@2];
//        return nil;
//    }];
//    RACSignal *zipSignal = [signalE zipWith:signalF];
//    [zipSignal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
    //combineLatest:将多个信号合并起来，并且拿到各个信号的最新值，必须每个信号都至少有个sendnext 才会触发合并
    RACSignal *signalG = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        return nil;
    }];
    RACSignal *signalH = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@2];
        return nil;
    }];
    [[signalG combineLatestWith:signalH]subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}

- (void)inintView{
    self.nameLabel = [[UILabel alloc]init];
    self.myTextView = [[UITextField alloc]init];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.myTextView];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.trailing.equalTo(self.view.mas_trailing).offset(-20);
        make.height.mas_equalTo(40);
        make.leading.equalTo(self.view.mas_leading).offset(20);
    }];
    [self.myTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(20);
        make.trailing.equalTo(self.view.mas_trailing).offset(-20);
       
        make.height.mas_equalTo(self.nameLabel.mas_height);
        make.width.mas_equalTo(self.nameLabel.mas_width);
        
    }];
    self.nameLabel.backgroundColor = [UIColor redColor];
    self.myTextView.backgroundColor =[ UIColor yellowColor];
    
    
    RAC(self.nameLabel,text)= self.myTextView.rac_textSignal;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
