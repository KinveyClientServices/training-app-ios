// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.1 clang-703.0.29)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import ObjectiveC;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"


/// This class represents the ACL (Access Control List) for a record.
SWIFT_CLASS_NAMED("Acl")
@interface KNVAcl : NSObject

/// The userId of the User used to create the record.
@property (nonatomic, readonly, copy) NSString * _Nonnull creator;

/// Specifies the list of user _ids that are explicitly allowed to read the entity.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nullable readers;

/// Specifies the list of user _ids that are explicitly allowed to modify the entity.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nullable writers;

/// Constructor used to build a new Acl instance from a JSON object.
- (nullable instancetype)initWithJson:(NSDictionary<NSString *, id> * _Nonnull)json;

/// The JSON representation for the Acl instance.
- (NSDictionary<NSString *, id> * _Nonnull)toJson;
@end

@class __KNVUser;
@class NSURL;
@class KNVPush;
@class KNVMigration;
@class NSData;


/// This class provides a representation of a Kinvey environment holding App ID and App Secret. Please never use a Master Secret in a client application.
SWIFT_CLASS_NAMED("Client")
@interface __KNVClient : NSObject

/// Shared client instance for simplicity. Use this instance if you don't need to handle with multiple Kinvey environments.
+ (__KNVClient * _Nonnull)sharedClient;

/// It holds the User instance after logged in. If this variable is nil means that there's no logged user, which is necessary for some calls to in a Kinvey environment.
@property (nonatomic, readonly, strong) __KNVUser * _Nullable activeUser;

/// Holds the App ID for a specific Kinvey environment.
@property (nonatomic, readonly, copy) NSString * _Nullable appKey;

/// Holds the App Secret for a specific Kinvey environment.
@property (nonatomic, readonly, copy) NSString * _Nullable appSecret;

/// Holds the Host for a specific Kinvey environment. The default value is https://baas.kinvey.com/
@property (nonatomic, readonly, strong) NSURL * _Nonnull apiHostName;

/// Holds the Authentication Host for a specific Kinvey environment. The default value is https://auth.kinvey.com/
@property (nonatomic, readonly, strong) NSURL * _Nonnull authHostName;

/// Cache policy for this client instance.
@property (nonatomic) NSURLRequestCachePolicy cachePolicy;

/// Timeout interval for this client instance.
@property (nonatomic) NSTimeInterval timeoutInterval;

/// App version for this client instance.
@property (nonatomic, copy) NSString * _Nullable clientAppVersion;

/// Custom request properties for this client instance.
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> * _Nonnull customRequestProperties;

/// The default value for apiHostName variable.
+ (NSURL * _Nonnull)defaultApiHostName;

/// The default value for authHostName variable.
+ (NSURL * _Nonnull)defaultAuthHostName;

/// Set a different schema version to perform migrations in your local cache.
@property (nonatomic, readonly) unsigned long long schemaVersion;

/// Use this variable to handle push notifications.
@property (nonatomic, readonly, strong) KNVPush * _Null_unspecified push;

/// Set a different type if you need a custom User class. Extends from User allows you to have custom properties in your User instances.
@property (nonatomic) SWIFT_METATYPE(__KNVUser) _Nonnull userType;

/// Default Value for DataStore tag
+ (NSString * _Nonnull)defaultTag;

/// Default constructor. The initialize method still need to be called after instanciate a new instance.
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// This method is called automatically before use any usage of the Client class.
+ (void)initialize;

/// Constructor that already initialize the client. The initialize method is called automatically.
- (nonnull instancetype)initWithAppKey:(NSString * _Nonnull)appKey appSecret:(NSString * _Nonnull)appSecret apiHostName:(NSURL * _Nonnull)apiHostName authHostName:(NSURL * _Nonnull)authHostName;

/// Initialize a Client instance with all the needed parameters and requires a boolean to encrypt or not any store created using this client instance.
- (__KNVClient * _Nonnull)initializeWithAppKey:(NSString * _Nonnull)appKey appSecret:(NSString * _Nonnull)appSecret apiHostName:(NSURL * _Nonnull)apiHostName authHostName:(NSURL * _Nonnull)authHostName encrypted:(BOOL)encrypted schemaVersion:(unsigned long long)schemaVersion migrationHandler:(void (^ _Nullable)(KNVMigration * _Nonnull, unsigned long long))migrationHandler;

