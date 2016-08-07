﻿#Использовать logos
#Использовать json

Перем Лог;

Функция УбратьСлешСправа(Стр)
	Если Прав(Стр,1) = "\" Тогда
		Возврат Лев(Стр,СтрДлина(Стр)-1);
	КонецЕсли;
	Если Прав(Стр,1) = "/" Тогда
		Возврат Лев(Стр,СтрДлина(Стр)-1);
	КонецЕсли;

	Возврат Стр;
КонецФункции



Функция ПрочитатьФайлВСтроку(ИмяФайла)
	ФайлПроверкаСуществования = Новый Файл(ИмяФайла);
	Если НЕ ФайлПроверкаСуществования.Существует() Тогда
		ВызватьИсключение("Файл " + ИмяФайла + " не существует!");
	КонецЕсли;


	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФайла,"UTF-8");
	Рез = "";

	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;

		Рез = Рез + Стр + Символы.ПС;
	КонецЦикла;

	Текст.Закрыть();

	Возврат  Рез;
КонецФункции

Функция ПреобразоватьПутьСТочкамиКНормальномуПути(ОригСтр)
	ИмяВременногоФайлаКоманда = ПолучитьИмяВременногоФайла("cmd");
	ИмяВременногоФайлаЛог     = ПолучитьИмяВременногоФайла("txt");

	//ИмяВременногоФайлаКоманда = "h:\commons\temp\111.cmd";
	//ИмяВременногоФайлаЛог     = "h:\commons\temp\111.txt";


	Команда = "@echo on
				|for %%f in ( """ + ОригСтр + """ ) do set fullname=%%~ff
				|echo %fullname% > " + ИмяВременногоФайлаЛог;


	//Сообщить(""+ Команда);

	ЗТ = Новый ЗаписьТекста(ИмяВременногоФайлаКоманда,"UTF-8",,Ложь);
	ЗТ.ЗаписатьСтроку(Команда);

	ЗТ.Закрыть();




	retCode = -1;
	ЗапуститьПриложение(ИмяВременногоФайлаКоманда,,Истина,retCode);


	Рез = ОригСтр;

	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяВременногоФайлаЛог,"UTF-8");

	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;

		Если СокрЛП(Стр) = "" Тогда
			Продолжить;
		КонецЕсли;


		Рез = Стр;

	КонецЦикла;

	Текст.Закрыть();

	Возврат Рез;

КонецФункции

Процедура ПреобразоватьПараметрыКоторыеНачинаютсяСТочкиКНормальнымПутям(ПараметрыСборки)
	МассивКлючей = Новый Массив;

	Для каждого ПараметрСборки Из ПараметрыСборки Цикл
		Если Лев(ПараметрСборки.Значение,1) = "." Тогда
			МассивКлючей.Добавить(ПараметрСборки.Ключ);
		КонецЕсли;
	КонецЦикла;

	Для каждого Ключ Из МассивКлючей Цикл
		Было  = ПараметрыСборки[Ключ];
		Стало = ПреобразоватьПутьСТочкамиКНормальномуПути(ПараметрыСборки[Ключ]);
		//Сообщить("Было=" + Было + ", Стало="+Стало);

		ПараметрыСборки.Вставить(Ключ,Стало);
	КонецЦикла;
КонецПроцедуры

Функция ПрочитатьФайлJSON(ИмяФайла)
	JsonСтрока  = ПрочитатьФайлВСтроку(ИмяФайла);
	ПарсерJSON  = Новый ПарсерJSON();
	Рез         = ПарсерJSON.ПрочитатьJSON(JsonСтрока);
	//ПреобразоватьПараметрыКоторыеНачинаютсяСТочкиКНормальнымПутям(Рез);
	Рез.Вставить("ИмяФайлаСборки",ИмяФайла);
	Возврат Рез;
КонецФункции

