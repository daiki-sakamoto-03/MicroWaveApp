import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


// 電子レンジロジック
// タイマーセットができる
// タイマーがゼロになったら音が鳴る、かつタイマーを止める(print出力)
// ワット数が選択出来る

class MicroWave {
    
    var timer: Timer?
    let limit = 0
    var warmLimit = 0
    
    enum WattageType {
        case weak // 500ワット
        case medium // 600ワット
        case strong // 800ワット
    }
    
    // 任意の箇所でTimerクラスを使用して１秒毎にcountup()メソッドを実行させるタイマーをセット
    func start() {
        timer = Timer.scheduledTimer(
            timeInterval: 1, // タイマーの実行間隔を指定（単位はn秒）
            target: self, // ここは「self」でOK
            selector: #selector(startWarming), // timeInterval毎に実行するメソッドを指定
            userInfo: nil, // ここは「nil」でOK
            repeats: true // 繰り返し処理を実行したいので「true」を指定
        )
    }
    
    @objc func startWarming() {
        
        switch WattageType {
        case .weak:
            break
        case .medium:
            break
        case .strong:
            break
        }
        
    }
    
    
    
}