/// Initialize a Client instance with all the needed parameters.
- (__KNVClient * _Nonnull)initializeWithAppKey:(NSString * _Nonnull)appKey appSecret:(NSString * _Nonnull)appSecret apiHostName:(NSURL * _Nonnull)apiHostName authHostName:(NSURL * _Nonnull)authHostName encryptionKey:(NSData * _Nullable)encryptionKey schemaVersion:(unsigned long long)schemaVersion migrationHandler:(void (^ _Nullable)(KNVMigration * _Nonnull, unsigned long long))migrationHandler;

/// Autorization header used for calls that don't requires a logged User.
@property (nonatomic, readonly, copy) NSString * _Nullable authorizationHeader;
@end



/// Class to interact with a custom endpoint in the backend.
SWIFT_CLASS_NAMED("CustomEndpoint")
@interface KNVCustomEndpoint : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class KNVMetadata;
@class NSDate;


/// Class that represents a file in the backend holding all metadata of the file, but don't hold the data itself.
SWIFT_CLASS_NAMED("File")
@interface KNVFile : NSObject

/// _id property of the file.
@property (nonatomic, copy) NSString * _Nullable fileId;

/// _filename property of the file.
@property (nonatomic, copy) NSString * _Nullable fileName;

/// mimeType property of the file.
@property (nonatomic, copy) NSString * _Nullable mimeType;

/// _public property of the file, which represents if the file is accessible without need of credentials.
@property (nonatomic) BOOL publicAccessible;

/// _acl property of the file.
@property (nonatomic, strong) KNVAcl * _Nullable acl;

/// _kmd property of the file.
@property (nonatomic, strong) KNVMetadata * _Nullable metadata;

/// Temporary download URL of the file.
@property (nonatomic, strong) NSURL * _Nullable downloadURL;

/// Expiration data of the downloadURL.
@property (nonatomic, strong) NSDate * _Nullable expiresAt;
@end



/// Protocol used to serialize and deserialize JSON objects into objects.
SWIFT_PROTOCOL_NAMED("JsonObject")
@protocol KNVJsonObject
@optional

/// Deserialize JSON object into object.
- (void)fromJson:(NSDictionary<NSString *, id> * _Nonnull)json;

/// Serialize object to JSON.
- (NSDictionary<NSString *, id> * _Nonnull)toJson;
@end



/// This class represents the metadata information for a record
SWIFT_CLASS_NAMED("Metadata")
@interface KNVMetadata : NSObject

/// Last Modification Time Key.
+ (NSString * _Nonnull)LmtKey;

/// Entity Creation Time Key.
+ (NSString * _Nonnull)EctKey;

/// Authentication Token Key.
+ (NSString * _Nonnull)AuthTokenKey;

/// Last Modification Time.
@property (nonatomic, strong) NSDate * _Nullable lmt;

/// Entity Creation Time.
@property (nonatomic, strong) NSDate * _Nullable ect;

/// Authentication Token.
@property (nonatomic, readonly, copy) NSString * _Nullable authtoken;

/// Default Constructor
- (nonnull instancetype)initWithLmt:(NSString * _Nullable)lmt ect:(NSString * _Nullable)ect authtoken:(NSString * _Nullable)authtoken OBJC_DESIGNATED_INITIALIZER;

/// Constructor used to build a new Metadata instance from a JSON object.
- (nonnull instancetype)initWithJson:(NSDictionary<NSString *, id> * _Nonnull)json;

/// The JSON representation for the Metadata instance.
- (NSDictionary<NSString *, id> * _Nonnull)toJson;
@end



/// Class used to perform migrations in your local cache.
SWIFT_CLASS_NAMED("Migration")
@interface KNVMigration : NSObject

/// Method that performs a migration in a specific collection.
- (void)execute:(Class _Nonnull)persistableClass migrationObjectHandler:(NSDictionary<NSString *, id> * _Nullable (^ _Nullable)(NSDictionary<NSString *, id> * _Nonnull))migrationObjectHandler;
@end


@interface NSData (SWIFT_EXTENSION(Kinvey))
@end


