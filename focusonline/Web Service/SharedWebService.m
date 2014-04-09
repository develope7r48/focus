//
//  SharedWebService.m
//  YourDBS
//
//  Created by CBG Team on 24/10/13.
//
//

#import "SharedWebService.h"
#import "SharedClass.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "AFXMLRequestOperation.h"

@implementation SharedWebService

+ (SharedWebService*)sharedInstance
{
    static SharedWebService *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[SharedWebService alloc] init];
    });
    
    return _sharedInstance;
}

/*
AccessToken uuid:"ff0799e3-6a07-48af-bfa2-af7c549c2f57";country:"sg";language:"en";segment:"sme";hashkey:"dummykey"
 
 Send the HTTP header in above format and order

 HTTPheader custom field: Authorization
*/
- (void)addHeadersTo:(NSMutableURLRequest *)request
{
  
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
}


- (void) getResponseDataBaseOnUrlAndParameters :(void (^)(id object, NSError *error))block url : (NSString*) url  parameters:(NSDictionary *)parameters httpMethod : (NSString*) httpMethod
{
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[Configuration notificationBaseURL]]];
    
    if([httpMethod isEqualToString:@"POST"]){
        httpClient.parameterEncoding = AFJSONParameterEncoding;
    }else{
        httpClient.parameterEncoding = AFFormURLParameterEncoding;
    }
    [httpClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[httpClient setDefaultHeader:@"Accept" value:@"application/json"];
 
    
    DLog(@"Parameters : %@",parameters);
    NSMutableURLRequest *request = [httpClient requestWithMethod:httpMethod path:url parameters:parameters];
    [self addHeadersTo:request];
     DLog(@"HttpHeader: %@", request.allHTTPHeaderFields);
    

    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObjects:@"application/json", nil]];
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc] initWithRequest:request];

    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSDictionary *raw = [NSDictionary dictionaryWithDictionary:(NSDictionary*)responseObject];
        
        DLog(@"%@",responseObject);
        
        BOOL showError = NO;
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *raw = (NSDictionary *)responseObject;
            showError = (raw.count <= 0);
        }
        else if ([responseObject isKindOfClass:[NSArray class]])
        {
            NSArray *raw = (NSArray *)responseObject;
            showError = (raw.count <= 0);
        }
        if (showError)
            [SharedClass showSingletonDialog:NSLocalizedString(@"Web service provider issue", nil) message:nil okButton:YES withDelegate:nil];
        
        if (block)
        {
            block(responseObject, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%@", error.description);
        
        [SharedClass showSingletonDialog:NSLocalizedString(@"Network connectivity issue", nil) message:nil okButton:YES withDelegate:nil];
        if(block){
            block(nil,error);
        }
    }];
    [operation start];
}


- (void) getXmlResponseDataBaseOnUrlAndParameters :(void (^)(NSXMLParser *XMLParser, NSError *error))block url : (NSString*) url  parameters:(NSDictionary *)parameters httpMethod : (NSString*) httpMethod {
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[Configuration notificationBaseURL]]];
    httpClient.parameterEncoding = AFFormURLParameterEncoding;
    
    [httpClient registerHTTPOperationClass:[AFXMLRequestOperation class]];
    
    [httpClient setDefaultHeader:@"Accept" value:@"application/xml"];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:httpMethod path:url parameters:parameters];
    [self addHeadersTo:request];
    
    
    AFXMLRequestOperation *operation =
    [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request
                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser) {
                                                            /*
                                                            XMLParser.delegate = self;
                                                            [XMLParser setShouldProcessNamespaces:YES];
                                                            [XMLParser parse];
                                                             */
                                                            DLog(@"%@",response);
                                                            if(block){
                                                                block(XMLParser,nil);
                                                            }
                                                            
                                                        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser) {
                                                            DLog(@"%@", error.description);
                                                            if(block){
                                                                block(nil,error);
                                                            }
                                                        }];
    
    
    [operation start];
}



- (void) registerForPushNotification : (void (^)(NSDictionary *dict, NSError *error))block deviceType : (NSString*) aDeviceType deviceToken : (NSString*) aDeviceToken {
    if (aDeviceType.length == 0 || aDeviceToken.length == 0)
        return;
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjects:[[NSArray alloc]initWithObjects:aDeviceType,aDeviceToken, nil ] forKeys:[[NSArray alloc]initWithObjects:@"DeviceType",@"Token", nil]];

    [self getResponseDataBaseOnUrlAndParameters:block url:@"api/registration" parameters:parameters httpMethod:@"POST"];
}


@end
