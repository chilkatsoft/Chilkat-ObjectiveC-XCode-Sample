// Chilkat Objective-C header.
// This is a generated header file for Chilkat version 9.5.0.59

// Generic/internal class name =  StringBuilder
// Wrapped Chilkat C++ class name =  CkStringBuilder



@interface CkoStringBuilder : NSObject {

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

@property (nonatomic, readonly, copy) NSNumber *Length;
// method: Append
- (BOOL)Append: (NSString *)value;
// method: AppendEncoded
- (BOOL)AppendEncoded: (NSData *)binaryData 
	encoding: (NSString *)encoding;
// method: AppendInt
- (BOOL)AppendInt: (NSNumber *)value;
// method: AppendInt64
- (BOOL)AppendInt64: (NSNumber *)value;
// method: Clear
- (void)Clear;
// method: Contains
- (BOOL)Contains: (NSString *)str 
	caseSensitive: (BOOL)caseSensitive;
// method: Equals
- (BOOL)Equals: (NSString *)str 
	caseSensitive: (BOOL)caseSensitive;
// method: GetAsString
- (NSString *)GetAsString;
// method: Replace
- (void)Replace: (NSString *)value 
	replacement: (NSString *)replacement;

@end
