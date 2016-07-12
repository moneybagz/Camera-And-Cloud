//
//  ViewController.m
//  Camera and Cloud
//
//  Created by Clyfford Millet on 7/8/16.
//  Copyright © 2016 Clyff IOS supercompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <Firebase.h>
//#import "UIColor+Hexadecimal.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:(38.0/255.0) green:(38.0/255.0) blue:(38.0/255.0) alpha:1.0]];
    
//    [UIColor colorWithHexString:@"#F2F2F2"];


    
    NSLog(@"HELLO WORLD");
    
    // Get a reference to the storage service, using the default Firebase App
    FIRStorage *storage = [FIRStorage storage];
    // Create a storage reference from our storage service
    FIRStorageReference *storageRef = [storage referenceForURL:@"gs://camera-and-cloud.appspot.com"];
    
    // Create a child reference
    // imagesRef now points to "images"
//    FIRStorageReference *imagesRef = [storageRef child:@"images"];
    // Child references can also take paths delimited by '/'
    // spaceRef now points to "images/space.jpg"
    // imagesRef still points to "images"
//    FIRStorageReference *sunflowerRef = [storageRef child:@"images/sunflower.jpg"];
    
    // This is equivalent to creating the full reference
//    FIRStorageReference *spaceRef = [storage referenceForURL:@"gs://camera-and-cloud.firebaseio.com/images/space.jpg"];
    
    
//    // Data in memory
//    UIImageView *sunflowerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo_08@3x.jpg"]];
//
//    NSData *data = UIImageJPEGRepresentation(sunflowerImage.image, 1);

 
    // Create a reference to the file you want to upload
    
    
    // Upload the file to the path "images/rivers.jpg"
//    FIRStorageUploadTask *uploadTask = [sunflowerRef putData:data metadata:nil completion:^(FIRStorageMetadata *metadata, NSError *error) {
//        if (error != nil) {
//            // Uh-oh, an error occurred!
//        } else {
//            // Metadata contains file metadata such as size, content-type, and download URL.
//            NSURL *downloadURL = metadata.downloadURL;
//        }
//    }];
    
//
//    NSURL *imageURL = [[NSBundle mainBundle]
//                    URLForResource: @"photo_08@3x" withExtension:@"jpg"];
//    
    NSString *path = [NSString stringWithFormat:@"file:%@", [[NSBundle mainBundle] pathForResource:@"photo" ofType:@"jpg"]];
    
    NSURL *imageURL = [NSURL URLWithString:path];
    
    NSLog(@"%@",path);
    
    [[storageRef child:@"images/sunflower.jpg"]
     putFile:imageURL metadata:nil
     completion:^(FIRStorageMetadata *metadata, NSError *error) {
         if (error) {
             NSLog(@"Error uploading: %@", error);
            
             return;
         }
//         [self uploadSuccess:metadata storageetadaPath:filePath];
         NSLog(@"Success??????????????????????????????????????????????");
     }];
    
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)uploadSuccess:(FIRStorageMetadata *) metadata storagePath: (NSString *) storagePath {
//    NSLog(@"Upload Succeeded!");
//    _urlTextView.text = [metadata.downloadURL absoluteString];
//    [[NSUserDefaults standardUserDefaults] setObject:storagePath forKey:@"storagePath"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    _downloadPicButton.enabled = YES;
//}

@end
