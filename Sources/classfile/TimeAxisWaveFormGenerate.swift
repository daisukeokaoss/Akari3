//
//  TimeAxisWaveFormGenerate.swift
//  EasyCamery
//
//  Created by 岡大輔 on 2018/07/03.
//  Copyright © 2018年 koherent.org. All rights reserved.
//

import UIKit
import EasyImagy

public class TimeAxisWaveFormGenerate: NSObject {
    //extract TimeAxisWaveForm from Image
    public class func extractRTimeAxisWaveFormFromImage(inputImage:Image<RGBA<UInt8>>)->Array<Double>
    {
        var timeAxisWaveForm:Array<Double> = Array(repeating: 0, count: inputImage.width)
        for w in 0..<inputImage.width{
            for h in 0..<inputImage.height{
                timeAxisWaveForm[w] += Double(inputImage[w,h].redInt)
            }
        }
        return timeAxisWaveForm
    }
    
    public class func extractGTimeAxisWaveFormFromImage(inputImage:Image<RGBA<UInt8>>)->Array<Double>
    {
        var timeAxisWaveForm:Array<Double> = Array(repeating: 0, count: inputImage.width)
        for w in 0..<inputImage.width{
            for h in 0..<inputImage.height{
                timeAxisWaveForm[w] += Double(inputImage[w,h].greenInt)
            }
        }
        return timeAxisWaveForm
    }
    
    public class func extractBTimeAxisWaveFormFromImage(inputImage:Image<RGBA<UInt8>>)->Array<Double>
    {
        var timeAxisWaveForm:Array<Double> = Array(repeating: 0, count: inputImage.width)
        for w in 0..<inputImage.width{
            for h in 0..<inputImage.height{
                timeAxisWaveForm[w] += Double(inputImage[w,h].blueInt)
            }
        }
        return timeAxisWaveForm
    }

}
