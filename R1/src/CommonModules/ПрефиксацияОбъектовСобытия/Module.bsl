///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2023, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Устанавливает префикс источника подписки в соответствии с префиксом организации. 
// Источник подписки должен содержать
// обязательный реквизит шапки "Организация", с типом "СправочникСсылка.Организации".
//
// Параметры:
//  Источник - Произвольный - источник события подписки.
//             Любой объект из множества [Справочник, Документ, План видов характеристик, Бизнес процесс, Задача].
//  СтандартнаяОбработка - Булево - флаг стандартной обработки подписки.
//  Префикс - Строка - префикс объекта, который нужно изменить.
//
Процедура УстановитьПрефиксОрганизации(Источник, СтандартнаяОбработка, Префикс) Экспорт
	
	УстановитьПрефикс(Источник, Префикс, Ложь, Истина);
	
КонецПроцедуры

// Устанавливает префикс источника подписки в соответствии с префиксом информационной базы.
// Ограничения на реквизиты источника не накладываются.
//
// Параметры:
//  Источник - Произвольный - источник события подписки.
//             Любой объект из множества [Справочник, Документ, План видов характеристик, Бизнес процесс, Задача].
//  СтандартнаяОбработка - Булево - флаг стандартной обработки подписки.
//  Префикс - Строка - префикс объекта, который нужно изменить.
//
Процедура УстановитьПрефиксИнформационнойБазы(Источник, СтандартнаяОбработка, Префикс) Экспорт
	
	УстановитьПрефикс(Источник, Префикс, Истина, Ложь);
	
КонецПроцедуры

// Устанавливает префикс источника подписки в соответствии с префиксом информационной базы и префиксом организации.
// Источник подписки должен содержать
// обязательный реквизит шапки "Организация", с типом "СправочникСсылка.Организации".
//
// Параметры:
//  Источник - Произвольный - источник события подписки.
//             Любой объект из множества [Справочник, Документ, План видов характеристик, Бизнес процесс, Задача].
//  СтандартнаяОбработка - Булево - флаг стандартной обработки подписки.
//  Префикс - Строка - префикс объекта, который нужно изменить.
//
Процедура УстановитьПрефиксИнформационнойБазыИОрганизации(Источник, СтандартнаяОбработка, Префикс) Экспорт
	
	УстановитьПрефикс(Источник, Префикс, Истина, Истина);
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// Для справочников

// Выполняет проверку модифицированности реквизита Организация элемента справочника.
// Если реквизит Организация изменен, то Код элемента обнуляется.
// Это необходимо для назначения нового кода элементу.
//
// Параметры:
//  Источник - СправочникОбъект - источник события подписки.
//  Отказ    - Булево - флаг отказа.
// 
Процедура ПроверитьКодСправочникаПоОрганизации(Источник, Отказ) Экспорт
	
	ПроверитьКодОбъектаПоОрганизации(Источник);
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// Для бизнес-процессов

// Выполняет проверку модифицированности Даты бизнес процесса.
// Если дата не входит в предыдущий период, то номер бизнес процесса обнуляется.
// Это необходимо для назначения нового номера бизнес процессу.
//
// Параметры:
//  Источник - БизнесПроцессОбъект - источник события подписки.
//  Отказ    - Булево - флаг отказа.
// 
Процедура ПроверитьНомерБизнесПроцессаПоДате(Источник, Отказ) Экспорт
	
	ПроверитьНомерОбъектаПоДате(Источник);
	
КонецПроцедуры

// Выполняет проверку модифицированности Даты и Организации бизнес процесса.
// Если дата не входит в предыдущий период или изменен реквизит Организация, то номер бизнес процесса обнуляется.
// Это необходимо для назначения нового номера бизнес процессу.
//
// Параметры:
//  Источник - БизнесПроцессОбъект - источник события подписки.
//  Отказ    - Булево - флаг отказа.
// 
Процедура ПроверитьНомерБизнесПроцессаПоДатеИОрганизации(Источник, Отказ) Экспорт
	
	ПроверитьНомерОбъектаПоДатеИОрганизации(Источник);
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// Для документов

// Выполняет проверку модифицированности Даты документа.
// Если дата не входит в предыдущий период, то номер документа обнуляется.
// Это необходимо для назначения нового номера документу.
//
// Параметры:
//  Источник - ДокументОбъект - источник события подписки.
//  Отказ    - Булево - флаг отказа.
//  РежимЗаписи - РежимЗаписиДокумента - в параметр передается текущий режим записи документа.
//  РежимПроведения - РежимПроведенияДокумента - в данный параметр передается текущий режим проведения.
//
Процедура ПроверитьНомерДокументаПоДате(Источник, Отказ, РежимЗаписи, РежимПроведения) Экспорт
	
	ПроверитьНомерОбъектаПоДате(Источник);
	
