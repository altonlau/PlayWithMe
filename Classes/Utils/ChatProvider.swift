// ChatProvider.swift
protocol ChatProvider {
  /// Send a message to a chat room
  func send(_ request: ChatMessageRequest, completion: @escaping  (Result<ChatMessageResponse, NSError>) -> Void)
}