@interface NSDate (SWIFT_EXTENSION(Kinvey))
@end


@interface NSString (SWIFT_EXTENSION(Kinvey))
@end



/// Protocol that turns a NSObject into a persistable class to be used in a DataStore.
SWIFT_PROTOCOL_NAMED("Persistable")
@protocol KNVPersistable <KNVJsonObject, NSObject>

/// Provides the collection name to be matched with the backend.
+ (NSString * _Nonnull)kinveyCollectionName;

/// Provides the property mapping to be matched with the backend.
+ (NSDictionary<NSString *, NSString *> * _Nonnull)kinveyPropertyMapping;
@end



/// Class used to register and unregister a device to receive push notifications.
SWIFT_CLASS_NAMED("Push")
@interface KNVPush : NSObject

/// Sets and returns the number for the icon badge for the current running app.
@property (nonatomic) NSInteger badgeNumber;

/// Resets the badge number to zero.
- (void)resetBadgeNumber;
@end

@class NSPredicate;
@class NSSortDescriptor;


/// Class that represents a query including filters and sorts.
SWIFT_CLASS_NAMED("Query")
@interface KNVQuery : NSObject

/// NSPredicate used to filter records.
@property (nonatomic, strong) NSPredicate * _Nullable predicate;

/// Array of NSSortDescriptors used to sort records.
@property (nonatomic, copy) NSArray<NSSortDescriptor *> * _Nullable sortDescriptors;

/// Default Constructor.
- (nonnull instancetype)init;

/// Constructor using a NSPredicate to filter records.
- (nonnull instancetype)initWithPredicate:(NSPredicate * _Nonnull)predicate;

/// Constructor using an array of NSSortDescriptors to sort records.
- (nonnull instancetype)initWithSortDescriptors:(NSArray<NSSortDescriptor *> * _Nonnull)sortDescriptors;

/// Constructor using a NSPredicate to filter records and an array of NSSortDescriptors to sort records.
- (nonnull instancetype)initWithPredicate:(NSPredicate * _Nullable)predicate sortDescriptors:(NSArray<NSSortDescriptor *> * _Nullable)sortDescriptors;

/// Constructor using a similar way to construct a NSPredicate.
- (nonnull instancetype)initWithFormat:(NSString * _Nonnull)format argumentArray:(NSArray * _Nullable)argumentArray;
@end


@interface KNVQuery (SWIFT_EXTENSION(Kinvey))
@end


/// Policy that describes how a read operation should perform.
typedef SWIFT_ENUM(NSUInteger, ReadPolicy) {

/// Doesn't hit the network, forcing the data to be read only from the local cache.
  ReadPolicyForceLocal = 0,

/// Doesn't hit the local cache, forcing the data to be read only from the network (backend).
  ReadPolicyForceNetwork = 1,

/// Read first from the local cache and then try to get data from the network (backend).
  ReadPolicyBoth = 2,
};



/// Protocol that represents a request made to the backend.
SWIFT_PROTOCOL_NAMED("Request")
@protocol KNVRequest

/// Indicates if a request still executing or not.
@property (nonatomic, readonly) BOOL executing;

/// Indicates if a request was cancelled or not.
@property (nonatomic, readonly) BOOL cancelled;

/// Cancels a request in progress.
- (void)cancel;
@end



/// Class that represents an User.
SWIFT_CLASS_NAMED("User")
@interface __KNVUser : NSObject

/// Username Key.
+ (NSString * _Nonnull)PersistableUsernameKey;

/// _id property of the user.
@property (nonatomic, readonly, copy) NSString * _Nonnull userId;

/// _acl property of the user.
@property (nonatomic, readonly, strong) KNVAcl * _Nullable acl;

/// _kmd property of the user.
@property (nonatomic, readonly, strong) KNVMetadata * _Nullable metadata;

/// username property of the user.
@property (nonatomic, copy) NSString * _Nullable username;

/// email property of the user.
@property (nonatomic, copy) NSString * _Nullable email;

/// Default Constructor.
- (nonnull instancetype)initWithUserId:(NSString * _Nonnull)userId acl:(KNVAcl * _Nullable)acl metadata:(KNVMetadata * _Nullable)metadata client:(__KNVClient * _Nonnull)client OBJC_DESIGNATED_INITIALIZER;

