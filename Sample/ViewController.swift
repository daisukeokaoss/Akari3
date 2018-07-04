import UIKit
import AVFoundation
import EasyCamery
import EasyImagy


class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    private let camera: Camera<RGBA<UInt8>> = try! Camera(sessionPreset: .vga640x480, focusMode: .continuousAutoFocus)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        camera.start { [weak self] image in
            // Makes `image` negative
            image = (self?.plotTimeAxisWaveForm(inputImage: image))!
            image.update { pixel in
                //pixel.red = 255 - pixel.red
                //pixel.green = 255 - pixel.green
                //pixel.blue = 255 -
            }
            
            self?.imageView.image = image.uiImage(orientedTo: UIApplication.shared.cameraOrientation)
        }
    }
    
    func plotTimeAxisWaveForm(inputImage:Image<RGBA<UInt8>>)->Image<RGBA<UInt8>>
    {
        //let timeAxisWaveFrom = TimeAxisWaveFormGenerate.extractRTimeAxisWaveFormFromImage(inputImage: inputImage)
        let timeAxisWaveFrom = ImageToSpectrumByFFT.ImageToSpectrumByFFTFunctionR(inputImage: inputImage)
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
