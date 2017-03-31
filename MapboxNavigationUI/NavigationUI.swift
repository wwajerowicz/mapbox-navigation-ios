import UIKit
import MapboxDirections
import Mapbox

let MBSecondsBeforeResetTrackingMode:TimeInterval = 25.0

extension UIColor {
    fileprivate class var defaultTint: UIColor { get { return #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1) } }
    fileprivate class var defaultTintStroke: UIColor { get { return #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1) } }
    fileprivate class var defaultPrimaryText: UIColor { get { return #colorLiteral(red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1) } }
    fileprivate class var defaultSecondaryText: UIColor { get { return #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1) } }
    fileprivate class var defaultLine: UIColor { get { return #colorLiteral(red: 0.7825912237, green: 0.7776457667, blue: 0.7863886952, alpha: 0.7) } }
    fileprivate class var unknownCongestionTint: UIColor { get { return #colorLiteral(red:0.40, green:0.73, blue:0.37, alpha:1.0) } }
    fileprivate class var lowCongestionTint: UIColor { get { return #colorLiteral(red:0.40, green:0.73, blue:0.37, alpha:1.0) } }
    fileprivate class var moderateCongestionTint: UIColor { get { return #colorLiteral(red:1.00, green:0.67, blue:0.42, alpha:1.0) } }
    fileprivate class var heavyCongestionTint: UIColor { get { return #colorLiteral(red:0.90, green:0.34, blue:0.43, alpha:1.0) } }
    fileprivate class var severeCongestionTint: UIColor { get { return #colorLiteral(red:0.58, green:0.16, blue:0.30, alpha:1.0) } }
}

/**
 `NavigationUI` lets you apply basic styling to some of
 the MapboxNavigationUI elements.
 */
@objc(MBNavigationUI)
public class NavigationUI: NSObject {
    public static let shared = NavigationUI()
    
    fileprivate var _tintColor: UIColor?
    fileprivate var _tintStrokeColor: UIColor?
    fileprivate var _primaryTextColor: UIColor?
    fileprivate var _secondaryTextColor: UIColor?
    fileprivate var _lineColor: UIColor?
    
    fileprivate var _unknownCongestionTint: UIColor?
    fileprivate var _lowCongestionTint: UIColor?
    fileprivate var _moderateCongestionTint: UIColor?
    fileprivate var _heavyCongestionTint: UIColor?
    fileprivate var _severeCongestionTint: UIColor?
    
    
    /// Used for guidance arrow, highlighted text and progress bars.
    public var tintColor: UIColor {
        get { return _tintColor ?? .defaultTint }
        set { _tintColor = newValue }
    }
    
    /// Used for guidance arrow.
    public var tintStrokeColor: UIColor {
        get { return _tintStrokeColor ?? .defaultTintStroke }
        set { _tintStrokeColor = newValue }
    }
    
    /// Used for titles and prioritized information.
    public var primaryTextColor: UIColor {
        get { return _primaryTextColor ?? .defaultPrimaryText }
        set { _primaryTextColor = newValue }
    }
    
    /// Used for subtitles, distances and accessory labels.
    public var secondaryTextColor: UIColor {
        get { return _secondaryTextColor ?? .defaultSecondaryText }
        set { _secondaryTextColor = newValue }
    }
    
    /// Used for separators in table views.
    public var lineColor: UIColor {
        get { return _lineColor ?? .defaultLine }
        set { _lineColor = newValue }
    }
    
    public var unknownCongestion: UIColor {
        get { return _unknownCongestionTint ?? .unknownCongestionTint }
        set { _unknownCongestionTint = newValue }
    }
    
    public var lowCongestion: UIColor {
        get { return _lowCongestionTint ?? .lowCongestionTint }
        set { _lowCongestionTint = newValue }
    }
    
    public var moderateCongestion: UIColor {
        get { return _moderateCongestionTint ?? .moderateCongestionTint }
        set { _moderateCongestionTint = newValue }
    }
    
    public var heavyCongestion: UIColor {
        get { return _heavyCongestionTint ?? .heavyCongestionTint }
        set { _heavyCongestionTint = newValue }
    }
    
    public var severeCongestion: UIColor {
        get { return _severeCongestionTint ?? .severeCongestionTint }
        set { _severeCongestionTint = newValue }
    }
    
    /**
     Convenient factory method for instantiating a `RouteViewController`,
     providing turn by turn navigation for the given route.
     A optional `direction` object is needed for potential rerouting.
     
     See [MapboxDirections.swift](https://github.com/mapbox/MapboxDirections.swift)
     for further information.
     */
    public class func routeViewController(for route: Route, directions: Directions = Directions.shared) -> RouteViewController {
        let destination = MGLPointAnnotation()
        destination.coordinate = route.coordinates!.last!
        
        let storyboard = UIStoryboard(name: "Navigation", bundle: Bundle.navigationUI)
        let controller = storyboard.instantiateInitialViewController() as! RouteViewController
        
        controller.route = route
        controller.destination = destination
        controller.directions = directions
        
        return controller
    }
}
