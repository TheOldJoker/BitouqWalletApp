#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UIViewController+YHModaTransitonHelper.h"
#import "YHAnimationManager.h"
#import "YHCAAimationModalTransition.h"
#import "YHModaAnimationManager.h"
#import "YHModaTransitionHelper.h"
#import "YHPresentationController.h"

FOUNDATION_EXPORT double YHModaTransitonHelperVersionNumber;
FOUNDATION_EXPORT const unsigned char YHModaTransitonHelperVersionString[];

