// Copyright (c) [2013-2015] WhiteHat. All Rights Reserved. WhiteHat contributions included 
// in this file are licensed under the BSD-3-clause license (the "License") included in 
// the WhiteHat-LICENSE file included in the root directory of the distributed source code 
// archive. Unless required by applicable law or agreed to in writing, software distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
// ANY KIND, either express or implied. See the License for the specific language governing 
// permissions and limitations under the License. 

#import "Dialogs.h"

// NSString* nIconPathChanged2 = @"iconPathChanged" ;

@implementation Dialogs

- (void) dealloc
{
	[nc release];
	[modalDialog    release];
	[dockImageView  release];
	[imagePath		release];
	[super dealloc];
}

- (void) setImagePath:(NSString*) aImagePath
{
	@try {
		[aImagePath retain] ;
		[imagePath release];
		imagePath = aImagePath;
	
		NSImage* image = [[NSImage alloc] initWithContentsOfFile:imagePath];
	   [imageView setImage:image];
		/*if ( image ) {
			[NSApp setApplicationIconImage: image];
			[imageView setImage:image];
		}*/
	}
	@catch (NSException * e) {
		NSLog(@"e = %@",e);
	}
	@finally {
		//
	}
	
}

- (void) iconPathChanged:(NSNotification*)note
{
	NSLog(@"dialogs.mm iconPathChanged %@",note);
	[self setImagePath: [note object]] ;

}

- (id) init
{
	self = [ super init] ;
	modalDialog	   = nil ;
	dockImageView  = nil ;
	imagePath	= nil ;
	
	/*nc = [[NSNotificationCenter defaultCenter]retain] ;
	[nc addObserver:self
		   selector:@selector(iconPathChanged:)
			   name:nIconPathChanged2
			 object:nil
	];

	// set up our default preferences
	NSMutableDictionary* dict = [[NSMutableDictionary alloc]init] ;
	[dict setObject:@"please type something here" forKey:@"typeHereString"] ;
	
	[[NSUserDefaultsController sharedUserDefaultsController] setInitialValues:dict];
	[[NSUserDefaultsController sharedUserDefaultsController] setAppliesImmediately:YES]; */
	
	////
	// find our bundle's icon image
// NSDictionary* infoDict	= [[NSBundle mainBundle] infoDictionary];
//	NSString*	  iconFile	= infoDict  ? [NSMutableString stringWithString:[infoDict objectForKey:@"CFBundleIconFile"]] : nil ;
//	NSString*	  iconPath	= iconFile  ? [NSString stringWithFormat:@"%@/%@.icns",[[NSBundle mainBundle]resourcePath],iconFile] : nil ;
	//champion
	//NSString*	  iconPath	= [NSString stringWithFormat:@"%@/product_logo_64_1.jpg",[[NSBundle mainBundle]resourcePath]] ;
	NSString*	  iconPath	= [NSString stringWithFormat:@"%@/quit.icns",[[NSBundle mainBundle]resourcePath]] ;
	NSLog(@"iconPath = %@",iconPath);
	[self setImagePath:iconPath];
	
	return self ;
}

- (void) createModalDialog
{
	if ( !modalDialog ) {
		NSLog(@"showSheet alloc init");
		modalDialog = [[DialogBoxController alloc]init] ;
		
		if ( modalDialog ) {
			// I've we dont do this, things are happy
			// I think it has something to do the default size of the box
			[modalDialog showWindow:self];
			[[modalDialog window]setDelegate:modalDialog];
			[modalDialog close];
		}
		if ( modalDialog ) {
			[modalDialog setImagePath:imagePath];
		}
	}
}

- (IBAction) showModal:(id)sender
{
	NSLog(@"showModal");
	[self createModalDialog];
	
	if ( modalDialog ) {
		NSLog(@"showModal runModalForWindow");
		int result = [NSApp runModalForWindow:[modalDialog window]];
		NSLog(@"result = %d",result) ;
	}
}




@end
