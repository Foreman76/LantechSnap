//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
       setupView()
    }
    
    private func setupView(){
       
        self.view = getRootView()
        let redView = getRedView()
        let greenView = getGreenView()
        let whiteView = getWhiteView()
        
        set(view: greenView, centerOfView: redView)
//        set(view: whiteView, centerOfView: redView)
        
        whiteView.center = greenView.center
        
        self.view.addSubview(redView)
        redView.addSubview(greenView)
        redView.addSubview(whiteView)
        self.view.addSubview(getPinkView())
        
    }
    
    private func getRootView()-> UIView{
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    
    private func getRedView()->UIView {
        
        let view = UIView()
        view.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        view.backgroundColor = .red
        view.clipsToBounds = true
        return view
    }
    
    private func getGreenView()->UIView {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 180, height: 180))
        view.backgroundColor = .green
        return view
    }
    
    private func set(view:UIView, centerOfView:UIView){
        let x = (centerOfView.frame.width - view.frame.width) / 2
        let y = (centerOfView.frame.height - view.frame.height) / 2
        
        view.frame.origin = CGPoint(x: x, y: y)
    }
    
    private func getWhiteView()->UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .white
        return view
    }
    
    private func getPinkView()->UIView {
        let view = UIView(frame: CGRect(x: 50, y: 300, width: 100, height: 100))
        view.backgroundColor = .systemPink
        view.layer.borderWidth = CGFloat(2)
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.9
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowColor = UIColor.lightGray.cgColor
        return view
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