Функция РазложитьСтрокуВМассивПодстрок(Знач Строка, Знач Разделитель = ",", Знач ПропускатьПустыеСтроки = Неопределено) Экспорт

	Результат = Новый Массив;

	// для обеспечения обратной совместимости
	Если ПропускатьПустыеСтроки = Неопределено Тогда
		ПропускатьПустыеСтроки = ?(Разделитель = " ", Истина, Ложь);
		Если ПустаяСтрока(Строка) Тогда
			Если Разделитель = " " Тогда
				Результат.Добавить("");
			КонецЕсли;
			Возврат Результат;
		КонецЕсли;
	КонецЕсли;
	//

	Позиция = Найти(Строка, Разделитель);
	Пока Позиция > 0 Цикл
		Подстрока = Лев(Строка, Позиция - 1);
		Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Подстрока) Тогда
			Результат.Добавить(Подстрока);
		КонецЕсли;
		Строка = Сред(Строка, Позиция + СтрДлина(Разделитель));
		Позиция = Найти(Строка, Разделитель);
	КонецЦикла;

	Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Строка) Тогда
		Результат.Добавить(Строка);
	КонецЕсли;

	Возврат Результат;

КонецФункции

Функция ДобавитьНулейДоНужнойДлинны(Знач Стр,Кол)
	Пока СтрДлина(Стр) < Кол Цикл
		Стр = "0" + Стр;
	КонецЦикла;

	Возврат Стр;
КонецФункции

Функция СоздатьСтрокуДляСортировкиВерсии(Стр)
	Рез = "";

	Массив = РазложитьСтрокуВМассивПодстрок(Стр,".");
	Для каждого Элем Из Массив Цикл
		Рез = Рез + ДобавитьНулейДоНужнойДлинны(Элем,7);
	КонецЦикла;

	Возврат Рез;
КонецФункции



Функция НайтиСамуюПозднююВерсиюПлатформыПоСтрокеПоиска(СтрокаПоискаВерсияПлатформы,КаталогПоискаВерсииПлатформы,ПараметрыСборки)

	ТаблицаВерсий = Новый ТаблицаЗначений;
	ТаблицаВерсий.Колонки.Добавить("Имя");
	ТаблицаВерсий.Колонки.Добавить("ДляСортировки");

	Файлы = НайтиФайлы(КаталогПоискаВерсииПлатформы,СтрокаПоискаВерсияПлатформы + "*",Истина);
	Для каждого Файл Из Файлы Цикл
		Если Не Файл.ЭтоКаталог() Тогда
			Продолжить;
		КонецЕсли;

		СтрТаблицаВерсий     = ТаблицаВерсий.Добавить();
		СтрТаблицаВерсий.Имя = Файл.Имя;
		СтрТаблицаВерсий.ДляСортировки = СоздатьСтрокуДляСортировкиВерсии(СтрТаблицаВерсий.Имя);
		//Сообщить("СтрТаблицаВерсий.ДляСортировки="+СтрТаблицаВерсий.ДляСортировки);
	КонецЦикла;

	Если ТаблицаВерсий.Количество() = 0 Тогда
		Стр = "Не найдено ни одной версии по строке <" + СтрокаПоискаВерсияПлатформы + ">" + " в каталоге <" + КаталогПоискаВерсииПлатформы + ">";
		Лог.Ошибка(Стр);
		ВызватьИсключение(Стр);
	КонецЕсли;

	ТаблицаВерсий.Сортировать("ДляСортировки убыв");

	ИмяФайлаЗапуска = "1cv8c.exe";
	Если НРег(ПараметрыСборки["ЗапускатьТолстыйКлиент"]) = "истина" Тогда
		ИмяФайлаЗапуска = "1cv8.exe";
	КонецЕсли;
	Рез = УбратьСлешСправа(КаталогПоискаВерсииПлатформы) + "\" +  ТаблицаВерсий[0].Имя + "\bin\" + ИмяФайлаЗапуска;

	Возврат """" + Рез + """";
КонецФункции

