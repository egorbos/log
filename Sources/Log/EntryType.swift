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

public enum EntryType: Int {

    /// The lowest severity, used for detailed or frequently occurring
    /// debugging and diagnostic information.
    case verbose = 1

    /// Used for debugging and diagnostic information.
    case debug = 2

    /// Used to indicate something of interest that is not problematic.
    case info = 3

    /// Used to indicate that something appears amiss and potentially
    /// problematic. The situation bears looking into before a larger problem
    /// arises.
    case warning = 4

    /// The highest severity, used to indicate that something has gone wrong,
    /// a fatal error may be imminent.
    case error = 5

}

extension EntryType: CustomStringConvertible {

    /// Returns a human-readable textual representation of the receiver.
    public var description: String {
        switch self {
        case .verbose: return "Verbose"
        case .debug:   return "Debug"
        case .info:    return "Info"
        case .warning: return "Warning"
        case .error:   return "Error"
        }
    }

}
