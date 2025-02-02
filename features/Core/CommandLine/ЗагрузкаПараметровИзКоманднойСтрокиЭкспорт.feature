﻿# language: ru
# encoding: utf-8
#parent uf:
@UF10_Запуск_VA
#parent ua:
@UA36_запуск_CLI

@IgnoreOnCIMainBuild
@ExportScenarios


Функционал: Для проверки загрузки параметров из командной строки



	
Сценарий: Я запускаю клиент тестирования с эмуляцией запуска из командной строки "ИмяJson" "ДопПараметрКоманднойСтроки" "ОставитьЗагрузчикНастроек"
	И я запоминаю строку "ИмяJson" в переменную "ИмяПеременнойJson"

	И я запоминаю строку "ДопПараметрКоманднойСтроки" в переменную "$ПеременнаяПараметрКоманднойСтроки$"
	Если '$ПеременнаяПараметрКоманднойСтроки$ = "ДопПараметрКоманднойСтроки"' Тогда
		И я удаляю переменную 'ПеременнаяПараметрКоманднойСтроки'
		И я запоминаю строку "" в переменную "$ПеременнаяПараметрКоманднойСтроки$"

	И я запоминаю строку "ОставитьЗагрузчикНастроек" в переменную "$ПеременнаяОставитьЗагрузчикНастроек$"
	Если '$ПеременнаяОставитьЗагрузчикНастроек$ = "ОставитьЗагрузчикНастроек"' Тогда
		И я удаляю переменную 'ПеременнаяОставитьЗагрузчикНастроек'
		И я запоминаю строку "" в переменную "$ПеременнаяОставитьЗагрузчикНастроек$"
		


	И Я запоминаю значение выражения 'ПолучитьСостояниеVanessaAutomation().ТекущаяФича.Каталог + "files\\\\" + $ИмяПеременнойJson$ + ".json"' в переменную "TestJson"
	И Файл "$TestJson$" существует
	
	
	Если 'Ванесса.Объект.ВерсияПоставки = "standart"' Тогда
		И Я запоминаю значение выражения '"vanessa-automation.epf"' в переменную "ИмяEpf"	
	Иначе	
		И Я запоминаю значение выражения '"vanessa-automation-single.epf"' в переменную "ИмяEpf"	
	
	
	И Я запоминаю значение выражения '"""" + КаталогПрограммы() + "1cv8c"" "' в переменную "КаталогПрограммы"	
	И Я запоминаю значение выражения 'СтрЗаменить(СтрокаСоединенияИнформационнойБазы(),"""","""""")' в переменную "СтрокаСоединенияБазы"	
	И Я запоминаю значение выражения '"/IBConnectionString """ + $СтрокаСоединенияБазы$ + """ /N""" + ИмяПользователя() + """"' в переменную "СтрокаСоединенияБазы"	
	
	Если 'Ванесса.Объект.ЗапускатьТестКлиентВРежимеОтладки' Тогда
		И Я запоминаю значение выражения '" /debug " + Ванесса.Объект.КлючиОтладки + " /debuggerURL """ + Ванесса.Объект.АдресОтладчика + """ "' в переменную "ПараметрыОтладчика"	
	Иначе
		И Я запоминаю значение выражения '" "' в переменную "ПараметрыОтладчика"	
	
	И Я запоминаю значение выражения '" /TESTCLIENT -TPort 48111 /Execute " + Ванесса.Объект.КаталогИнструментов + "/" + $ИмяEpf$ + " /CStartFeaturePlayer;ShowMainForm;DisableUserSettingsLoader;NoLoadConfig;VBParams=" + $TestJson$ + ";"' в переменную "ДопПараметр"
	Если 'Найти($ПеременнаяПараметрКоманднойСтроки$,"workspaceRoot") = 0' Тогда
		И Я запоминаю значение выражения '$ДопПараметр$ + "workspaceRoot=" + Ванесса.Объект.КаталогИнструментов + ";"' в переменную "ДопПараметр"
		
	Если '$ПеременнаяОставитьЗагрузчикНастроек$ = "Истина"' Тогда
		И Я запоминаю значение выражения 'СтрЗаменить($ДопПараметр$,"DisableUserSettingsLoader;","")' в переменную "ДопПараметр"
		
	Если '$ПеременнаяПараметрКоманднойСтроки$ <> "" ' Тогда
		И Я запоминаю значение выражения '$ДопПараметр$ + ";" + $ПеременнаяПараметрКоманднойСтроки$' в переменную "ДопПараметр"
	
	Если 'Найти($ДопПараметр$,"GetStepsCache") > 0' Тогда 
		И Я запоминаю значение выражения 'СтрЗаменить($ДопПараметр$,"StartFeaturePlayer;","")' в переменную "ДопПараметр"
	
	И Я запоминаю значение выражения 'Контекст.КаталогПрограммы + Контекст.СтрокаСоединенияБазы + Контекст.ДопПараметр + Контекст.ПараметрыОтладчика' в переменную "СтрокаЗапускаVA3"
	И Я запоминаю значение выражения '"Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(Контекст.КаталогПрограммы + Контекст.СтрокаСоединенияБазы + Контекст.ДопПараметр + Контекст.ПараметрыОтладчика,0)"' в переменную "КомандаЗапускаVA3"
	 
	И я выполняю код встроенного языка
		| '$КомандаЗапускаVA3$' |	
		
	И пауза 10	
		