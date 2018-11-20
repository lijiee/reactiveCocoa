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
//    RACSignal *singal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        
//        NSArray *array = @[@1,@2];
//        //发送信号
//        [subscriber sendNext:array];
//        //如果不发送信号。最好发送信号完毕，内部销毁信号
//        [subscriber sendCompleted];
//        return [RACDisposable disposableWithBlock:^{
//            NSLog(@"信号被摧毁了");
//        }];
//    }];
//    //订阅信号
//    [singal subscribeNext:^(id x) {
//        
//        NSLog(@"%@",x);
//    }];
    
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
//    RACSignal *signalG = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@1];
//        return nil;
//    }];
//    RACSignal *signalH = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@2];
//        return nil;
//    }];
//    [[signalG combineLatestWith:signalH]subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    //takeUntil：获取信号知道执行完这个信号只要传入信号发送完成后或者发送任意数据,就不能再接受源信号的内容
//    RACSubject *signalM = [RACSubject subject];
//    RACSubject *subject = [RACSubject subject];
//    [[signalM takeUntil:subject] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//    [signalM sendNext:@1];
//    [subject sendNext:@2];
//    [signalM sendNext:@3];
    //distinctUntilChanged:当上一次的值和当前的值右边的时候就会g发出信号
//    RACSubject *subjectA = [RACSubject subject];
    //skip : 跳过几个信号不接收
//    [[[subjectA skip:2]distinctUntilChanged] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//
//    [subjectA sendNext:@1];
//    [subjectA sendNext:@2];
//    [subjectA sendNext:@2];
//    [subjectA sendNext:@1];
//    [subjectA sendNext:@2];

    //RAC定时器 interval：每隔一段时间发出y信号
    
//    [[RACSubject interval:1 onScheduler:[RACScheduler currentScheduler]] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
    //delay延时发送
//    [[[RACSubject createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@1];
//        return nil;
//    }] delay:3] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    } ];
    //retry: 重试：只要失败就会重新创建信号，知道成功
//    __block int i = 0;
//    [[[RACSubject createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        if (i==4) {
//            [subscriber sendNext:@1];
//        }else{
//            [subscriber sendError:nil];
//            NSLog(@"dddd");
//
//        }
//        i ++;
//        return nil;
//    }]retry] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    } error:^(NSError *error) {
//        NSLog(@"%@",error);
//
//    }] ;
    //throttle ： 延迟发送
//    RACSubject *signal = [RACSubject subject];
//
//    // 节流，在一定时间（1秒）内，不接收任何信号内容，过了这个时间（1秒）获取最后发送的信号内容发出。
//    [[signal throttle:5] subscribeNext:^(id x) {
//
//        NSLog(@"%@",x);
//    }];
//
//    [signal sendNext:@"我是在5s之后打印的"];
    //重复 replay
    RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@1];
        [subscriber sendNext:@2];
        
        return nil;
    }] replay];
    
    [signal subscribeNext:^(id x) {
        
        NSLog(@"第一个订阅者%@",x);
        
    }];
    
    [signal subscribeNext:^(id x) {
        
        NSLog(@"第二个订阅者%@",x);
        
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
