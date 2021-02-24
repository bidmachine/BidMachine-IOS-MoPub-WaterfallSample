![BidMachine iOS](https://appodeal-ios.s3-us-west-1.amazonaws.com/docs/bidmachine.png)

# BidMachine IOS MoPub Waterfall Sample
> **_WARNING:_**  This project contains a [ adapter submodule](https://github.com/bidmachine/BidMachine-IOS-MoPub-Adapter). Use ```git clone --recursive git@github.com:bidmachine/BidMachine-IOS-MoPub-HeaderBiddingSample.git``` to use all project files

- [Getting Started](#user-content-getting-started)
- [BidMachine adapter](#user-content-bidmachine-adapter)
  - [Initialize sdk](#user-content-initialize-sdk)
  - [Transfer targeting data](#user-content-transfer-targeting-data-to-bidmachine)
  - [Banner implementation](#user-content-banners-implementation)
  - [Interstitial implementation](#user-content-interstitial-implementation)
  - [Rewarded implementation](#user-content-rewarded-implementation)
  - [Native ad implementation](#user-content-native-ad-implementation)
  - [Header Bidding](#user-content-header-bidding)

## Getting Started

Add following lines into your project Podfile

```ruby
target 'Target' do
  project 'Project.xcodeproj'
  pod 'MoPub-BidMachine-Adapters', '~> 1.6.4.0'
end
```

> **_NOTE:_** If you want to use BidMachine Header Bidding, please, also add following lines

```ruby
target 'Target' do
  project 'Project.xcodeproj'
  pod 'MoPub-BidMachine-Adapters', '~> 1.6.4.0'
  pod "BidMachine/Adapters"
end
```

## Configuration Parameters

### All configuration parameters

| Key | Parameter| Type | Required | 
| --- | --- |  --- | --- |
| kBDMExtSellerKey | seller_id | String | Required |
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
| kBDMExtStoreUrlKey | sturl | String | Optional |
| kBDMExtStoreIdKey | stid | String | Optional |
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

***"mediation_config"*** field is required for initialization if you use header bidding network

***"price_floors"*** field is used only in ad request parameters

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
            "ad_units": [
                {
                    "placement_id": "95298PL39048",
                    "format": "interstitial"
                }
            ],
            "app_id": "5a35a75845eaab51250070a5",
            "network": "vungle",
            "network_class": "BDMVungleAdNetwork"
        },
        {
            "ad_units": [
                {
                    "unit_id": "140138",
                    "format": "interstitial"
                },
                {
                    "unit_id": "140136",
                    "format": "rewarded"
                }
            ],
            "app_id": "117851",
            "api_key": "8627b127f51e01875ba2e2fd71a88f95",
            "network": "mintegral",
            "network_class": "BDMMintegralAdNetwork"
        },
        {
            "ad_units": [
                {
                    "slot_id": "576962",
                    "format": "banner_300x250"
                }
            ],
            "network": "my_target",
            "network_class": "BDMMyTargetAdNetwork"
        },
        {
            "ad_units": [
                {
                    "facebook_key": "323042751509018_640127076467249",
                    "format": "rewarded"
                }
            ],
            "app_id": "323042751509018",
            "placement_ids": [
                "323042751509018_640127076467249"
            ],
            "network": "facebook",
            "network_class": "BDMFacebookAdNetwork"
        },
        {
            "ad_units": [
                {
                    "placement_name": "video_without_cap_pb",
                    "format": "interstitial_video"
                }
            ],
            "sdk_key": "6gwG-HstT_aLMpZXUXlhNgEBja6Q5bq7i4GtdFMJoarOufnp36PaVlG2OBmw",
            "network": "tapjoy",
            "network_class": "BDMTapjoyAdNetwork"
        },
        {
            "ad_units": [
                {
                    "format": "rewarded_video",
                    "zone_id": "vzf07cd496be04483cad"
                },
                {
                    "format": "interstitial_video",
                    "zone_id": "vz7fdef471647c416682"
                }
            ],
            "app_id": "app327320f8ced14e61b2",
            "zones": [
                "vzf07cd496be04483cad",
                "vz7fdef471647c416682"
            ],
            "network": "adcolony",
            "network_class": "BDMAdColonyAdNetwork"
        },
        {
            "ad_units": [
                {
                    "slot_uuid": "54fb2d08-c222-40b1-8bbe-4879322dc04b",
                    "format": "banner_300x250"
                },
                {
                    "slot_uuid": "4e918ac0-5c68-4fe1-8d26-4e76e8f74831",
                    "format": "interstitial_static"
                }
            ],
            "app_key": "a9_onboarding_app_id",
            "network": "amazon",
            "network_class": "BDMAmazonNetwork"
        },
        {
            "ad_units": [
                {
                    "ad_unit_id": "30s6zt3ayypfyemwjvmp",
                    "format": "banner_320x50"
                },
                {
                    "orientation": "portrait",
                    "ad_unit_id": "6yws53jyfjgoq1ghnuqb",
                    "format": "interstitial_static"
                },
                {
                    "orientation": "landscape",
                    "ad_unit_id": "6yws53jyfjgoq1ghnuqb",
                    "format": "interstitial_static"
                }
            ],
            "publisher_id": "B-057601",
            "banner_ad_units": ["30s6zt3ayypfyemwjvmp"],
            "interstitial_ad_units": ["6yws53jyfjgoq1ghnuqb"],
            "network": "criteo",
            "network_class": "BDMCriteoAdNetwork"
        },
        {
            "ad_units": [
                {
                    "ad_space_id": "130563103",
                    "format": "banner_320x50"
                },
                {
                    "ad_space_id": "130626426",
                    "format": "interstitial_static"
                },
                {
                    "ad_space_id": "130626428",
                    "format": "rewarded"
                }
            ],
            "publisher_id": "1100042525",
            "network": "smaato",
            "network_class": "BDMSmaatoAdNetwork"
        }
]
}
```

## BidMachine adapter

### Initialize SDK

To initialize BidMachine use Mopub configuration method at start application

A list of all parameters can be found here [(configuration params)](#user-content-example-configuration-parameters)

```objc
- (void)initializeMoPub {
    MPMoPubConfiguration *sdkConfig = [[MPMoPubConfiguration alloc] initWithAdUnitIdForAppInitialization: @"AD_UNIT_ID"];
    NSDictionary *configurationParams = @{
                                          kBDMExtTestModeKey  :   @"1",
                                          kBDMExtSellerKey    :   @"true",
                                          kBDMExtLoggingKey   :   @"true"
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

### Transfer targeting data to BidMachine

If you want to transfer targeting information you can use custom event's property ***localExtras*** which represents dictionary.

Keys for ***localExtras*** [(here)](#user-content-all-configuration-parameters)

> **_NOTE:_** Also all targeting data can be passed throug MoPub backend and can be configured as JSON in MoPub UI

### Banners implementation

In the snippet below you can see transfering of local extra data: [(configuration params)](#user-content-example-configuration-parameters)

```objc
- (void)loadBannerAd {
    self.adView = [[MPAdView alloc] initWithAdUnitId:@"AD_UNIT_ID"];
    self.adView.delegate = self;
    self.adView.frame = CGRectMake(0, 0, 320, 50);
    [self.view addSubview:self.adView];
    NSDictionary *localExtras = @{ @"here" : @"params" } ;
    [self.adView setLocalExtras:localExtras];
    [self.adView loadAd];
}
```

### Interstitial implementation

In the snippet below you can see transfering of local extra data: [(configuration params)](#user-content-example-configuration-parameters)

```objc
- (void)loadInterstitialAds {
    self.interstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:@"AD_UNIT_ID"];
    self.interstitial.delegate = self;
    NSDictionary *localExtras = @{ @"here" : @"params" } ;
    [self.interstitial setLocalExtras:localExtras];
    [self.interstitial loadAd];
}
```

### Rewarded implementation

In the snippet below you can see transfering of local extra data: [(configuration params)](#user-content-example-configuration-parameters)

```objc
- (void)loadRewardedVideo {
    [MPRewardedVideo setDelegate:self forAdUnitId:@"AD_UNIT_ID"];
    NSDictionary *localExtras = @{ @"here" : @"params" } ;
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:@"AD_UNIT_ID"
                                            keywords:nil
                                    userDataKeywords:nil
                                          customerId:nil
                                   mediationSettings:nil
                                         localExtras:localExtras];
    [MPRewardedVideo presentRewardedVideoAdForAdUnitID:@"AD_UNIT_ID" fromViewController:self withReward:nil];
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
    MPNativeAdRequest *request = [MPNativeAdRequest requestWithAdUnitIdentifier:@UNIT_ID rendererConfigurations:@[self.rendererConfiguration]];
    MPNativeAdRequestTargeting *targeting = MPNativeAdRequestTargeting.targeting;
    targeting.localExtras = @{ @"here" : @"params" } ;;
    return request;
}
```

### Header Bidding

To pass data for Header Bidding add to your local extras "mediation_config": [(configuration params)](#user-content-mediation-config-parameters)

> **_NOTE:_** Also all Header Bidding data can be passed throug MoPub backend and can be configured as JSON in MoPub UI

```objc

- (NSDictionary *)localExtras {
    NSMutableDictionary *localExtras = [NSMutableDictionary new];
    localExtras[@"mediation_config"] = ["HEADER_BIDDING_CONFIG"];
    return localExtras;
}
```

#### Available ad units formats for Header Bidding

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
