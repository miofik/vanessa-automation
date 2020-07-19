﻿#Область ОбработкаСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	БрейкпоинтыVanessaEditor = Параметры.БрейкпоинтыVanessaEditor;
	ДанныеТочекОстановаСервер = РеквизитФормыВЗначение("ДанныеТочекОстанова");
	
	Для Каждого Элем Из БрейкпоинтыVanessaEditor Цикл
		СтрокаДанныеТочекОстановаСервер = ДанныеТочекОстановаСервер.Добавить();
		СтрокаДанныеТочекОстановаСервер.НомСтр = Элем.НомерСтроки;
		СтрокаДанныеТочекОстановаСервер.ТекстСтроки = Элем.ТекстСтроки;
		СтрокаДанныеТочекОстановаСервер.ИдВиджета = Элем.ИдВиджета;
		СтрокаДанныеТочекОстановаСервер.РеальныйНомерСтроки = Элем.РеальныйНомерСтроки;
	КонецЦикла;	 
	
	ДанныеТочекОстановаСервер.Сортировать("РеальныйНомерСтроки");
	
	ЗначениеВРеквизитФормы(ДанныеТочекОстановаСервер, "ДанныеТочекОстанова"); 
	
КонецПроцедуры

#КонецОбласти

#Область КомандыФормы

&НаКлиенте
Процедура ЗакрытьФорму(Команда)
	Закрыть();
КонецПроцедуры

&НаКлиенте
Процедура ПерейтиКСтрокеРедактора(Команда)
	ПерейтиКСтрокеРедактораОбработчик();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПерейтиКСтрокеРедактораОбработчик()
	ТекущиеДанные = Элементы.ДанныеТочекОстанова.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		Закрыть();
		Возврат;
	КонецЕсли;	 
	
	Данные = Новый Структура;
	Данные.Вставить("LineNumber", ТекущиеДанные.НомСтр);
	Данные.Вставить("codeWidget", ТекущиеДанные.ИдВиджета);
	Данные.Вставить("Column", 1);
	Данные.Вставить("РеальныйНомерСтроки", ТекущиеДанные.РеальныйНомерСтроки);
	
	Закрыть();
	Оповестить("ПерейтиКСтрокеРедактора", Данные);
КонецПроцедуры 

&НаКлиенте
Процедура ДанныеТочекОстановаВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	ПерейтиКСтрокеРедактораОбработчик();
КонецПроцедуры

#КонецОбласти