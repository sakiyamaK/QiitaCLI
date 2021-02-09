import Foundation
import SwiftShell
import QiitaCLICore
import Dispatch

let env = ProcessInfo().environment
let args = main.arguments

if let debugPath = env["WorkingDirectory"] {
  main.currentdirectory = debugPath
}

do {
  guard let keyword = args.first else {
    throw NSError.init(domain: "keyword nothing", code: 99, userInfo: nil)
  }
  let q = Qiita(keyword: keyword)
  q.search { result in 
    print("result: \(result ?? "")")
    exit(0)
  }
  dispatchMain()
} catch {
  exit(error)
}
