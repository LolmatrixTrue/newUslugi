#Область ПрограммныйИнтерфейс


////////////////////////////////////////////////////////////////////////////////
// Клиентские процедуры общего назначения.

// Возвращает текущую дату, приведенную к часовому поясу сеанса.
//
// Функция возвращает время, близкое к результату функции ТекущаяДатаСеанса() в серверном контексте.
// Погрешность обусловлена временем выполнения серверного вызова.
// Предназначена для использования вместо функции ТекущаяДата().
//
Функция ДатаСеанса() Экспорт
	Возврат ТекущаяДата();
КонецФункции


// Обновляет интерфейс программы сохраняя текущее активное окно.
//
Процедура ОбновитьИнтерфейсПрограммы() Экспорт

	ТекущееАктивноеОкно = АктивноеОкно();
	ОбновитьИнтерфейс();
	Если ТекущееАктивноеОкно <> Неопределено Тогда
		ТекущееАктивноеОкно.Активизировать();
	КонецЕсли;

КонецПроцедуры
Процедура ПересчитатьРазницыИСуммы(Объект, тарифы) Экспорт
	Если Объект.НовСвет < Объект.СтСвет Или Объект.НовГаз < Объект.СтГаз Или Объект.НовВода < Объект.СтВода Тогда
		Сообщить("Старые  показания счетчика больше новых,  сумма к оплате будет отрицательной, Исправьте!");
	Иначе
		СтруктураРасчета =  Новый Структура("НовГаз, НовСвет, НовВода, СтГаз, СтСвет, Ствода", Объект.НовГаз,
			Объект.НовСвет, объект.НовВода, Объект.СтГаз, Объект.СтСвет, объект.СтВода);
		Интернет = ?(Объект.ВключаяИнтернет, Тарифы.ТарифНаИнтернет, 0);
		Объект.РазницаСвет = СтруктураРасчета.НовСвет - СтруктураРасчета.СтСвет;
		Объект.РазницаГаз =  СтруктураРасчета.НовГаз - СтруктураРасчета.СтГаз;
		Объект.Разницавода = СтруктураРасчета.НовВода - СтруктураРасчета.СтВода;
		Объект.ОплаитьСвет = тарифы.ТарифНаЭлектроэнергию * Объект.РазницаСвет;
		Объект.ОплаитьГаз = Тарифы.ТарифНаГаз * Объект.РазницаГаз;
		Объект.ОплатитьВода = Тарифы.ТарифНаВоду * Объект.Разницавода;
		Объект.СуммаКОплате  = Объект.ОплаитьГаз + Объект.ОплаитьСвет + Объект.ОплатитьВода + Тарифы.ТарифНаМусор
			+ Интернет;
		ОплаченныйИнтернет = ?(Объект.ВключаяИнтернет, Объект.ОплаченоИнтернет, 0);
		Объект.СуммаПлатежей = Объект.ОплаченоГаз + Объект.ОплаченоВода + Объект.ОплаченоСвет + Объект.ОплаченоМусор
			+ ОплаченныйИнтернет;

	КонецЕсли;

КонецПроцедуры

#КонецОбласти
Процедура РассчетСуммы(ТекДанные) Экспорт
ТекДанные.Сумма = ТекДанные.Количество*ТекДанныеЦена;	
КонецПроцедуры