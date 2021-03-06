
////////////////////////////////////////////////////////////////////////////////
// Функции и процедуры для пересчета и получения тарифа
 
//&НаСервере
//	Функция ПолучитьТарифы(ОтчетнаяДата) Экспорт
//	Если месяц(ОтчетнаяДата)<7 тогда
//	ДатаДляЗапроса = Дата(Год(ОтчетнаяДата), 01, 01);	
//	Запрос = Новый Запрос;
//	Запрос.Текст = 
//		"ВЫБРАТЬ
//		|	ТарифыНаУслуги.Регистратор КАК Регистратор,
//		|	ТарифыНаУслуги.ДатаТарифа КАК ДатаТарифа,
//		|	ТарифыНаУслуги.ТарифНаГаз КАК ТарифНаГаз,
//		|	ТарифыНаУслуги.ТарифНаЭлектроэнергию КАК ТарифНаЭлектроэнергию,
//		|	ТарифыНаУслуги.ТарифНаВоду КАК ТарифНаВоду,
//		|	ТарифыНаУслуги.ТарифНаМусор КАК ТарифНаМусор,
//		|	ТарифыНаУслуги.ТарифНаИнтернет КАК ТарифНаИнтернет
//		|ИЗ
//		|	РегистрСведений.ТарифыНаУслуги КАК ТарифыНаУслуги
//		|ГДЕ
//		|	ТарифыНаУслуги.ДатаТарифа = &ОтчетнаяДата";
//	 Запрос.УстановитьПараметр("ОтчетнаяДата", ДатаДляЗапроса);
//	РезультатЗапроса = Запрос.Выполнить();
//	
//	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
//	 Тарифы = Новый Структура;
//	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
//	Тарифы.Вставить("ТарифНаГаз",ВыборкаДетальныеЗаписи.ТарифНаГаз);
//	Тарифы.Вставить("ТарифНаЭлектроэнергию",ВыборкаДетальныеЗаписи.ТарифНаЭлектроэнергию);
//	Тарифы.Вставить("ТарифНаВоду", ВыборкаДетальныеЗаписи.ТарифНаВоду);
//	Тарифы.Вставить("ТарифНаМусор",ВыборкаДетальныеЗаписи.ТарифНаМусор);
//	Тарифы.Вставить("ТарифНаИнтернет",ВыборкаДетальныеЗаписи.ТарифНаИнтернет);
//КонецЦикла;

//Иначе 

