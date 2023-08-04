/*
 * Copyright (C) 2015 Gdier
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "IJKDemoInputURLViewController.h"
#import "IJKMoviePlayerViewController.h"

@interface IJKDemoInputURLViewController () <UITextViewDelegate>

@property(nonatomic,strong) IBOutlet UITextView *textView;

@end

@implementation IJKDemoInputURLViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Input URL";
        
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Play" style:UIBarButtonItemStyleDone target:self action:@selector(onClickPlayButton)]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //DSS hls
    self.textView.text = @"http://218.87.163.37:7086/live/cameraid/1000000%240/substream/1.m3u8";
    
    //DSS rtsp
//    self.textView.text = @"rtsp://218.87.163.37:19090/dss/monitor/params?cameraid=1000000%240&substream=1";
    
    //乐橙rtmp
//    self.textView.text = @"rtmp://121.43.126.231:12966/live/28de595627d6d45c1a2fa74e4da7e2ebf7555de860b6eb29";
    
    //乐橙hls
//    self.textView.text = @"http://cmgw-vpc.lechange.com:8888/LCO/8L053C9PAZ843EF/0/0/20230721T022824/265bb79b7fc1a48277e4b9b00d2f393e.m3u8";
    
    //乐橙flv
//    self.textView.text = @"https://cmgw-vpc.lechange.com:8890/flv/LCO/8L053C9PAZ843EF/0/1/20230721173100/31ff0d5d48797e33f79f5cdf4a8640ad.flv?proto=https";
    
    //萤石rtmp
//    self.textView.text = @"rtmp://rtmp01open.ys7.com:1935/v3/openlive/L22038083_1_1?expire=1690009508&id=602459377152045056&t=08a841b2c8f52f3f57f1649f72eba64b3aff0532a33c6a2cf117554ac0aacb00&ev=100";
    
    //萤石hls
//    self.textView.text = @"https://open.ys7.com/v3/openlive/L22038083_1_1.m3u8?expire=1694925218&id=602525269375262720&t=0d1176acef82a8b9cf6bb60986be05759e8c0df963fb4f6e1ede297225662a4a&ev=100";
    
    //萤石flv
//    self.textView.text = @"https://rtmp01open.ys7.com:9188/v3/openlive/L22038083_1_1.flv?expire=1690028400&id=602595658339196928&t=ec968ccadd89fa22c7b03c33202f665d9060ed8577c14e86318c25977b088238&ev=100";
}

- (void)onClickPlayButton {
    NSURL *url = [NSURL URLWithString:self.textView.text];
    NSString *scheme = [[url scheme] lowercaseString];
    
    if ([scheme isEqualToString:@"http"]
        || [scheme isEqualToString:@"https"]
        || [scheme isEqualToString:@"rtmp"]
        || [scheme isEqualToString:@"rtsp"]) {
        [IJKVideoViewController presentFromViewController:self withTitle:[NSString stringWithFormat:@"URL: %@", url] URL:url completion:^{
//            [self.navigationController popViewControllerAnimated:NO];
        }];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self onClickPlayButton];
}

@end