Функция ПолучитьСтрокуЗапускаСборки(ПараметрыСборки)
	//Стр = "start /wait /MAX """" " + ПараметрыСборки["ПутьК1С"];
	Стр = ПараметрыСборки["ПутьК1С"];
	Стр = Стр + " " + ПараметрыСборки["СтрокаПодключенияКБазе"];

	ФайлПараметров = Новый Файл(ПараметрыСборки["ИмяФайлаСборки"]);
	Стр = Стр + " /Execute " + ПараметрыСборки["ПутьКVanessaBehavior"] + " /C""StartFeaturePlayer;VBParams=" + ФайлПараметров.ПолноеИмя +  """ /TESTMANAGER ";

	Если ПараметрыСборки["ВыводитьСообщенияВФайл"] <> Неопределено Тогда
		Стр = Стр + " /Out""" + ПараметрыСборки["ВыводитьСообщенияВФайл"] + """";
	КонецЕсли;


	Возврат Стр;
КонецФункции

Функция ПолучитьСтрокуЗапускаИнициализации(ПараметрыСборки)
	Стр = ПараметрыСборки["ПутьК1С"];
	Стр = Стр + " " + ПараметрыСборки["СтрокаПодключенияКБазе"];

	Стр = Стр + " /Execute " + ПараметрыСборки["EpfДляИнициализацияБазы"] + " /C""InitDataBase;VBParams=" + ПараметрыСборки["ПараметрыДляИнициализацияБазы"] + """";


	Возврат Стр;
КонецФункции

Процедура ЗавершитьВсеВозможноЗависшиеПроцессы()
	СтрокаКоманды = "TASKKILL /F /IM 1cv8c.exe"; retCode = -1;
	ЗапуститьПриложение(СтрокаКоманды,,Истина,retCode);

	СтрокаКоманды = "TASKKILL /F /IM 1cv8.exe"; retCode = -1;
	ЗапуститьПриложение(СтрокаКоманды,,Истина,retCode);

	СтрокаКоманды = "TASKKILL /F /IM 1cv8s.exe"; retCode = -1;
	ЗапуститьПриложение(СтрокаКоманды,,Истина,retCode);

	СтрокаКоманды = "TASKKILL /F /IM vlc.exe"; retCode = -1;
	ЗапуститьПриложение(СтрокаКоманды,,Истина,retCode);
КонецПроцедуры

Процедура ВыполнитьЗапускОднойСборки(ПараметрыСборки)

	ЗавершитьВсеВозможноЗависшиеПроцессы();


	ПутьК1С        = НайтиСамуюПозднююВерсиюПлатформыПоСтрокеПоиска(ПараметрыСборки["ВерсияПлатформы"],ПараметрыСборки["КаталогПоискаВерсииПлатформы"],ПараметрыСборки);
	ПараметрыСборки.Вставить("ПутьК1С",ПутьК1С);
	Лог.Информация("Была найдена версия платформы: " + ПутьК1С);


	EpfДляИнициализацияБазы = ПараметрыСборки["EpfДляИнициализацияБазы"];
	Если EpfДляИнициализацияБазы <> Неопределено Тогда
		//значит надо запустить обработку, которая сделает инициализацию базы и закроет сеанс 1С
		СтрокаЗапускаСборки = ПолучитьСтрокуЗапускаИнициализации(ПараметрыСборки);
		retCode = -1;
		Лог.Информация("Строка запуска 1С для инициализации: " + СтрокаЗапускаСборки);
		ЗапуститьПриложение(СтрокаЗапускаСборки,,Истина,retCode);
		Если retCode <> 0 Тогда
			Сообщить("Запуск сеанса 1С для инициализации базы вернул код возврата: " + retCode);
			ЗавершитьРаботу(1);
		КонецЕсли;
	КонецЕсли;


	СтрокаЗапускаСборки = ПолучитьСтрокуЗапускаСборки(ПараметрыСборки);
	//ИмяВременногоBAT = ПолучитьИмяВременногоФайла("bat");
	//ЗТ = Новый ЗаписьТекста(ИмяВременногоBAT,"UTF-8",,Истина);
	//ЗТ.ЗаписатьСтроку(СтрокаЗапускаСборки);
	//ЗТ.Закрыть();


	Лог.Информация("Строка запуска сборки: " + СтрокаЗапускаСборки);

	retCode = -1;
	ЗапуститьПриложение(СтрокаЗапускаСборки,,Истина,retCode);
	Если retCode <> 0 Тогда
		Сообщить("Запуск сеанса 1С вернул код возврата: " + retCode);
		ЗавершитьРаботу(1);
	КонецЕсли;


КонецПроцедуры


