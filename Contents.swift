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
    
    init(min: Int, sec: Int, wattageType: WattageType) {
        self.minutes = min
        self.seconds = sec
        self.wattageType = wattageType
    }
    
    enum WattageType {
        case weak // 500ワット
        case medium // 600ワット
        case strong // 800ワット
    }
    // タイマーをセットするための変数
    var minutes: Int
    var seconds: Int
    var wattageType: WattageType
    
    // 任意の箇所でTimerクラスを使用して１秒毎にstartWarming()メソッドを実行させるタイマーをセット
    func start() {
        
        // 例外ケース！　0以下を入力された場合の処理
        guard minutes > 0 || seconds > 0 else {
            timer?.invalidate()
            print("正しく入力してください！")
            return
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 1, // タイマーの実行間隔を指定（単位はn秒）
            target: self, // ここは「self」でOK
            selector: #selector(startWarming), // timeInterval毎に実行するメソッドを指定
            userInfo: nil, // ここは「nil」でOK
            repeats: true // 繰り返し処理を実行したいので「true」を指定
        )
        
        // ワット数を開始時に表示
        switch wattageType {
        case .weak:
            print("500Wで温めます！")
        case .medium:
            print("600Wで温めます！")
        case .strong:
            print("800Wで温めます！")
        }
        
    }
    
    @objc func startWarming() {
        print("残り\(microWave.minutes)分\(microWave.seconds)秒")
        // 1分を60秒に変換する
        if seconds <= 0 && minutes > 0 {
            minutes -= 1
            seconds = 60
        }
        // タイマーの数値が0になった時
        if minutes == 0 && seconds == 0 {
            // タイマーを止める
            timer?.invalidate()
            print("温めが終了しました。")
        }
        // 1秒ずつ減らす
        seconds -= 1
    }
}

let microWave = MicroWave(min: 0, sec: 0, wattageType: .weak)
microWave.start()
