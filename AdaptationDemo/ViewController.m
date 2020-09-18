//
//  ViewController.m
//  AdaptationDemo
//
//  Created by tpv tpv on 18/1/4.
//  Copyright © 2018年 xumxum. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "SecViewController.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

//屏幕
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define MAINSIZE_WIDTH ([[UIScreen mainScreen] bounds].size.width/375)
#define MAINSIZE_HEIGHT ([[UIScreen mainScreen] bounds].size.height/667)

#define NAVIGATIONHIGHT self.navigationController.navigationBar.frame.size//导航栏像素
#define STATUSHIGHT [[UIApplication sharedApplication] statusBarFrame].size//状态栏像素
#define TABBARHIGHT self.tabBarController.tabBar.frame.size//标签栏像素

////1. 对于约束参数可以省去"mas_"
//#define MAS_SHORTHAND
//
////2. 对于默认的约束参数自动装箱
//#define MAS_SHORTHAND_GLOBALS

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view setBackgroundColor:[UIColor whiteColor]];
//    
//    CGFloat width = self.view.frame.size.width;
//    CGFloat height = self.view.frame.size.height;
//    
//    NSLog(@"width==%f",width);//5,5s,5c:320   6,6s,7,8:375   6p,6sp,7p,8p:414   X:375
//    NSLog(@"height===%f",height);//5,5s,5c:568  6,6s,7,8:667   6p,6sp,7p,8p:736   X:812
    
    /**
     1.尺寸：width、height、size
     2.边界：left、leading、right、trailing、top、bottom
     3.中心点：center、centerX、centerY
     4.边界：edges
     5.偏移量：offset、insets、sizeOffset、centerOffset
     6.priority()约束优先级（0~1000），multipler乘因数, dividedBy除因数
     */
    
//    苹果为我们提供的适配框架有：VFL、UIViewAutoresizing、Auto Layout、Size Classes等 其中Auto Layout是使用频率最高的布局框架，但是其也有弊端。就是在使用UILayoutConstraint的时候，会发现代码量很多，而且大多都是重复性的代码，以至于好多人都不想用这个框架。
    
    //Masonry是一个对系统NSLayoutConstraint进行封装的第三方自动布局框架，采用链式编程的方式提供给开发者API。系统AutoLayout支持的操作，Masonry都支持，相比系统API功能来说，Masonry是有过之而无不及。
    
    //在使用Masonry添加约束之前，需要在addSubview之后才能使用，否则会导致崩溃。
//    在添加约束时初学者经常会出现一些错误，约束出现问题的原因一般就是两种：约束冲突和缺少约束。对于这两种问题，可以通过调试和log排查。
//    之前使用Interface Builder添加约束，如果约束有错误直接就可以看出来，并且会以红色或者黄色警告体现出来。而Masonry则不会直观的体现出来，而是以运行过程中崩溃或者打印异常log体现，所以这也是手写代码进行AutoLayout的一个缺点。

//    [self OfficialAutolayout];
//    [self masonryAutolayout];
    
//    WS(ws);
    
//    [self setMyAutoLayout];
//    
//    [self setScaleUI];
    
    [self MasonryLayout];
    

}

-(void)MasonryLayout{

    UIView * topView = [[UIView alloc]init];
    [topView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(64);
        
    }];
    
    UIView * down = [[UIView alloc]init];
    [down setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:down];
    
    [down mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(300);
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
        make.width.mas_equalTo(280);
        
        
    }];

    
    UIView * one = [[UIView alloc]init];
    [one setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:one];
    [one mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(topView);
        make.top.equalTo(topView.mas_bottom).offset(40);
        make.width.mas_equalTo(46);
        make.height.mas_equalTo(46);
        
    }];
    
    UIView * two = [[UIView alloc]init];
    [two setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:two];
    [two mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(one.mas_top);
        make.left.equalTo(self.view).offset(50);
        make.width.mas_equalTo(46);
        make.height.mas_equalTo(46);
    }];
    
    UIView * three = [[UIView alloc]init];
    [three setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:three];
    [three mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(one.mas_top);
        make.right.equalTo(self.view).offset(-50);
        make.width.mas_equalTo(46);
        make.height.mas_equalTo(46);
    }];
    
    
    UIView * mid = [[UIView alloc]init];
    [mid setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:mid];
    [mid mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.top.equalTo(one.mas_bottom).offset(50);
        make.bottom.equalTo(down.mas_top).offset(-50);
        make.left.mas_equalTo(100);
    }];
    
    
    

    
    
}

-(void)setMyAutoLayout{

    UIView * topView = [[UIView alloc]init];
    [topView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:topView];

//    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(10);
//        make.right.equalTo(self.view).offset(-20);
//        make.top.equalTo(self.view).offset(20);
////        make.width.equalTo(self.view.mas_width);
//        make.height.equalTo(@64);
//    }];
    
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(KScreenW);
        make.height.mas_equalTo(@64);
    }];

    UIButton * midBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [midBtn setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:midBtn];
    [midBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(topView);
        make.top.equalTo(topView.mas_bottom).offset(40);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    
    UIButton * lefeBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [lefeBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:lefeBtn];
    [lefeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(midBtn.mas_left).offset(-40);
        make.top.equalTo(topView.mas_bottom).offset(40);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    UIButton * rightBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [rightBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:rightBtn];
    
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(midBtn.mas_right).offset(40);
        make.top.equalTo(midBtn);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
}

-(void)masonryAutolayout{
    
    //  蓝色View
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    //  红色View
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    //  bluView的约束
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(20);
        make.height.equalTo(@50);
    }];
    
    //  redView的约束
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(blueView.mas_centerX);
        make.right.equalTo(blueView.mas_right);
        make.top.equalTo(blueView.mas_bottom).offset(30);
        make.height.equalTo(blueView.mas_height);
    }];
    
