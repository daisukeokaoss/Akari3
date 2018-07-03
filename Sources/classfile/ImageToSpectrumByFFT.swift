//
//  ImageToSpectrumByFFT.swift
//  EasyCamery
//
//  Created by 岡大輔 on 2018/07/03.
//  Copyright © 2018年 koherent.org. All rights reserved.
//

import UIKit
import EasyImagy
import Surge

public class ImageToSpectrumByFFT: NSObject {
    public class func ImageToSpectrumByFFTFunctionR(inputImage:Image<RGBA<UInt8>>)->Array<UInt64>
    {
        var timeAxisWaveForm = TimeAxisWaveFormGenerate.extractRTimeAxisWaveFormFromImage(inputImage: inputImage)
        fft(<#T##input: [Double]##[Double]#>)
        
    }
    public class func ImageToSpectrumByFFTFunctionG(inputImage:Image<RGBA<UInt8>>)->Array<UInt64>
    {
        var timeAxisWaveForm = TimeAxisWaveFormGenerate.extractGTimeAxisWaveFormFromImage(inputImage: inputImage)
    }
    public class func ImageToSpectrumByFFTFunctionB(inputImage:Image<RGBA<UInt8>>)->Array<UInt64>
    {
        var timeAxisWaveForm = TimeAxisWaveFormGenerate.extractBTimeAxisWaveFormFromImage(inputImage: inputImage)
    }
}
