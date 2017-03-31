/// Copyright 2017 Sergei Egorov
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.

import Foundation

public protocol LogProtocol {

    /// Creates log entry and writes it in the log file.
    ///
    /// - Parameters:
    ///   - entryMsg:  Text message for log entry.
    ///   - file:      The file from which write process is initiated.
    ///   - line:      The line of the file from which write process is initiated.
    ///   - function:  Function from which write process is initiated.
    ///   - entryType: Type of the log entry. Accepts values - verbose, debug, info,
    ///                warning, error.
    ///
    func record(entryMsg: String, file: String, line: Int, function: String, entryType: EntryType)
}

public class Log {

    // MARK: Properties, initialization, deinitialization

    /// Instance of the class which implements the protocol of record of log files (LogProtocol).
    fileprivate let logger: LogProtocol

    /// Initialization.
    ///
    /// - Parameter logger: Instance of the class which implements the protocol
    ///                     of record of log files (LogProtocol).
    ///
    public init(logger: LogProtocol) {
        self.logger = logger
    }

}

extension Log {

    // MARK: Methods

    /// Log a verbose message.
    ///
    /// - Parameters:
    ///   - msg:      The text message to be logged.
    ///   - file:     The file from which write process is initiated.
    ///   - line:     The line of the file from which write process is initiated.
    ///   - function: Function from which write process is initiated.
    ///
    public func verbose(_ msg: String, file: String = #file, line: Int = #line, function: String = #function) {

        logger.record(entryMsg: msg, file: file, line: line, function: function, entryType: .verbose)
    }

    /// Log a debuging message.
    ///
    /// - Parameters:
    ///   - msg:      The text message to be logged.
    ///   - file:     The file from which write process is initiated.
    ///   - line:     The line of the file from which write process is initiated.
    ///   - function: Function from which write process is initiated.
    ///
    public func debug(_ msg: String, file: String = #file, line: Int = #line, function: String = #function) {

        logger.record(entryMsg: msg, file: file, line: line, function: function, entryType: .debug)
    }

    /// Log an informational message.
    ///
    /// - Parameters:
    ///   - msg:      The text message to be logged.
    ///   - file:     The file from which write process is initiated.
    ///   - line:     The line of the file from which write process is initiated.
    ///   - function: Function from which write process is initiated.
    ///
    public func info(_ msg: String, file: String = #file, line: Int = #line, function: String = #function) {

        logger.record(entryMsg: msg, file: file, line: line, function: function, entryType: .info)
    }

    /// Log a warning message.
    ///
    /// - Parameters:
    ///   - msg:      The text message to be logged.
    ///   - file:     The file from which write process is initiated.
    ///   - line:     The line of the file from which write process is initiated.
    ///   - function: Function from which write process is initiated.
    ///
    public func warning(_ msg: String, file: String = #file, line: Int = #line, function: String = #function) {

        logger.record(entryMsg: msg, file: file, line: line, function: function, entryType: .warning)
    }

    /// Log an error message.
    ///
    /// - Parameters:
    ///   - msg:      The text message to be logged.
    ///   - file:     The file from which write process is initiated.
    ///   - line:     The line of the file from which write process is initiated.
    ///   - function: Function from which write process is initiated.
    ///
    public func error(_ msg: String, file: String = #file, line: Int = #line, function: String = #function) {

        logger.record(entryMsg: msg, file: file, line: line, function: function, entryType: .error)
    }

}
