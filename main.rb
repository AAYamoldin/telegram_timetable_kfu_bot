require 'telegram/bot'

TOKEN = '979144602:AAFown-yfRwiDgynp1zbYJAgYrWdblR4F5s'

def keyboard

end

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'

      question = "Здравствуй, #{message.from.first_name}\nКакой день тебя интересует?"
      #
      # kb = [
      #     Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Понедельник', callback_data: 'Monday'),
      #     Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Вторник', callback_data: 'Tuesday'),
      #     Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Среда', callback_data: 'Wednesday'),
      #     Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Четверг', callback_data: 'Thursday'),
      #     Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Пятница', callback_data: 'Friday'),
      #     Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Суббота', callback_data: 'Saturday'),
      # ]
answers = Telegram::Bot::Types::ReplyKeyboardMarkup
             .new(keyboard: [%w(Понедельник Четверг), %w(Вторник Пятница), %w(Среда Суббота)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)


    when 'Понедельник'
      monday = "8.30 - 10.00 Электродинамика. Туманов. 806\n
10.10 - 11.40 1-14н Элктродинамика. Ларионов. 112\n
11.50 - 15.30 Радиофизика и электроника спецпрактикум. Васильева. 121\n"
      bot.api.send_message(chat_id: message.chat.id, text: monday )
    when 'Вторник'
      tuesday = "8.30 - 11.40 Радиофизика и электроника спецпрактикум. Данилов/Тюрин. 1206\n
11.50 - 13.20 Методы МатФизики. Балакин. 112\n
14.00 - 15.30 Курс по выбору Н/Н:
1) Радиофизические измерения. Гаврилов. 120\n
2) Основы вакуумной и криогенной техники. Алашкин. 251 гл.зд.\n
3) Радиотелекоммуникационные системы. Шерстюков. 1110\n
              Курс по выбору Ч/Н:
 1) Функц. узлы инф. систем. Гумеров. 123\n
 2) Техника спектроскопии. Дуглав. 252 гл.зд.\n
 3) Лаборатория интеллектуальных датчиков. Юсупов. 1307\n
16.00 - 17.30 Физическая Культура\n"
      bot.api.send_message(chat_id: message.chat.id, text: tuesday )
    when 'Среда'
      wednesday = "8.30 - 10.00 Ч/Н Экономика. Вахитова. 806\n
10.10 - 11.40 1-9н Электродинамика. Ларионов. 112\n
11.50 - 13.20 ОФП. Харинцев. 1005\n"
      bot.api.send_message(chat_id: message.chat.id, text: wednesday )
    when 'Четверг'
      thursday = "8.30 - 10.00 Курс по выбору:
1) Функц. узлы инф. систем. Когогин. 016\n
2) Техника спектроскопии. Дуглав. 252 гл.зд.\n
3) Лаборатория интеллектуальных датчиков. Юсупов. 1307\n
10.10 - 11.40 Атомная физика. Гайнутдин. 112\n
11.50 - 13.20 Курс по выбору:
 1) Радиотехнические измерения. Гаврилов. л- 123, лаб - 09+010\n
 2) Основы вакуумной и криогенной техники. Алашкин. 251 гл.зд.\n
 3) Радиотелекоммуникационные системы. Шерстюков. лаб - 1201\n"
      bot.api.send_message(chat_id: message.chat.id, text: thursday )

    when 'Пятница'
      friday = "10.10 - 11.40 Полупроводниковая электроника. Таюрская. 307\n
11.50 - 13.20 1-14н Полупроовдниковая электроника. Масленниеова. 1110\n
14.00 - 15.30 1-9н Экономика. Вахитова. 110\n"
      bot.api.send_message(chat_id: message.chat.id, text: friday )

    when 'Суббота'
      saturday = "8.30 - 10.00 Ч/Н Атомная физика. Хамадеев. 903\n
10.10 - 11.40 - Методы математической физики. Кузнецова. 908\n
11.50 - 13.20 - Теория колебаний. Мамин. 110\n
14.00 - 15.30 7,9,11,13,15н Теория колебаний. Мамин. пр. 806\n"
      bot.api.send_message(chat_id: message.chat.id, text: saturday)
    when '/stop'
      # See more: https://core.telegram.org/bots/api#replykeyboardremove
      kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: 'Sorry to see you go :(', reply_markup: answers)
    else
      bot.api.send_message(
                 chat_id: message.chat.id,
                 text: "Введите корректное значение дня!"
      )
    end
  end
end