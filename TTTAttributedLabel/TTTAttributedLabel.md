# TTTAttributedLabel

* [源文件链接](./TTTAttributedLabel.h)

## 使用

TTTAttributedLabel 是UILabel 的一个分类，支持纯代码和`xib`&`storyboard`中使用

`服务条款`
`隐私政策`
`隐私声明`
### 1.设置文本
```
self.Label.text = @"本人接受服务条款和隐私政策及隐私声明。";
```
### 2.设置代理
``` 
<TTTAttributedLabelDelegate>
self.Label.delegate = self；
```

### 3.添加链接属性
```
self.Label.linkAttributes = 
@{(id)kCTForegroundColorAttributeName:kUIColorFromRGB(0xF39B63)};
```

### 4.添加链接
```
    NSRange range1 = [self.Label.text rangeOfString:@"服务条款"];
    NSRange range2 = [self.Label.text rangeOfString:@"隐私政策"];
    NSRange range3 = [self.Label.text rangeOfString:@"隐私声明"];

    [self.Label addLinkToURL:[NSURL URLWithString:[NSString stringWithFormat:@"scheme://%ld",(long)PrivacyLinkTermsofService]] withRange:range1];
    [self.Label addLinkToURL:[NSURL URLWithString:[NSString stringWithFormat:@"scheme://%ld",(long)PrivacyLinkPrivacyPolicy]] withRange:range2];
    [self.Label addLinkToURL:[NSURL URLWithString:[NSString stringWithFormat:@"scheme://%ld",(long)PrivacyLinkPrivacyStatement]] withRange:range3];
```

### 5.监听代理方法
```
- (void)attributedLabel:(TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url{
    NSString *URLString = url.absoluteString;
    if (![URLString hasPrefix:@"scheme://"]) return;
    PrivacyLinkType linkType = [[URLString substringWithRange:NSMakeRange(URLString.length-1, 1)] integerValue];
    if (linkType == PrivacyLinkTermsofService) {
        return;
    }
    if (linkType == PrivacyLinkPrivacyPolicy) {
        return;
    }
    if (linkType == PrivacyLinkPrivacyStatement) {
        return;
    }
}

typedef NS_ENUM(NSInteger,PrivacyLinkType) {
    PrivacyLinkTermsofService = 0,
    PrivacyLinkPrivacyPolicy,
    PrivacyLinkPrivacyStatement
};
```
