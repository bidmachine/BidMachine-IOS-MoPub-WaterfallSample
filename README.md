![BidMachine iOS](https://appodeal-ios.s3-us-west-1.amazonaws.com/docs/bidmachine.png)

# BidMachine IOS MoPub Waterfall Sample
> **_WARNING:_**  This project contains a [ adapter submodule](https://github.com/bidmachine/BidMachine-IOS-MoPub-Adapter). Use ```git clone --recursive git@github.com:bidmachine/BidMachine-IOS-MoPub-WaterfallSample.git``` to use all project files

- [Getting Started](#user-content-getting-started)
- [Initialize sdk](#user-content-initialize-sdk)
- [Transfer targeting data](#user-content-transfer-targeting-data-to-bidmachine)
- [Banner implementation](#user-content-banners-implementation)
- [MREC implementation](#user-content-mrec-implementation)
- [Interstitial implementation](#user-content-interstitial-implementation)
- [Rewarded implementation](#user-content-rewarded-implementation)
- [Native ad implementation](#user-content-native-ad-implementation)

## Getting Started

##### Add following lines into your project Podfile

```ruby
target 'Target' do
  project 'Project.xcodeproj'
  pod 'MoPub-BidMachine-Adapters', '~> 1.7.3.0'
end
```

> **_NOTE:_** If you want to use BidMachine Header Bidding, please, also add following lines

```ruby
target 'Target' do
  project 'Project.xcodeproj'
  pod 'MoPub-BidMachine-Adapters', '~> 1.7.3.0'
  pod "BDMAdColonyAdapter", "~> 1.7.3.0"
  pod "BDMAmazonAdapter", "~> 1.7.3.0"
  pod "BDMCriteoAdapter", "~> 1.7.3.0"
  pod "BDMFacebookAdapter", "~> 1.7.3.0"
  pod "BDMMyTargetAdapter", "~> 1.7.3.0"
  pod "BDMSmaatoAdapter", "~> 1.7.3.0"
  pod "BDMTapjoyAdapter", "~> 1.7.3.0"
  pod "BDMVungleAdapter", "~> 1.7.3.0"
  pod "BDMPangleAdapter", "~> 1.7.3.0"
end
```

## Configuration Parameters

### All configuration parameters

| Key | Parameter| Type | Required | 
| --- | --- |  --- | --- |
| kBDMExtSellerKey | seller_id | String | Required |
| kBDMExtStoreUrlKey | sturl | String | Required |
| kBDMExtStoreIdKey | stid | String | Required |
| kBDMExtTestModeKey | test_mode | String | Optional |
| kBDMExtLoggingKey | logging_enabled | String | Optional |
| kBDMExtBaseURLKey | endpoint | String | Optional |
| kBDMExtUserIdKey | userId | String | Optional |
| kBDMExtGenderKey | gender | String | Optional |
| kBDMExtYearOfBirthKey | yob | Number | Optional |
| kBDMExtKeywordsKey | keywords | String | Optional |
| kBDMExtBCatKey | bcat | String | Optional |
| kBDMExtBAdvKey | badv | String | Optional |
| kBDMExtBAppKey | bapps | String | Optional |
| kBDMExtCountryKey | country | String | Optional |
| kBDMExtCityKey | city | String | Optional |
| kBDMExtZipKey | zip | String | Optional |
| kBDMExtPaidKey | paid | String | Optional |
| kBDMExtStoreCatKey | store_cat | String | Optional |
| kBDMExtStoreSubCatKey | store_subcat | String | Optional |
| kBDMExtFrameworkNameKey | fmw_name | String | Optional |
| kBDMExtCoppaKey | coppa | String | Optional |
| kBDMExtConsentKey | consent | String | Optional |
| kBDMExtGDPRKey | gdpr | String | Optional |
| kBDMExtConsentStringKey | consent_string | String | Optional |
| kBDMExtCCPAStringKey | ccpa_string | String | Optional |
| kBDMExtPublisherIdKey | pubid | String | Optional |
| kBDMExtPublisherNameKey | pubname | String | Optional |
| kBDMExtPublisherDomainKey | pubdomain | String | Optional |
| kBDMExtPublisherCatKey | pubcat | String | Optional |
| kBDMExtNetworkConfigKey | mediation_config | Array | Optional |
| kBDMExtSSPKey | ssp | String | Optional |
| kBDMExtWidthKey | banner_width | Number | Optional |
| kBDMExtHeightKey | banner_height | Number | Optional |
| kBDMExtFullscreenTypeKey | ad_content_type | String | Optional |
| kBDMExtNativeTypeKey | adunit_native_format | String | Optional |
| kBDMExtPriceFloorKey | priceFloors | Array | Optional |

```
@"seller_id"                  --> Your Seller ID
@"test_mode"                  --> Enable Test Mode. @"true" or @"false"
@"logging_enabled"            --> Enable Bidmachine Log. @"true" or @"false"
@"endpoint"                   --> String URL that should be used as base URL for sdk
@"user_id"                    --> Vendor-specific ID for the user
@"gender"                     --> User gender refer to OpenRTB 2.5 spec (@"F", @"M", @"0")
@"yob"                        --> User year of birth
@"keywords"                   --> Comma separated list of keywords about the app
@"bcat"                       --> Blocked advertiser categories using the IAB content categories. Comma separated list
@"badv"                       --> Block list of advertisers by their domains. Comma separated list
@"bapps"                      --> Block list of applications by their platform-specific exchange- independent application identifiers. Comma separated list
@"country"                    --> User country 
@"city"                       --> User city 
@"zip"                        --> User zip code 
@"sturl"                      --> Store URL. @"12356"
@"stid"                       --> Numeric store id identifier 
@"paid"                       --> Paid version of app. @"true" or @"false"
@"store_cat"                  --> Store category
@"store_subcat"               --> Store subcategories. Comma separated list
@"fmw_name"                   --> Name of framework. @"unity" or @"native"
@"coppa"                      --> Child app value. @"true" or @"false"
@"consent"                    --> User consent. @"true" or @"false"
@"gdpr"                       --> GDPR. @"true" or @"false"
@"consent_string"             --> User consent string
@"ccpa_string"                --> CCPA string: @"y---"
@"pubid"                      --> Publisher Id
@"pubname"                    --> Publisher name
@"pubdomain"                  --> Publisher domain
@"pubcat"                     --> Publisher category. Comma separated list
@"ssp"                        --> SSP name
@"banner_width"               --> Banner width
@"banner_height"              --> Banner height
@"ad_content_type"            --> Fullscreen type - Video, Banner, All
@"adunit_native_format"       --> Native type - Video, Icon, Image, All
@"priceFloors"                --> Array of price floors 
@"mediation_config"           --> Array of header bidding network configuration 
```

### Example configuration parameters

***"seller_id"*** field is required for initialization.

***"sturl"*** field is required for initialization.

***"stid"*** field is required for initialization.

***"mediation_config"*** field is required for initialization if you use header bidding network

***"priceFloors"*** field is used only in ad request parameters

The rest of the fields can be passed both to the initialization and to the request

```json
{
  "seller_id": "YOUR_SELLER_ID",
  "test_mode": "true",
  "logging_enabled": "true",
  "endpoint": "https://same_url",
  "user_id": "user123",
  "gender": "F",
  "yob": 2000,
  "keywords": "Keyword_1,Keyword_2,Keyword_3,Keyword_4",
  "badv": "https://domain_1.com,https://domain_2.org",
  "bapps": "com.test.application_1,com.test.application_2,com.test.application_3",
  "bcat": "IAB-1,IAB-3,IAB-5",
  "country": "USA",
  "city": "Los Angeles",
  "zip": "90001–90084",
  "sturl": "https://store_url.com",
  "stid": "12345",
  "paid": "true",
  "store_cat": "cat_1",
  "store_subcat": "cat_2,cat_3,cat_4",
  "fmw_name": "native",
  "coppa": "true",
  "consent": "true",
  "gdpr": "true",
  "consent_string": "BOEFEAyOEFEAyAHABDENAI4AAAB9vABAASA",
  "ccpa_string": "y---",
  "pubid": "PUB_ID",
  "pubname": "PUB_NAME",
  "pubdomain": "PUB_DOMAIN",
  "pubcat": "PUB_CAT,PUB_CUT_2",
  "ssp": "Appodeal",
  "banner_width": 320,
  "banner_height": 50,
  "ad_content_type": "All",
  "adunit_native_format": "All",
  "priceFloors": [
    {
      "id_1": 300.06
    },
    {
      "id_2": 1000
    },
    302.006,
    1002
  ],
  "mediation_config" : []
}
```

### Mediation config parameters

```json
{
  "mediation_config" : 
  [
    {
        "network": "vungle",
        "network_class": "BDMVungleAdNetwork",
        "params" :
        {
            "app_id": "5a35a75845eaab51250070a5"
        },
        "ad_units": [
            {
                "format": "interstitial",
                "params" :
                {
                    "placement_id": "95298PL39048"
                },
                "custom_params" :
                {
                    "custom_field": "unknown"
                }
            }
        ]
    },
    {
        "network": "my_target",
        "network_class": "BDMMyTargetAdNetwork",
        "ad_units": [
            {
                "format": "banner_300x250",
                "params" :
                {
                    "slot_id": "576962"
                }
            }
        ]
    },
    {
        "network": "facebook",
        "network_class": "BDMFacebookAdNetwork",
        "params" :
        {
            "app_id": "1525692904128549"
        },
        "ad_units": [
            {
                "format": "rewarded_video",
                "params" :
                {
                    "facebook_key": "1525692904128549_2395742753790222"
                }
            },
            {
                "format": "interstitial_static",
                "params" :
                {
                    "facebook_key": "1525692904128549_2395740550457109"
                }
            },
            {
                "format": "banner_320x50",
                "params" :
                {
                    "facebook_key": "1525692904128549_2395736947124136"
                }
            }
        ]
    },
    {
        "network": "tapjoy",
        "network_class": "BDMTapjoyAdNetwork",
        "params" :
        {
            "sdk_key": "6gwG-HstT_aLMpZXUXlhNgEBja6Q5bq7i4GtdFMJoarOufnp36PaVlG2OBmw"
        },
        "ad_units": [
            {
                "format": "interstitial_video",
                "params" :
                {
                    "placement_name": "video_without_cap_pb"
                }
            }
        ]
    },
    {
        "network": "adcolony",
        "network_class": "BDMAdColonyAdNetwork",
        "params" :
        {
            "app_id": "app327320f8ced14e61b2"
        },
        "ad_units": [
            {
                "format": "rewarded_video",
                "params" :
                {
                    "zone_id": "vzf07cd496be04483cad"
                }
            },
            {
                "format": "interstitial_video",
                "params" :
                {
                    "zone_id": "vz7fdef471647c416682"
                }
            }
        ]
    },
    {
        "network": "amazon",
        "network_class": "BDMAmazonNetwork",
        "params" :
        {
            "app_key": "c5f20fe6e37146b08749d09bb2b6a4dd"
        },
        "ad_units": [
            {
                "format": "banner_320x50",
                "params" :
                {
                    "slot_uuid": "88e6293b-0bf0-43fc-947b-925babe7bf3f"
                }
            },
            {
                "format": "interstitial_static",
                "params" :
                {
                    "slot_uuid": "424c37b6-38e0-4076-94e6-0933a6213496"
                }
            }
        ]
    },
    {
        "network": "criteo",
        "network_class": "BDMCriteoAdNetwork",
        "params" :
        {
            "publisher_id": "B-057601"
        },
        "ad_units": [
            {
                "format": "banner_320x50",
                "params" :
                {
                    "ad_unit_id": "30s6zt3ayypfyemwjvmp"
                }
            },
            {
                "format": "interstitial_static",
                "params" :
                {
                    "orientation": "portrait",
                    "ad_unit_id": "6yws53jyfjgoq1ghnuqb"
                }
            },
            {
                "format": "interstitial_static",
                "params" :
                {
                    "orientation": "landscape",
                    "ad_unit_id": "6yws53jyfjgoq1ghnuqb"
                }
            }
        ]
    },
    {
        "network": "smaato",
        "network_class": "BDMSmaatoAdNetwork",
        "params" :
        {
            "publisher_id": "1100042525"
        },
        "ad_units": [
            {
                "format": "banner_320x50",
                "params" :
                {
                    "ad_space_id": "130563103"
                }
            },
            {
                "format": "interstitial_static",
                "params" :
                {
                    "ad_space_id": "130626426"
                }
            },
            {
                "format": "rewarded",
                "params" :
                {
                    "ad_space_id": "130626428"
                }
            }
        ]
    }
]
}
```

##### Available ad units formats for Header Bidding

You can pass constants that are listed below:

* banner
* banner_320x50
* banner_728x90
* banner_300x250
* interstitial_video
* interstitial_static
* interstitial
* rewarded_video
* rewarded_static
* rewarded

### Initialize SDK

> **_WARNING:_** To initialize BidMachine use Mopub configuration method at start application.
> If you use the lineItem settings (mopub server params), then parameters for initialization can be empty

> **_NOTE:_** **storeURL**, **storeId** and **seller_id** - are required parameters.
> A list of all parameters can be found here [(configuration params)](#user-content-example-configuration-parameters)

##### Yours implementation of initialization should look like this:

```objc
- (void)initializeMoPub {
    MPMoPubConfiguration *sdkConfig = [[MPMoPubConfiguration alloc] initWithAdUnitIdForAppInitialization: @"AD_UNIT_ID"];
    NSDictionary *configurationParams = @{
                                          kBDMExtTestModeKey  :   @"1",
                                          kBDMExtSellerKey    :   @"true",
                                          kBDMExtLoggingKey   :   @"true",
                                          kBDMExtStoreUrlKey  :   @"http://storeURL",
                                          kBDMExtStoreIdKey   :   @"123456"
                                          };
    [sdkConfig setNetworkConfiguration:configurationParams
                   forMediationAdapter:@"BidMachineAdapterConfiguration"];
    
    sdkConfig.loggingLevel = MPBLogLevelDebug;
    
    [[MoPub sharedInstance] initializeSdkWithConfiguration:sdkConfig
                                                completion:^{
                                                    NSLog(@"SDK initialization complete");
                                                }];
}
```

##### If you are using Header Bidding networks, then you need to set their parameters as follows
To pass data for Header Bidding add to your local extras "mediation_config": [(configuration params)](#user-content-mediation-config-parameters)

All network required fields and values types are described in BidMachine doc. ([WIKI](https://wiki.appodeal.com/display/BID/BidMachine+iOS+SDK+Documentation#BidMachineiOSSDKDocumentation-AdNetworksConfigurationsParameters)). If ad network has initialisation parameters, it should be added in params of mediation config object. Ad network ad unit specific paramters should be added in params of ad unit object.

> **_ATTENTION:_** In version 1.7.0, the format for transferring parameters for HB has changed

```objc
- (void)initializeMoPub {
    MPMoPubConfiguration *sdkConfig = [[MPMoPubConfiguration alloc] initWithAdUnitIdForAppInitialization: @"AD_UNIT_ID"];
    NSDictionary *configurationParams = @{
        kBDMExtTestModeKey      :   @"1",
        kBDMExtSellerKey        :   @"true",
        kBDMExtLoggingKey       :   @"true",
        kBDMExtStoreUrlKey      :   @"http://storeURL",
        kBDMExtStoreIdKey       :   @"123456",
        kBDMExtNetworkConfigKey : @[@{
                                        @"network": @"criteo",
                                        @"network_class": @"BDMCriteoAdNetwork",
                                        @"params" :
                                        @{
                                            @"publisher_id": @"B-057601"
                                        },
                                        @"ad_units": @[
                                            @{
                                                @"format": @"banner_320x50",
                                                @"params" :
                                                @{
                                                    @"ad_unit_id": @"30s6zt3ayypfyemwjvmp"
                                                }
                                            },
                                            @{
                                                @"format": @"interstitial_static",
                                                @"params" :
                                                @{
                                                    @"orientation": @"portrait",
                                                    @"ad_unit_id": @"6yws53jyfjgoq1ghnuqb"
                                                }
                                            },
                                            @{
                                                @"format": @"interstitial_static",
                                                @"params" :
                                                @{
                                                    @"orientation": @"landscape",
                                                    @"ad_unit_id": @"6yws53jyfjgoq1ghnuqb"
                                                }
                                            }
                                        ]
                                    }]
    };
    [sdkConfig setNetworkConfiguration:configurationParams
                   forMediationAdapter:@"BidMachineAdapterConfiguration"];
    
    sdkConfig.loggingLevel = MPBLogLevelDebug;
    
    [[MoPub sharedInstance] initializeSdkWithConfiguration:sdkConfig
                                                completion:^{
        NSLog(@"SDK initialization complete");
    }];
}
```

##### If you are using lineItem settings for initialization, then the code might look like this

```objc
- (void)initializeMoPub {
    MPMoPubConfiguration *sdkConfig = [[MPMoPubConfiguration alloc] initWithAdUnitIdForAppInitialization: @"AD_UNIT_ID"];
    [sdkConfig setNetworkConfiguration:@{}
                   forMediationAdapter:@"BidMachineAdapterConfiguration"];
    
    sdkConfig.loggingLevel = MPBLogLevelDebug;
    
    [[MoPub sharedInstance] initializeSdkWithConfiguration:sdkConfig
                                                completion:^{
                                                    NSLog(@"SDK initialization complete");
                                                }];
}
```

### Transfer targeting data to BidMachine

If you want to transfer targeting information you can use custom event's property ***localExtras*** which represents dictionary.

Keys for ***localExtras*** [(here)](#user-content-all-configuration-parameters)

> **_NOTE:_** Also all targeting data can be passed throug MoPub backend and can be configured as JSON in MoPub UI

### Banners implementation

In the snippet below you can see transfering of local extra data: [(configuration params)](#user-content-example-configuration-parameters)

```objc
- (void)loadBannerAd {
    CGSize adViewSize = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? kMPPresetMaxAdSize90Height : kMPPresetMaxAdSize50Height;
    NSDictionary *localExtras = @{ @"here" : @"params" };

    self.adView = [[MPAdView alloc] initWithAdUnitId:@"AD_UNIT_ID"];
    self.adView.delegate = self;
    
    self.adView.frame = (CGRect){.size = adViewSize};
    [self.adView setLocalExtras:localExtras];
    [self.adView loadAdWithMaxAdSize:adViewSize];
}
```

### MREC implementation

In the snippet below you can see transfering of local extra data: [(configuration params)](#user-content-example-configuration-parameters)

```objc
- (void)loadBannerAd {
    CGSize adViewSize = kMPPresetMaxAdSize250Height;
    NSDictionary *localExtras = @{ @"here" : @"params" };

    self.adView = [[MPAdView alloc] initWithAdUnitId:@"AD_UNIT_ID"];
    self.adView.delegate = self;
    
    self.adView.frame = (CGRect){.size = adViewSize};
    [self.adView setLocalExtras:localExtras];
    [self.adView loadAdWithMaxAdSize:adViewSize];
}
```

### Interstitial implementation

In the snippet below you can see transfering of local extra data: [(configuration params)](#user-content-example-configuration-parameters)

```objc
- (void)loadInterstitialAds {
    NSDictionary *localExtras = @{ @"here" : @"params" } ;

    self.interstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:@"AD_UNIT_ID"];
    self.interstitial.delegate = self;
    
    [self.interstitial setLocalExtras:localExtras];
    [self.interstitial loadAd];
}
```

### Rewarded implementation

In the snippet below you can see transfering of local extra data: [(configuration params)](#user-content-example-configuration-parameters)

```objc
- (void)loadRewardedVideo {
    NSDictionary *localExtras = @{ @"here" : @"params" } ;

    [MPRewardedAds setDelegate:self forAdUnitId:@"AD_UNIT_ID"];
    [MPRewardedAds loadRewardedAdWithAdUnitID:@"AD_UNIT_ID"
                                     keywords:nil
                             userDataKeywords:nil
                                   customerId:nil
                            mediationSettings:nil
                                  localExtras:localExtras];
}

```
### Native ad implementation

In the snippet below you can see transfering of local extra data: [(configuration params)](#user-content-example-configuration-parameters)

```objc
- (void)loadAd:(id)sender {
    self.nativeAdRequest = [self request];
    __weak typeof(self) weakSelf = self;
    [self.nativeAdRequest startWithCompletionHandler:^(MPNativeAdRequest *request, MPNativeAd *response, NSError *error) {
        if (!error) {
            weakSelf.nativeAd = response;
        } 
    }];
}

- (void)showAd:(id)sender {
    self.nativeAd.delegate = self;
    [NativeAdRenderer renderAd:self.nativeAd onView:self.container];
}

- (MPStaticNativeAdRendererSettings *)rendererSettings {
    MPStaticNativeAdRendererSettings *rendererSettings = MPStaticNativeAdRendererSettings.new;
    rendererSettings.renderingViewClass = NativeAdView.class;
    return rendererSettings;
}

- (MPNativeAdRendererConfiguration *)rendererConfiguration {
    return [BidMachineNativeAdRenderer rendererConfigurationWithRendererSettings:self.rendererSettings];
}

- (MPNativeAdRequest *)request {
    NSDictionary *localExtras = @{ @"here" : @"params" } ;

    MPNativeAdRequest *request = [MPNativeAdRequest requestWithAdUnitIdentifier:@UNIT_ID rendererConfigurations:@[self.rendererConfiguration]];
    MPNativeAdRequestTargeting *targeting = MPNativeAdRequestTargeting.targeting;
    targeting.localExtras = localExtras ;
    request.targeting = targeting;
    return request;
}
```
