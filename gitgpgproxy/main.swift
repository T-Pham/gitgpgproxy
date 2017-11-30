//
//  main.swift
//  gitgpgproxy
//
//  Created by Thanh Pham on 30/11/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Foundation

@discardableResult
func exec(_ arguments: [String]) -> Int32 {
  let task = Process()
  task.launchPath = "/usr/bin/env"
  task.arguments = arguments
  task.launch()
  task.waitUntilExit()
  return task.terminationStatus
}

var arguments = CommandLine.arguments
arguments[0] = "git"
if arguments.count > 1 && (arguments[1] == "commit" || arguments[1] == "commit-tree") {
  arguments.insert("-S", at: 2)
}

let result = exec(arguments)
exit(result)