Процедура ПроверитьПараметрыСборкиНаКорректность(ПараметрыСборки,ИмяФайлаВариантСборки)
	Если Не ЗначениеЗаполнено(ПараметрыСборки["ИмяСборки"]) Тогда
		Стр = ИмяФайлаВариантСборки + ". Не указан параметр ""ИмяСборки""!";
		Лог.Ошибка(Стр);
		ВызватьИсключение(Стр);
	КонецЕсли;
	Если Не ЗначениеЗаполнено(ПараметрыСборки["ВерсияПлатформы"]) Тогда
		Стр = ИмяФайлаВариантСборки + ". Не указан параметр ""ВерсияПлатформы""!";
		Лог.Ошибка(Стр);
		ВызватьИсключение(Стр);
	КонецЕсли;
	Если Не ЗначениеЗаполнено(ПараметрыСборки["КаталогПоискаВерсииПлатформы"]) Тогда
		Стр = ИмяФайлаВариантСборки + ". Не указан параметр ""КаталогПоискаВерсииПлатформы""!";
		Лог.Ошибка(Стр);
		ВызватьИсключение(Стр);
	КонецЕсли;
	Если Не ЗначениеЗаполнено(ПараметрыСборки["КаталогФич"]) Тогда
		Стр = ИмяФайлаВариантСборки + ". Не указан параметр ""КаталогФич""!";
		Лог.Ошибка(Стр);
		ВызватьИсключение(Стр);
	КонецЕсли;
	Если Не ЗначениеЗаполнено(ПараметрыСборки["СтрокаПодключенияКБазе"]) Тогда
		Стр = ИмяФайлаВариантСборки + ". Не указан параметр ""СтрокаПодключенияКБазе""!";
		Лог.Ошибка(Стр);
		ВызватьИсключение(Стр);
	КонецЕсли;
	Если Не ЗначениеЗаполнено(ПараметрыСборки["ПутьКVanessaBehavior"]) Тогда
		Стр = ИмяФайлаВариантСборки + ". Не указан параметр ""ПутьКVanessaBehavior""!";
		Лог.Ошибка(Стр);
		ВызватьИсключение(Стр);
	КонецЕсли;
КонецПроцедуры

Процедура ОчиститьКаталоги(МассивКаталогов)
	Для каждого Каталог Из МассивКаталогов Цикл
		ФайлПроверкаСуществования = Новый Файл(Каталог);
		Если НЕ ФайлПроверкаСуществования.Существует() Тогда
			Продолжить;
		КонецЕсли;


		Файлы = НайтиФайлы(Каталог,"*");
		Для каждого Файл Из Файлы Цикл
			УдалитьФайлы(Файл.ПолноеИмя);
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

Процедура УдалитьФайлСтатусВсехСборок(ПараметрыСборки)
	ВыгружатьСтатусВыполненияСценариевВФайл = ПараметрыСборки["ВыгружатьСтатусВыполненияСценариевВФайл"];
	Если НРег(ВыгружатьСтатусВыполненияСценариевВФайл) <> "истина" Тогда
		Возврат;
	КонецЕсли;

	ИмяФайлаСтатусаСборки = ПараметрыСборки["ПутьКФайлуДляВыгрузкиСтатусаВыполненияСценариев"];
	Сообщить(ИмяФайлаСтатусаСборки);
	ФайлПроверкаСуществования = Новый Файл(ИмяФайлаСтатусаСборки);
	Если  ФайлПроверкаСуществования.Существует() Тогда
		УдалитьФайлы(ФайлПроверкаСуществования.ПолноеИмя);
	КонецЕсли;
КонецПроцедуры

