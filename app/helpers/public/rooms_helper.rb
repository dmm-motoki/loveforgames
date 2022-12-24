module Public::RoomsHelper
  def most_new_message_preview(room)
    message = room.messages.order(updated_at: :desc).limit(1)
    if message.present?
      tag.p "#{message.direct_message}", class: "dm_list__content__link__box__message"
    else
      tag.p "[ まだメッセージはありません ]", class: "dm_list__content__link__box__message"
    end
  end
end
