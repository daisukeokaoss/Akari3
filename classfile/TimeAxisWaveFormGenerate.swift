//
//  TimeAxisWaveFormGenerate.swift
//  EasyCamery
//
//  Created by 岡大輔 on 2018/07/03.
//  Copyright © 2018年 koherent.org. All rights reserved.
//

import UIKit
import EasyImagy

class TimeAxisWaveFormGenerate: NSObject {
    //extract TimeAxisWaveForm from Image
    class func extractRTimeAxisWaveFormFromImage(inputImage:Image<RGBA<UInt8>>)->Array<UInt64>
    {
        var timeAxisWaveForm:Array<UInt64> = Array(repeating: 0, count: inputImage.width)
        for w in 0..<inputImage.width{
            for h in 0..<inputImage.height{
                timeAxisWaveForm[w] += UInt64(inputImage[w,h].redInt)
            }
        }
        return timeAxisWaveForm
    }
    
    class func extractGTimeAxisWaveFormFromImage(inputImage:Image<RGBA<UInt8>>)->Array<UInt64>
    {
        var timeAxisWaveForm:Array<UInt64> = Array(repeating: 0, count: inputImage.width)
        for w in 0..<inputImage.width{
            for h in 0..<inputImage.height{
                timeAxisWaveForm[w] += UInt64(inputImage[w,h].greenInt)
            }
        }
        return timeAxisWaveForm
    }
    
    class func extractBTimeAxisWaveFormFromImage(inputImage:Image<RGBA<UInt8>>)->Array<UInt64>
    {
        var timeAxisWaveForm:Array<UInt64> = Array(repeating: 0, count: inputImage.width)
        for w in 0..<inputImage.width{
            for h in 0..<inputImage.height{
                timeAxisWaveForm[w] += UInt64(inputImage[w,h].blueInt)
            }
        }
        return timeAxisWaveForm
    }

}
