
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Объект.Ссылка.Пустая() тогда
Сообщить("НовыйОбъект");
КонецЕсли;
	ТаблицаДаных = Новый ТаблицаЗначений;
ТаблицаДаных.Колонки.Добавить("Месяц");
Строка  = ТаблицаДаных.Добавить();
Строка.Месяц = "Январь";
Строка  = ТаблицаДаных.Добавить();
Строка.Месяц = "Февраль";
Строка  = ТаблицаДаных.Добавить();
Строка.Месяц = "Март";
Объект.ТаблицаМесяцы.Загрузить(ТаблицаДаных);

КонецПроцедуры