//		ДатаДляЗапроса = Дата(Год(ОтчетнаяДата), 06, 01);	
//	Запрос = Новый Запрос;
//	Запрос.Текст = 
//		"ВЫБРАТЬ
//		|	ТарифыНаУслуги.Регистратор КАК Регистратор,
//		|	ТарифыНаУслуги.ДатаТарифа КАК ДатаТарифа,
//		|	ТарифыНаУслуги.ТарифНаГаз КАК ТарифНаГаз,
//		|	ТарифыНаУслуги.ТарифНаЭлектроэнергию КАК ТарифНаЭлектроэнергию,
//		|	ТарифыНаУслуги.ТарифНаВоду КАК ТарифНаВоду,
//		|	ТарифыНаУслуги.ТарифНаМусор КАК ТарифНаМусор,
//		|	ТарифыНаУслуги.ТарифНаИнтернет КАК ТарифНаИнтернет
//		|ИЗ
//		|	РегистрСведений.ТарифыНаУслуги КАК ТарифыНаУслуги
//		|ГДЕ
//		|	ТарифыНаУслуги.ДатаТарифа = &ОтчетнаяДата";
//	 Запрос.УстановитьПараметр("ОтчетнаяДата", ДатаДляЗапроса);
//	РезультатЗапроса = Запрос.Выполнить();
//	Если РезультатЗапроса.Пустой() тогда
//		Сообщить("Пустой запрос нет записей о тарифе на вторую половину года")
//		Иначе
//	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
//	 Тарифы = Новый Структура;
//	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
//	Тарифы.Вставить("ТарифНаГаз",ВыборкаДетальныеЗаписи.ТарифНаГаз);
//	Тарифы.Вставить("ТарифНаЭлектроэнергию",ВыборкаДетальныеЗаписи.ТарифНаЭлектроэнергию);
//	Тарифы.Вставить("ТарифНаВоду", ВыборкаДетальныеЗаписи.ТарифНаВоду);
//	Тарифы.Вставить("ТарифНаМусор",ВыборкаДетальныеЗаписи.ТарифНаМусор);
//	Тарифы.Вставить("ТарифНаИнтернет",ВыборкаДетальныеЗаписи.ТарифНаИнтернет);
//КонецЦикла;
//КонецЕсли;
//КонецЕсли;	
//	
//	
//Возврат тарифы;
//КонецФункции
//Процедура ПересчитатьРазницыИСуммы(Объект, тарифы) Экспорт
//	Если Объект.НовСвет<Объект.СтСвет или Объект.НовГаз<Объект.СтГаз или Объект.НовВода<Объект.СтВода  тогда
//		Сообщить("Старые  показания счетчика больше новых,  сумма к оплате будет отрицательной, Исправьте!");
//Иначе
//	 СтруктураРасчета =  Новый Структура("НовГаз, НовСвет, НовВода, СтГаз, СтСвет, Ствода", 
//	 Объект.НовГаз, Объект.НовСвет, объект.НовВода,Объект.СтГаз, Объект.СтСвет, объект.СтВода );	
//	  Интернет = ?(Объект.ВключаяИнтернет, Тарифы.ТарифНаИнтернет, 0);
//	Объект.РазницаСвет = СтруктураРасчета.НовСвет - СтруктураРасчета.СтСвет;
//	Объект.РазницаГаз =  СтруктураРасчета.НовГаз - СтруктураРасчета .СтГаз;
//	Объект.Разницавода = СтруктураРасчета.НовВода - СтруктураРасчета.СтВода;
//	Объект.ОплаитьСвет = тарифы.ТарифНаЭлектроэнергию *Объект.РазницаСвет;
//	Объект.ОплаитьГаз = Тарифы.ТарифНаГаз *Объект.РазницаГаз;
//	Объект.ОплатитьВода = Тарифы.ТарифНаВоду *Объект.Разницавода;
//	Объект.СуммаКОплате  = Объект.ОплаитьГаз+Объект.ОплаитьСвет+Объект.ОплатитьВода+Тарифы.ТарифНаМусор+Интернет;
//	ОплаченныйИнтернет = ?(Объект.ВключаяИнтернет, Объект.ОплаченоИнтернет, 0);
//	Объект.СуммаПлатежей = Объект.ОплаченоГаз+Объект.ОплаченоВода+Объект.ОплаченоСвет+Объект.ОплаченоМусор+ОплаченныйИнтернет;
//	
//КонецЕсли;

//КонецПроцедуры
// Устанавливает свойство ИмяСвойства элемента формы с именем ИмяЭлемента в значение Значение.
// Применяется в тех случаях, когда элемент формы может не быть на форме из-за отсутствия прав у пользователя
// на объект, реквизит объекта или команду.
//
// Параметры:
//  ЭлементыФормы - свойство ЭлементыФормы управляемой формы.
//  ИмяЭлемента   - Строка       - имя элемента формы.
//  ИмяСвойства   - Строка       - имя устанавливаемого свойства элемента формы.
//  Значение      - Произвольный - новое значение элемента.
// 
Процедура УстановитьСвойствоЭлементаФормы(ЭлементыФормы, ИмяЭлемента, ИмяСвойства, Значение) Экспорт

	ЭлементФормы = ЭлементыФормы.Найти(ИмяЭлемента);
	Если ЭлементФормы <> Неопределено И ЭлементФормы[ИмяСвойства] <> Значение Тогда
		ЭлементФормы[ИмяСвойства] = Значение;
	КонецЕсли;

КонецПроцедуры