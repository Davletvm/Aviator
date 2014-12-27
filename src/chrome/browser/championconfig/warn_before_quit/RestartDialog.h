// Copyright (c) [2013-2015] WhiteHat. All Rights Reserved. WhiteHat contributions included 
// in this file are licensed under the BSD-3-clause license (the "License") included in 
// the WhiteHat-LICENSE file included in the root directory of the distributed source code 
// archive. Unless required by applicable law or agreed to in writing, software distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
// ANY KIND, either express or implied. See the License for the specific language governing 
// permissions and limitations under the License. 
#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h> // champion

@interface RestartDialog : NSWindowController
	<NSWindowDelegate>
{
	// outlets
	IBOutlet NSImageView*   imageView ;
	NSImageView*			dockImageView	;
	NSString*				imagePath		;
	IBOutlet NSButton*   butOK ;
    IBOutlet NSButton*   butCANCEL ;
}

- (IBAction) okButtonAction:(id)sender;
- (IBAction) cancelButtonAction:(id)sender;  	

// property getters/setters

- (void) setImagePath:(NSString*)aImagePath;

// property getters/setters

// methods

+(RestartDialog*)sharedMySingleton;

@end

