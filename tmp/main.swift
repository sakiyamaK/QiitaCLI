import Foundation
import SwiftShell
import Dispatch
import Template_CLICore

let env = ProcessInfo().environment
let args = main.arguments

if let debugPath = env["WorkingDirectory"] {
  main.currentdirectory = debugPath
}

do {
  dispatchMain()
} catch {
  exit(error)
}
