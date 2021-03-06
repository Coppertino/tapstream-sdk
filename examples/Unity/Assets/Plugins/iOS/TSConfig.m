#import "TSConfig.h"
#import "TSHelpers.h"

@implementation TSConfig

@synthesize hardware = hardware;
@synthesize odin1 = odin1;
#if TEST_IOS || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
@synthesize openUdid = openUdid;
@synthesize udid = udid;
@synthesize idfa = idfa;
@synthesize secureUdid = secureUdid;
#else
@synthesize serialNumber = serialNumber;
#endif

@synthesize collectWifiMac = collectWifiMac;

@synthesize installEventName = installEventName;
@synthesize openEventName = openEventName;

@synthesize fireAutomaticInstallEvent = fireAutomaticInstallEvent;
@synthesize fireAutomaticOpenEvent = fireAutomaticOpenEvent;


+ (id)configWithDefaults
{
	return AUTORELEASE([[self alloc] init]);
}

- (id)init
{
	if((self = [super init]) != nil)
	{
		collectWifiMac = YES;
		fireAutomaticInstallEvent = YES;
		fireAutomaticOpenEvent = YES;
	}
	return self;
}

- (void)dealloc
{
	RELEASE(hardware);
	RELEASE(odin1);
#if TEST_IOS || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
	RELEASE(openUdid);
	RELEASE(udid);
	RELEASE(idfa);
	RELEASE(secureUdid);
#else
	RELEASE(serialNumber);
#endif
	RELEASE(installEventName);
	RELEASE(openEventName);

	SUPER_DEALLOC;
}

@end