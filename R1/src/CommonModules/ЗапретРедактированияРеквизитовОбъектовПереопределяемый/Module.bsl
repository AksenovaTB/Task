///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2023, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Определить объекты метаданных, в модулях менеджеров которых ограничивается возможность
// редактирования реквизитов с помощью экспортной функции ПолучитьБлокируемыеРеквизитыОбъекта.
//
// Функция ПолучитьБлокируемыеРеквизитыОбъекта должна возвращать значение типа
// см. ЗапретРедактированияРеквизитовОбъектов.ОписаниеБлокируемогоРеквизита
//
// Поле надписи, связанное с реквизитом, не блокируется. Если требуется блокировать,
// имя элемента надписи нужно указать в описании блокируемого реквизита.
//
// Параметры:
//   Объекты - Соответствие из КлючИЗначение:
//     * Ключ - Строка - полное имя объекта метаданных, подключенного к подсистеме;
//     * Значение - Строка - пустая строка.
//
// Пример:
//   Объекты.Вставить(Метаданные.Документы.ЗаказПокупателя.ПолноеИмя(), "");
//
//   При этом в модуле менеджера объекта размещается код, подобный:
//   // См. ЗапретРедактированияРеквизитовОбъектовПереопределяемый.ПриОпределенииЗаблокированныхРеквизитов.ЗаблокированныеРеквизиты
//   Функция ПолучитьБлокируемыеРеквизитыОбъекта() Экспорт
//   	БлокируемыеРеквизиты = Новый Массив;
//   	БлокируемыеРеквизиты.Добавить("Организация");
//   	БлокируемыеРеквизиты.Добавить("Партнер;Партнер");
//   	Реквизит = ЗапретРедактированияРеквизитовОбъектов.НовыйБлокируемыйРеквизит();
//   	Реквизит.Имя = "Контрагент";
//   	Реквизит.Предупреждение = НСтр("ru = 'Поле не рекомендуется менять, если уже есть введенные документы'");
//   	БлокируемыеРеквизиты.Добавить(Реквизит);
//   	...
//   	Возврат БлокируемыеРеквизиты;
//   КонецФункции
//
Процедура ПриОпределенииОбъектовСЗаблокированнымиРеквизитами(Объекты) Экспорт
	
	
	
КонецПроцедуры

// Позволяет переопределить список заблокированных реквизитов, заданных в модуле менеджера объекта.
//
// Параметры:
//   ИмяОбъектаМетаданных - Строка - например, "Справочник.Файлы".
//   ЗаблокированныеРеквизиты - Массив из см. ЗапретРедактированияРеквизитовОбъектов.ОписаниеБлокируемогоРеквизита
//
Процедура ПриОпределенииЗаблокированныхРеквизитов(ИмяОбъектаМетаданных, ЗаблокированныеРеквизиты) Экспорт
	
КонецПроцедуры

#КонецОбласти
