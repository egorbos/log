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

internal enum Delimiter: String {

    /// Specifies a pipe character with a space character on each side.
    case spacedPipe = " | "

    /// Specifies a hyphen character with a space character on each side.
    case spacedHyphen = " - "

    /// Specifies the tab character: ASCII `0x09`.
    case tab = "\t"

    /// Specifies the space character: ASCII `0x20`.
    case space = " "

    /// Character signifying the end of a line of text and the start of a new line.
    case newLine = "\n"

}
