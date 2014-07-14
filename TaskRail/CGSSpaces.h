/*
 * Header for undocumented Spaces APIs
 * From xnomad project:
 * https://github.com/fjolnir/xnomad/blob/master/CGSPrivate.h
 * discovered via puffnfresh github gist:
 * https://gist.github.com/puffnfresh/4053980
 */

#include <Carbon/Carbon.h>

typedef void *CGSConnectionID;
extern CGSConnectionID _CGSDefaultConnection(void);
#define CGSDefaultConnection _CGSDefaultConnection()

typedef uint64_t CGSSpace;
typedef enum _CGSSpaceType {
  kCGSSpaceUser,
  kCGSSpaceFullscreen,
  kCGSSpaceSystem,
  kCGSSpaceUnknown
} CGSSpaceType;
typedef enum _CGSSpaceSelector {
  kCGSSpaceCurrent = 5,
  kCGSSpaceOther,
  kCGSSpaceAll
} CGSSpaceSelector;

extern CFArrayRef CGSCopySpaces(const CGSConnectionID cid, CGSSpaceSelector type);

extern NSNumber *CGSWillSwitchSpaces(const CGSConnectionID cid, CFArrayRef a);

extern CFArrayRef CGSSpaceCopyOwners(const CGSConnectionID cid, CGSSpace space);

extern int CGSSpaceGetAbsoluteLevel(const CGSConnectionID cid, CGSSpace space);
extern void CGSSpaceSetAbsoluteLevel(const CGSConnectionID cid, CGSSpace space, int level);

extern int CGSSpaceGetCompatID(const CGSConnectionID cid, CGSSpace space);
extern void CGSSpaceSetCompatID(const CGSConnectionID cid, CGSSpace space, int compatID);

extern CGSSpaceType CGSSpaceGetType(const CGSConnectionID cid, CGSSpace space);
extern void CGSSpaceSetType(const CGSConnectionID cid, CGSSpace space, CGSSpaceType type);

extern CFStringRef CGSSpaceCopyName(const CGSConnectionID cid, CGSSpace space);
extern void CGSSpaceSetName(const CGSConnectionID cid, CGSSpace space, CFStringRef name);

extern CFArrayRef CGSSpaceCopyValues(const CGSConnectionID cid, CGSSpace space);
extern void CGSSpaceSetValues(const CGSConnectionID cid, CGSSpace space, CFArrayRef values);

typedef uint64_t CGSManagedDisplay;
extern CGSManagedDisplay kCGSPackagesMainDisplayIdentifier;

extern CFArrayRef CGSCopyManagedDisplaySpaces(const CGSConnectionID cid);

extern bool CGSManagedDisplayIsAnimating(const CGSConnectionID cid, CGSManagedDisplay display);
extern void CGSManagedDisplaySetIsAnimating(const CGSConnectionID cid, CGSManagedDisplay display,
                                            bool isAnimating);
extern void CGSManagedDisplaySetCurrentSpace(const CGSConnectionID cid, CGSManagedDisplay display,
                                             CGSSpace space);

//extern void CGSSpaceSetShape(const CGSConnectionID cid, CGSSpace space, CGSRegionObj shape);

extern void CGSSpaceSetTransform(const CGSConnectionID cid, CGSSpace space,
                                 CGAffineTransform transform);

extern void CGSHideSpaces(const CGSConnectionID cid, NSArray *spaces);
extern void CGSShowSpaces(const CGSConnectionID cid, NSArray *spaces);