//    //移除之前的约束，重新添加新的约束
//    [redView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        
////        make.left.equalTo(blueView).offset(0);
//        make.left.equalTo(blueView.mas_left).offset(40);
//        make.right.equalTo(self.view).offset(-40);
//        make.top.equalTo(blueView.mas_bottom).offset(20);
//        make.height.equalTo(@80);
//    }];
//    
//    //更新约束
//    [redView mas_updateConstraints:^(MASConstraintMaker *make) {
//        
//        make.height.equalTo(@200);
//        make.left.equalTo(blueView.mas_left);
//    }];
    
    
    
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
//    }];
    

}


-(void)setScaleUI{
    
    UIView * topView = [[UIView alloc]init];
    [topView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:topView];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64*MAINSIZE_HEIGHT);
    
    UIButton * midBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [midBtn setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:midBtn];
    midBtn.frame = CGRectMake(SCREEN_WIDTH/2-20*MAINSIZE_WIDTH,topView.frame.size.height+ 80*MAINSIZE_HEIGHT, 40*MAINSIZE_WIDTH, 40*MAINSIZE_WIDTH);
    
    UIButton * lefeBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [lefeBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:lefeBtn];
    lefeBtn.frame = CGRectMake(SCREEN_WIDTH/2-100*MAINSIZE_WIDTH,topView.frame.size.height+ 80*MAINSIZE_HEIGHT, 40*MAINSIZE_WIDTH, 40*MAINSIZE_WIDTH);
    
    
    UIButton * rightBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [rightBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:rightBtn];
    rightBtn.frame = CGRectMake(SCREEN_WIDTH/2+60*MAINSIZE_WIDTH, topView.frame.size.height+80*MAINSIZE_HEIGHT, 40*MAINSIZE_WIDTH, 40*MAINSIZE_WIDTH);
    
    
}

-(void)OfficialAutolayout{

    //  蓝色View
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    //  不要将AutoresizingMask转为Autolayout约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //  红色View
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    //  不要将AutoresizingMask转为Autolayout约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    
    //---------------- Blue View ---------------
    //  左边约束
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [self.view addConstraint:leftConstraint];
    
    //  右边约束
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:rightConstraint];
    
    //  顶部约束
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:50];
    [self.view addConstraint:topConstraint];
    
    //  高度约束
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:50];
    [blueView addConstraint:heightConstraint];
    
    //---------------- Red View --------------
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:redView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:blueView
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1.0
                                                              constant:0.0],
                                
                                [NSLayoutConstraint constraintWithItem:redView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:blueView
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0 constant:0.0],
                                
                                
                                [NSLayoutConstraint constraintWithItem:redView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:blueView
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:20],
                                
                                [NSLayoutConstraint constraintWithItem:redView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:blueView
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0
                                                              constant:0.0]
                                ]];
    
}


//添加约束
//- (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *))block {
//}

//更新约束
//- (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *))block {
//}
//
//移除之前的约束，重新添加新的约束
//- (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block {
//}

//equalTo()       参数是对象类型，一般是视图对象或者mas_width这样的坐标系对象
//mas_equalTo()   和上面功能相同，参数可以传递基础数据类型对象，可以理解为比上面的API更强大
//
//width()         用来表示宽度，例如代表view的宽度
//mas_width()     用来获取宽度的值。和上面的区别在于，一个代表某个坐标系对象，一个用来获取坐标系对象的值


//- (void)updateConstraintsIfNeeded  调用此方法，如果有标记为需要重新布局的约束，则立即进行重新布局，内部会调用updateConstraints方法
//- (void)updateConstraints          重写此方法，内部实现自定义布局过程
//- (BOOL)needsUpdateConstraints     当前是否需要重新布局，内部会判断当前有没有被标记的约束
//- (void)setNeedsUpdateConstraints  标记需要进行重新布局


//- (void)setNeedsLayout  标记为需要重新布局
//- (void)layoutIfNeeded  查看当前视图是否被标记需要重新布局，有则在内部调用layoutSubviews方法进行重新布局
//- (void)layoutSubviews  重写当前方法，在内部完成重新布局操作


/**
 设置yellow视图和self.view等大，并且有10的内边距。
 注意根据UIView的坐标系，下面right和bottom进行了取反。所以不能写成下面这样，否则right、bottom这两个方向会出现问题。
 make.edges.equalTo(self.view).with.offset(10);
 
 除了下面例子中的offset()方法，还有针对不同坐标系的centerOffset()、sizeOffset()、valueOffset()之类的方法。
 */

//[self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.left.equalTo(self.view).with.offset(10);
//    make.top.equalTo(self.view).with.offset(10);
//    make.right.equalTo(self.view).with.offset(-10);
//    make.bottom.equalTo(self.view).with.offset(-10);
//}];


@end