Процедура ОбновитьСтатусВсехСборок(СтатусЗапускаВсехСборок,ПараметрыСборки)
	ВыгружатьСтатусВыполненияСценариевВФайл = ПараметрыСборки["ВыгружатьСтатусВыполненияСценариевВФайл"];
	Если НРег(ВыгружатьСтатусВыполненияСценариевВФайл) <> "истина" Тогда
		Возврат;
	КонецЕсли;

	ИмяФайлаСтатусаСборки = ПараметрыСборки["ПутьКФайлуДляВыгрузкиСтатусаВыполненияСценариев"];
	ФайлПроверкаСуществования = Новый Файл(ИмяФайлаСтатусаСборки);
	Если НЕ ФайлПроверкаСуществования.Существует() Тогда
		ИмяФайлаСтатусаСборки = Новый Файл(ОбъединитьПути(ПараметрыСборки["ПутьКVanessaBehavior"], ИмяФайлаСтатусаСборки)).ПолноеИмя;
		ФайлПроверкаСуществования = Новый Файл(ИмяФайлаСтатусаСборки);
		Если НЕ ФайлПроверкаСуществования.Существует() Тогда
				Лог.Информация("Ошибка в ОбновитьСтатусВсехСборок. Файл " + ИмяФайлаСтатусаСборки + " не существует!");
				СтатусЗапускаВсехСборок = 1;
				Возврат;
		КонецЕсли;
	КонецЕсли;



	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФайлаСтатусаСборки,"UTF-8");

	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;

		Если Стр <> "0" Тогда
			СтатусЗапускаВсехСборок = 1; //значит были упавшие шаги
			Лог.Информация("Найден флаг неудачной сборки.");
		КонецЕсли;
	КонецЦикла;

	Текст.Закрыть();
КонецПроцедуры

Процедура ВыполнитьЗапускВсехСборок(ОсновнойФайлПараметров)
	ОсновныеПараметры = ПрочитатьФайлJSON(ОсновнойФайлПараметров);

	КаталогиДляОчистки = ОсновныеПараметры["КаталогиДляОчистки"];
	ОчиститьКаталоги(КаталогиДляОчистки);


	МассивВариантыСборок = ОсновныеПараметры["ВариантыСборок"];

	Сборки = Новый Массив;

	Лог.Информация("Проверяю корректность переданных параметров...");
	Для каждого ИмяФайлаВариантСборки Из МассивВариантыСборок Цикл
		ФайлПроверкаСуществования = Новый Файл(ИмяФайлаВариантСборки);
		Если НЕ ФайлПроверкаСуществования.Существует() Тогда
			//ВызватьИсключение("Файл " + ИмяФайлаВариантСборки + " не существует!");
		КонецЕсли;



		ПараметрыСборки = ПрочитатьФайлJSON(ИмяФайлаВариантСборки);
		ПроверитьПараметрыСборкиНаКорректность(ПараметрыСборки,ИмяФайлаВариантСборки);

		Сборки.Добавить(Новый Структура("ИмяФайлаВариантСборки,ПараметрыСборки",ИмяФайлаВариантСборки,ПараметрыСборки));
	КонецЦикла;


	Лог.Информация("-----------------------------------------");

	СтатусЗапускаВсехСборок = 0;

	Для каждого Сборка Из Сборки Цикл
		Лог.Информация("Запускаю сборку по файлу <" + Сборка.ИмяФайлаВариантСборки + ">");

		ПараметрыСборки = ПрочитатьФайлJSON(Сборка.ИмяФайлаВариантСборки);
		Лог.Информация("ИмяСборки = <" + ПараметрыСборки["ИмяСборки"] + ">");

		УдалитьФайлСтатусВсехСборок(ПараметрыСборки);

		ВыполнитьЗапускОднойСборки(ПараметрыСборки);

		ОбновитьСтатусВсехСборок(СтатусЗапускаВсехСборок,ПараметрыСборки);

		Лог.Информация("-----------------------------------------");
	КонецЦикла;

	Если СтатусЗапускаВсехСборок <> 0 Тогда
		Лог.Информация("БЫЛИ ОШИБКИ ВО ВРЕМЯ ВЫПОЛНЕНИЯ СЦЕНАРИЕВ!");
	Иначе
		Лог.Информация("Ошибок не было!");
	КонецЕсли;

	ЗавершитьРаботу(СтатусЗапускаВсехСборок);
КонецПроцедуры





Лог = Логирование.ПолучитьЛог("behavior.run.log");

//Лог.Информация("Запуск записи сценариев...");



Если АргументыКоманднойСтроки.Количество() = 0 Тогда
	Лог.Ошибка("Не передан файл параметров!");
	//Возврат;
ИначеЕсли АргументыКоманднойСтроки.Количество() > 1 Тогда
	Лог.Ошибка("Скрипт принимает только один параметр!");
	//Возврат;
Иначе
	ВыполнитьЗапускВсехСборок(АргументыКоманднойСтроки[0]);
КонецЕсли;
