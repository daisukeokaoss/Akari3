import UIKit
import AVFoundation
import EasyCamery
import EasyImagy


class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    private let camera: Camera<RGBA<UInt8>> = try! Camera(sessionPreset: .vga640x480, focusMode: .continuousAutoFocus)
    private var FFTCount = 0;
    private var MAXFFTCount = 10;
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        camera.start { [weak self] image in
            // Makes `image` negative
           
            image.update { pixel in
                //pixel.red = 255 - pixel.red
                //pixel.green = 255 - pixel.green
                //pixel.blue = 255 -
            }
            
            if(self?.FFTCount == 0){
                 image = (self?.plotTimeAxisWaveForm(inputImage: image))!
                self?.imageView.image = image.uiImage(orientedTo: UIApplication.shared.cameraOrientation)
                self?.FFTCount = (self?.MAXFFTCount)!;
            }
            self?.FFTCount -= 1
            
            
        }
    }
    
    func plotTimeAxisWaveForm(inputImage:Image<RGBA<UInt8>>)->Image<RGBA<UInt8>>
    {
        //let timeAxisWaveFrom = TimeAxisWaveFormGenerate.extractRTimeAxisWaveFormFromImage(inputImage: inputImage)
        let timeAxisWaveFrom = ImageToSpectrumByFFT.ImageToSpectrumByFFTFunctionWhite(inputImage: inputImage)
        return TimeAxisWaveFormPlot.plotTimeAxisWaveFormR(inputImage: inputImage, timeAxisWaveForm: timeAxisWaveFrom)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        camera.stop()
        
        super.viewWillDisappear(animated)
    }
}

extension Image where Pixel == RGBA<UInt8> {
    func uiImage(orientedTo orientation: UIImageOrientation) -> UIImage {
        return UIImage(cgImage: cgImage, scale: 1.0, orientation: orientation)
    }
}

extension UIApplication {
    var cameraOrientation: UIImageOrientation {
        switch statusBarOrientation {
        case .portrait:           return .right
        case .landscapeRight:     return .up
        case .portraitUpsideDown: return .left
        case .landscapeLeft:      return .down
        case .unknown:            return .right
        }
    }
}
