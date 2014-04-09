//
//  SharedWebService.h
//  YourDBS
//
//  Created by CBG Team on 24/10/13.
//
//

#import <Foundation/Foundation.h>

@interface SharedWebService : NSObject

+ (SharedWebService*)sharedInstance;


- (void) registerForPushNotification : (void (^)(NSDictionary *dict, NSError *error))block deviceType : (NSString*) aDeviceType deviceToken : (NSString*) aDeviceToken;

//- (void)getRiskProfilerQuestion:(void (^)(NSDictionary *dict, NSError *error))block;
//
//- (void)login:(void (^)(NSDictionary *dict, NSError *error))block forEmail:(NSString*)email;
//
//- (void)contactMeToHost:(void (^)(NSDictionary *dict, NSError *error))block responseData:(NSDictionary*)responseData;
//
//- (void) submitRiskProfileToHost :(void (^)(NSDictionary *dict, NSError *error))block riskType : (NSString*) riskType;
//
//- (void) getInsightList  :(void (^)(NSDictionary *dict, NSError *error))block offset : (int) offset limit : (int) limit category : (NSString*) category;
//
//- (void) getInsightSearchList  :(void (^)(NSDictionary *dict, NSError *error))block offset : (int) offset limit : (int) limit category : (NSString*) category keyWord : (NSString*) keyWord;
//
//- (void) getRelatedInsightList  :(void (^)(NSDictionary *dict, NSError *error))block offset : (int) offset limit : (int) limit category : (NSString*) category articleId : (NSString*) articleId;
//
//- (void) getInsightDetail : (void (^)(NSXMLParser *XMLParser, NSError *error))block documentId : (NSString*) documentId articleId : (NSString*) articleId;
//
//- (void) addArtToReadingList : (void (^)(NSDictionary *dict, NSError *error))block articleId : (NSString*) articleId;
//
//- (void) getLocatorATMList:(void (^)(NSArray *array, NSError *error))block latitude:(float)lat longitude:(float)lon maxCount:(int)maxCount;
//
//- (void) getLocatorByServiceCode:(void (^)(NSArray *array, NSError *error))block serviceCode:(NSString *)serviceCode latitude:(float)lat longitude:(float)lon maxCount:(int)maxCount;


@end