КонецПроцедуры

// Выполняет проверку модифицированности Даты и Организации документа.
// Если дата не входит в предыдущий период или изменен реквизит Организация, то номер документа обнуляется.
// Это необходимо для назначения нового номера документу.
//
// Параметры:
//  Источник - ДокументОбъект - источник события подписки.
//  Отказ    - Булево - флаг отказа.
//  РежимЗаписи - РежимЗаписиДокумента - в параметр передается текущий режим записи документа.
//  РежимПроведения - РежимПроведенияДокумента - в данный параметр передается текущий режим проведения.
// 
Процедура ПроверитьНомерДокументаПоДатеИОрганизации(Источник, Отказ, РежимЗаписи, РежимПроведения) Экспорт
	
	ПроверитьНомерОбъектаПоДатеИОрганизации(Источник);
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// Получение префикса

// Возвращает префикс этой информационной базы.
//
// Параметры:
//    ПрефиксИнформационнойБазы - Строка - возвращаемое значение. Содержит префикс информационной базы.
//
Процедура ПриОпределенииПрефиксаИнформационнойБазы(ПрефиксИнформационнойБазы) Экспорт
	
	Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.ОбменДанными") Тогда
		МодульОбменДаннымиСервер = ОбщегоНазначения.ОбщийМодуль("ОбменДаннымиСервер");
		ПрефиксИнформационнойБазы = МодульОбменДаннымиСервер.ПрефиксИнформационнойБазы();
	Иначе
		ПрефиксИнформационнойБазы = "";
	КонецЕсли;
	
КонецПроцедуры

// Возвращает префикс организации.
//
// Параметры:
//  Организация - ОпределяемыйТип.Организация - организация, для которой надо получить префикс.
//  ПрефиксОрганизации - Строка - префикс организации.
//
Процедура ПриОпределенииПрефиксаОрганизации(Знач Организация, ПрефиксОрганизации) Экспорт
	
	Если Метаданные.ОпределяемыеТипы.Организация.Тип.СодержитТип(Тип("Строка")) Тогда
		ПрефиксОрганизации = "";
		Возврат;
	КонецЕсли;
		
	ИмяФункциональнойОпции = "ПрефиксыОрганизаций";
	ИмяПараметраФункциональнойОпции = "Организация";
	
	
	
	ПрефиксОрганизации = ПолучитьФункциональнуюОпцию(ИмяФункциональнойОпции, 
		Новый Структура(ИмяПараметраФункциональнойОпции, Организация));
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура УстановитьПрефикс(Источник, Префикс, УстановитьПрефиксИнформационнойБазы, УстановитьПрефиксОрганизации)
	
	ПрефиксИнформационнойБазы = "";
	ПрефиксОрганизации        = "";
	
	Если УстановитьПрефиксИнформационнойБазы Тогда
		
		ПриОпределенииПрефиксаИнформационнойБазы(ПрефиксИнформационнойБазы);
		
		ДополнитьСтрокуНулямиСлева(ПрефиксИнформационнойБазы, 2);
	КонецЕсли;
	
	Если УстановитьПрефиксОрганизации Тогда
		
		Если РеквизитОрганизацияДоступен(Источник) Тогда
			
			ПриОпределенииПрефиксаОрганизации(
				Источник[ИмяРеквизитаОрганизация(Источник.Метаданные())], ПрефиксОрганизации);
			// Если задана пустая ссылка на организацию.
			Если ПрефиксОрганизации = Ложь Тогда
				
				ПрефиксОрганизации = "";
				
			КонецЕсли;
			
		КонецЕсли;
		
		ДополнитьСтрокуНулямиСлева(ПрефиксОрганизации, 2);
	КонецЕсли;
	
	ШаблонПрефикса = "[ОР][ИБ]-[Префикс]";
	ШаблонПрефикса = СтрЗаменить(ШаблонПрефикса, "[ОР]", ПрефиксОрганизации);
	ШаблонПрефикса = СтрЗаменить(ШаблонПрефикса, "[ИБ]", ПрефиксИнформационнойБазы);
	ШаблонПрефикса = СтрЗаменить(ШаблонПрефикса, "[Префикс]", Префикс);
	
	Префикс = ШаблонПрефикса;
	
КонецПроцедуры

Процедура ДополнитьСтрокуНулямиСлева(Строка, ДлинаСтроки)
	
	Строка = СтроковыеФункцииКлиентСервер.ДополнитьСтроку(Строка, ДлинаСтроки, "0", "Слева");
	
КонецПроцедуры

