//
//  ViewController.m
//  UIPickerView
//
//  Created by Karma on 16/5/31.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong) UIPickerView *myPickerView;
@property (nonatomic, strong) NSArray *province;//存放要选择的数据
@property (nonatomic, strong) UIButton *Btn;//省份选择按钮
@property (nonatomic, strong) UILabel *provinceLabel;//显示标签
@end

@implementation ViewController
- (NSArray *)province{
    if (!_province) {
        _province = @[@"广东",@"上海",@"北京"];
    }
    return _province;
}
- (UIButton *)Btn{
    if (!_Btn) {
        _Btn = [[UIButton alloc] initWithFrame:CGRectMake(275, 242, 46, 30)];
        [_Btn setTitle:@"省份" forState:UIControlStateNormal];
        _Btn.backgroundColor = [UIColor redColor];
        [_Btn addTarget:self action:@selector(myProvince) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_Btn];
    }
    return _Btn;
}
- (UILabel *)provinceLabel{
    if (!_provinceLabel) {
        _provinceLabel = [[UILabel alloc] initWithFrame:CGRectMake(63, 243, 137, 30)];
        _provinceLabel.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_provinceLabel];
    }
    return _provinceLabel;
}
- (UIPickerView *)myPickerView{
    if (!_myPickerView) {
        _myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 400, 375, 267)];
        _myPickerView.dataSource = self;
        _myPickerView.delegate = self;
    }
    return _myPickerView;
}
//点击省份按钮显示选择器
- (void) myProvince{
    [self.view addSubview:self.myPickerView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    [self myPickerView];
    [self provinceLabel];
    [self Btn];
}
//必选的数据源方法
//选择器有几列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
// 每列有几个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.province.count;
}
//点击屏幕移除选择器
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.myPickerView removeFromSuperview];
}
//返回指定列列表项的文本标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.province[row];
}
//选中列表项调用此方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.provinceLabel.text = self.province[row];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
