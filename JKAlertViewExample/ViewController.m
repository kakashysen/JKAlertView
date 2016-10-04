//
//  ViewController.m
//  JKAlertView
//
//  Created by Jose Aponte on 10/4/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "ViewController.h"
#import "JKAlertView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAlertAction:(id)sender
{
    JKAlertView *alertView = [[JKAlertView alloc] initWithFontName:@"verdana"];
    alertView.headerImage = [UIImage imageNamed:@"bg_img.jpg"];
    alertView.url = @"https://google.com";
    alertView.linkText = @"google.com";
    alertView.titleText = @"Diseño Grafico";
    alertView.detailText = @"La definición de la profesión del diseñador gráfico es más bien reciente, en lo que se refiere a su preparación, su actividad y sus objetivos.";
    alertView.footerText = @"Terminos y Condiciones";
    [alertView show];
}
- (IBAction)showCustomAlertAction:(id)sender
{
    JKAlertView *alertView = [[JKAlertView alloc] initWithFontName:@"verdana"];
    alertView.headerImage = [UIImage imageNamed:@"dbz.jpg"];
    alertView.url = @"https://google.com";
    alertView.backgroundContentColor = [UIColor orangeColor];
    alertView.linkText = @"google.com";
    alertView.titleText = @"Alerta";
    alertView.detailText = @"Hijo de Bardock y Gine, nace en el año 737 con el nombre de Kakarot / Kakarotto, existen dos versiones sobre su nacimiento y origen.";
    alertView.footerText = @"Terminos y Condiciones";
    alertView.titleTextColor = [UIColor whiteColor];
    alertView.detailTextColor = [UIColor whiteColor];
    alertView.footerTextColor = [UIColor whiteColor];
    alertView.linkTextColor = [UIColor whiteColor];
    
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