Процедура ПроверитьНомерОбъектаПоДате(Объект)
	
	Если Объект.ОбменДанными.Загрузка Или Объект.ЭтоНовый() Тогда
		Возврат;
	КонецЕсли;
	
	МетаданныеОбъекта = Объект.Метаданные();
	
	ТекстЗапроса = 
	"ВЫБРАТЬ
	|	ШапкаОбъекта.Дата КАК Дата
	|ИЗ
	|	&ИмяТаблицыМетаданных КАК ШапкаОбъекта
	|ГДЕ
	|	ШапкаОбъекта.Ссылка = &Ссылка";
	
	ТекстЗапроса = СтрЗаменить(ТекстЗапроса, "&ИмяТаблицыМетаданных", МетаданныеОбъекта.ПолноеИмя());
	
	Запрос = Новый Запрос(ТекстЗапроса);
	Запрос.УстановитьПараметр("Ссылка", Объект.Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();
	Выборка.Следующий();
	
	Если Не ПрефиксацияОбъектовСлужебный.ДатыОбъектаОдногоПериода(Выборка.Дата, Объект.Дата, Объект.Ссылка) Тогда
		
		Объект.Номер = "";
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ПроверитьНомерОбъектаПоДатеИОрганизации(Объект)
	
	Если Объект.ОбменДанными.Загрузка Или Объект.ЭтоНовый() Тогда
		Возврат;
	КонецЕсли;
	
	Если ПрефиксацияОбъектовСлужебный.ДатаИлиОрганизацияОбъектаИзменена(Объект.Ссылка, Объект.Дата,
		Объект[ИмяРеквизитаОрганизация(Объект.Метаданные())]) Тогда
		
		Объект.Номер = "";
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ПроверитьКодОбъектаПоОрганизации(Объект)
	
	Если Объект.ОбменДанными.Загрузка Или Объект.ЭтоНовый() Или Не РеквизитОрганизацияДоступен(Объект) Тогда
		Возврат;
	КонецЕсли;
	
	Если ПрефиксацияОбъектовСлужебный.ОрганизацияОбъектаИзменена(Объект.Ссылка,	
		Объект[ИмяРеквизитаОрганизация(Объект.Метаданные())]) Тогда
		
		Объект.Код = "";
		
	КонецЕсли;
	
КонецПроцедуры

Функция РеквизитОрганизацияДоступен(Объект)
	
	// Возвращаемое значение функции.
	Результат = Истина;
	
	МетаданныеОбъекта = Объект.Метаданные();
	
	Если   (ОбщегоНазначения.ЭтоСправочник(МетаданныеОбъекта)
		ИЛИ ОбщегоНазначения.ЭтоПланВидовХарактеристик(МетаданныеОбъекта))
		И МетаданныеОбъекта.Иерархический Тогда
		
		ИмяРеквизитаОрганизация = ИмяРеквизитаОрганизация(МетаданныеОбъекта);
		
		РеквизитОрганизация = МетаданныеОбъекта.Реквизиты.Найти(ИмяРеквизитаОрганизация);
		
		Если РеквизитОрганизация = Неопределено Тогда
			
			Если ОбщегоНазначения.ЭтоСтандартныйРеквизит(МетаданныеОбъекта.СтандартныеРеквизиты, ИмяРеквизитаОрганизация) Тогда
				
				// Стандартный реквизит всегда доступен и для элемента и для группы.
				Возврат Истина;
				
			КонецЕсли;
			
			СтрокаСообщения = НСтр("ru = 'Для объекта метаданных %1 не определен реквизит с именем %2.'");
			СтрокаСообщения = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(СтрокаСообщения, МетаданныеОбъекта.ПолноеИмя(), ИмяРеквизитаОрганизация);
			ВызватьИсключение СтрокаСообщения;
		КонецЕсли;
			
		Если РеквизитОрганизация.Использование = Метаданные.СвойстваОбъектов.ИспользованиеРеквизита.ДляГруппы И Не Объект.ЭтоГруппа Тогда
			
			Результат = Ложь;
			
		ИначеЕсли РеквизитОрганизация.Использование = Метаданные.СвойстваОбъектов.ИспользованиеРеквизита.ДляЭлемента И Объект.ЭтоГруппа Тогда
			
			Результат = Ложь;
			
		КонецЕсли;
		
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

// Для внутреннего использования.
Функция ИмяРеквизитаОрганизация(Объект) Экспорт
	
	Если ТипЗнч(Объект) = Тип("ОбъектМетаданных") Тогда
		ПолноеИмя = Объект.ПолноеИмя();
	Иначе
		ПолноеИмя = Объект;
	КонецЕсли;
	
	Реквизит = ПрефиксацияОбъектовПовтИсп.ПрефиксообразующиеРеквизиты().Получить(ПолноеИмя);
	
	Если Реквизит <> Неопределено Тогда
		Возврат Реквизит;
	КонецЕсли;
	
	Возврат "Организация";
	
КонецФункции

#КонецОбласти
