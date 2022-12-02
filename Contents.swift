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
    // タイマーをセットするための変数
    var minutes: Int = 0
    var seconds: Int = 0
    
    // 任意の箇所でTimerクラスを使用して１秒毎にstartWarming()メソッドを実行させるタイマーをセット
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
        // 1秒ずつ減らす
        seconds -= 1
        print("残り\(microWave.minutes)分\(microWave.seconds)秒")
        // 1分を60秒に変換する
        if seconds <= -1 && minutes > 0 {
            minutes -= 1
            seconds = 60
        }
        // タイマーの数値が0になった時
        if minutes == 0 && seconds == 0 {
            // タイマーを止める
            timer?.invalidate()
            print("温めが終了しました。")
        }
    }
    
    
}

let microWave = MicroWave()
microWave.minutes = 1
microWave.seconds = 0
microWave.start()
