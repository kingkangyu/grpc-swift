//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: service.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import GRPC
import NIO
import NIOHTTP1
import SwiftProtobuf


/// Usage: instantiate Codegentest_FooClient, then call methods of this protocol to make API calls.
internal protocol Codegentest_FooClientProtocol: GRPCClient {
  func get(
    _ request: Codegentest_FooMessage,
    callOptions: CallOptions?
  ) -> UnaryCall<Codegentest_FooMessage, Codegentest_FooMessage>

}

extension Codegentest_FooClientProtocol {

  /// Unary call to Get
  ///
  /// - Parameters:
  ///   - request: Request to send to Get.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func get(
    _ request: Codegentest_FooMessage,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Codegentest_FooMessage, Codegentest_FooMessage> {
    return self.makeUnaryCall(
      path: "/codegentest.Foo/Get",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Codegentest_FooClient: Codegentest_FooClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the codegentest.Foo service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  internal init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Codegentest_FooProvider: CallHandlerProvider {
  func get(request: Codegentest_FooMessage, context: StatusOnlyCallContext) -> EventLoopFuture<Codegentest_FooMessage>
}

extension Codegentest_FooProvider {
  internal var serviceName: Substring { return "codegentest.Foo" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handleMethod(_ methodName: Substring, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "Get":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.get(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}

