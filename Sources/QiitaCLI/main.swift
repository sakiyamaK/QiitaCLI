import Foundation
import QiitaCLICore
import Dispatch
import ArgumentParser

struct RuntimeError: Error, CustomStringConvertible {
  var description: String
  init(_ description: String) {
    self.description = description
  }
}

struct Qiita: ParsableCommand {
  static var configuration = CommandConfiguration(
    commandName: "QiitaCLI",
    abstract: "Search articles from Qiita with word",
    discussion: """
        Search articles from Qiita with word
        """,
    version: "1.0.0",
    shouldDisplay: true,
    //subcommands: T##[ParsableCommand.Type], // non use
    //defaultSubcommand: T##ParsableCommand.Type?, // non use
    helpNames: [.long, .short]
  )

  @Argument(help: "please input search word")
  var keyword:  String

  func run() throws {
    guard keyword.count > 0 else {
      throw(RuntimeError("please input search word"))
    }
    let q = QiitaCore(keyword: keyword)
    q.search { result in
      print("result: \(result ?? "")")
      Qiita.exit()
    }
    dispatchMain()
  }
}

Qiita.main()
