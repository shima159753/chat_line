class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    ActionCable.server.broadcast 'room_channel', chat: render_message(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render partial: 'messages/message', locals: { message: message }
    end

end
