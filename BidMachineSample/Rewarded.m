//
//  Rewarded.m
//  BMIntegrationSample
//
//  Created by Ilia Lozhkin on 11/28/19.
//  Copyright © 2019 bidmachine. All rights reserved.
//

#import "Rewarded.h"

#define UNIT_ID         "b94009cbb6b7441eb097142f1cb5e642"

@interface Rewarded ()<MPRewardedAdsDelegate>

@end

@implementation Rewarded

- (void)loadAd:(id)sender {
    [MPRewardedAds setDelegate:self forAdUnitId:@UNIT_ID];
    [MPRewardedAds loadRewardedAdWithAdUnitID:@UNIT_ID
                                     keywords:nil
                             userDataKeywords:nil
                                   customerId:nil
                            mediationSettings:nil
                                  localExtras:AppDelegate.localExtras];
}

- (void)showAd:(id)sender {
    [MPRewardedAds presentRewardedAdForAdUnitID:@UNIT_ID fromViewController:self withReward:nil];
}

#pragma mark - MPRewardedVideoDelegate

- (void)rewardedAdDidLoadForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedDidReceiveAd");
}

- (void)rewardedAdDidFailToLoadForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"rewarded:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

- (void)rewardedAdDidExpireForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedDidExpired");
}

- (void)rewardedAdDidFailToShowForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"rewardedAdDidFailToShowForAdUnitID: %@", [error localizedDescription]);
}

- (void)rewardedAdWillPresentForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdWillPresentForAdUnitID");
}

- (void)rewardedAdDidPresentForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdDidPresentForAdUnitID");
}

- (void)rewardedAdWillDismissForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdWillDismissForAdUnitID");
}

- (void)rewardedAdDidDismissForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdDidDismissForAdUnitID");
}

- (void)rewardedAdDidReceiveTapEventForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdDidReceiveTapEventForAdUnitID");
}

- (void)rewardedAdWillLeaveApplicationForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdWillLeaveApplicationForAdUnitID");
}

- (void)rewardedAdShouldRewardForAdUnitID:(NSString *)adUnitID reward:(MPReward *)reward {
    NSLog(@"Reward received with currency %@ , amount %lf", reward.currencyType, [reward.amount doubleValue]);
}

- (void)didTrackImpressionWithAdUnitID:(NSString *)adUnitID impressionData:(MPImpressionData *)impressionData {
    NSLog(@"didTrackImpressionWithAdUnitID");
}

@end
