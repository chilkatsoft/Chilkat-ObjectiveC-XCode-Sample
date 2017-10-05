// Chilkat Objective-C header.
// This is a generated header file for Chilkat version 9.5.0.69

// Generic/internal class name =  Ecc
// Wrapped Chilkat C++ class name =  CkEcc

@class CkoPrng;
@class CkoPrivateKey;
@class CkoPublicKey;


@interface CkoEcc : NSObject {

	@private
		void *m_obj;

}

- (id)init;
- (void)dealloc;
- (void)dispose;
- (NSString *)stringWithUtf8: (const char *)s;
- (void *)CppImplObj;
- (void)setCppImplObj: (void *)pObj;

- (void)clearCppImplObj;

@property (nonatomic, copy) NSString *DebugLogFilePath;
@property (nonatomic, readonly, copy) NSString *LastErrorHtml;
@property (nonatomic, readonly, copy) NSString *LastErrorText;
@property (nonatomic, readonly, copy) NSString *LastErrorXml;
@property (nonatomic) BOOL LastMethodSuccess;
@property (nonatomic) BOOL VerboseLogging;
@property (nonatomic, readonly, copy) NSString *Version;
// method: GenEccKey
- (CkoPrivateKey *)GenEccKey: (NSString *)curveName 
	prng: (CkoPrng *)prng;
// method: GenEccKey2
- (CkoPrivateKey *)GenEccKey2: (NSString *)curveName 
	encodedK: (NSString *)encodedK 
	encoding: (NSString *)encoding;
// method: SaveLastError
- (BOOL)SaveLastError: (NSString *)path;
// method: SharedSecretENC
- (NSString *)SharedSecretENC: (CkoPrivateKey *)privKey 
	pubKey: (CkoPublicKey *)pubKey 
	encoding: (NSString *)encoding;
// method: SignHashENC
- (NSString *)SignHashENC: (NSString *)encodedHash 
	encoding: (NSString *)encoding 
	privkey: (CkoPrivateKey *)privkey 
	prng: (CkoPrng *)prng;
// method: VerifyHashENC
- (NSNumber *)VerifyHashENC: (NSString *)encodedHash 
	encodedSig: (NSString *)encodedSig 
	encoding: (NSString *)encoding 
	pubkey: (CkoPublicKey *)pubkey;

@end