/// Constructor used to build a new User instance from a JSON object.
- (nullable instancetype)initWithJson:(NSDictionary<NSString *, id> * _Nonnull)json client:(__KNVClient * _Nonnull)client OBJC_DESIGNATED_INITIALIZER;

/// The JSON representation for the User instance.
- (NSDictionary<NSString *, id> * _Nonnull)toJson;

/// Sign out the current active user.
- (void)logout;

/// Autorization header used for calls that requires a logged User.
@property (nonatomic, readonly, copy) NSString * _Nullable authorizationHeader;
@end

@class NSError;

@interface __KNVUser (SWIFT_EXTENSION(Kinvey))

/// Checks if a username already exists or not.
+ (id <KNVRequest> _Nonnull)existsWithUsername:(NSString * _Nonnull)username client:(__KNVClient * _Nonnull)client completionHandler:(void (^ _Nullable)(BOOL, NSError * _Nullable))completionHandler;

/// Sign in a user and set as a current active user.
+ (id <KNVRequest> _Nonnull)loginWithUsername:(NSString * _Nonnull)username password:(NSString * _Nonnull)password client:(__KNVClient * _Nonnull)client completionHandler:(void (^ _Nullable)(__KNVUser * _Nullable, NSError * _Nullable))completionHandler;

/// Creates a new User taking (optionally) a username and password. If no username or password was provided, random values will be generated automatically.
+ (id <KNVRequest> _Nonnull)signupWithUsername:(NSString * _Nullable)username password:(NSString * _Nullable)password client:(__KNVClient * _Nonnull)client completionHandler:(void (^ _Nullable)(__KNVUser * _Nullable, NSError * _Nullable))completionHandler;

/// Deletes a User by the userId property.
+ (id <KNVRequest> _Nonnull)destroyWithUserId:(NSString * _Nonnull)userId hard:(BOOL)hard client:(__KNVClient * _Nonnull)client completionHandler:(void (^ _Nullable)(NSError * _Nullable))completionHandler;

/// Deletes the User.
- (id <KNVRequest> _Nonnull)destroyWithHard:(BOOL)hard client:(__KNVClient * _Nonnull)client completionHandler:(void (^ _Nullable)(NSError * _Nullable))completionHandler;

/// Gets a User instance using the userId property.
+ (id <KNVRequest> _Nonnull)getWithUserId:(NSString * _Nonnull)userId client:(__KNVClient * _Nonnull)client completionHandler:(void (^ _Nullable)(__KNVUser * _Nullable, NSError * _Nullable))completionHandler;

/// Creates or updates a User.
- (id <KNVRequest> _Nonnull)saveWithClient:(__KNVClient * _Nonnull)client completionHandler:(void (^ _Nullable)(__KNVUser * _Nullable, NSError * _Nullable))completionHandler;

/// Presents the MIC View Controller to sign in a user using MIC (Mobile Identity Connect).
+ (void)presentMICViewControllerWithRedirectURI:(NSURL * _Nonnull)redirectURI timeout:(NSTimeInterval)timeout client:(__KNVClient * _Nonnull)client completionHandler:(void (^ _Nullable)(__KNVUser * _Nullable, NSError * _Nullable))completionHandler;

/// Presents the MIC View Controller to sign in a user using MIC (Mobile Identity Connect).
+ (void)presentMICViewControllerWithRedirectURI:(NSURL * _Nonnull)redirectURI timeout:(NSTimeInterval)timeout forceUIWebView:(BOOL)forceUIWebView client:(__KNVClient * _Nonnull)client completionHandler:(void (^ _Nullable)(__KNVUser * _Nullable, NSError * _Nullable))completionHandler;
@end


/// Policy that describes how a write operation should perform.
typedef SWIFT_ENUM(NSUInteger, WritePolicy) {

/// Writes in the local cache first and then try to write trought the network (backend).
  WritePolicyLocalThenNetwork = 0,

/// Doesn't hit the network, forcing to write the data only in the local cache.
  WritePolicyForceLocal = 1,

/// Doesn't hit the local cache, forcing to write the data only trought the network (backend).
  WritePolicyForceNetwork = 2,
};

#pragma clang diagnostic pop
