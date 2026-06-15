import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController

    let portraitSize = NSSize(width: 390, height: 844)
    self.setContentSize(portraitSize)
    self.minSize = NSSize(width: 320, height: 568)
    self.maxSize = NSSize(width: 430, height: 932)
    self.center()

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
