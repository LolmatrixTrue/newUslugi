
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ДвиженияДенежныхСредств Приход
	Движения.ДвиженияДенежныхСредств.Записывать = Истина;
	Для Каждого ТекСтрокаДоходы Из Доходы Цикл
		Движение = Движения.ДвиженияДенежныхСредств.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаДоходы.ВидДохода;
		Движение.Сумма = Число(ТекСтрокаДоходы.Сумма);
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
