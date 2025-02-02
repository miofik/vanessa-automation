﻿# language: ru

@lessons

Функционал: Интерактивная справка. Циклы.

Сценарий: Циклы.

	* Привет! В этом уроке я расскажу тебе про особенности использования циклов в сценариях. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения

	* И загр^узим тестовый пример.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Истина"
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\ПримерЦиклов1.feature"

	* Первый момент. Шаг, который является циклом может начинаться с любого ключевого сл^ова.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'Дано для каждой строки таблицы "ИмяТаблицы" я выполняю' 'Пример шага-цикла'
	* Если шаг является циклом, то он помечается в редакторе специальной пометкой слева.	
	* Шаги, которые находятся внутри цикла отделяются дополнительным отступом.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'И Пауза 1' 'Шаг внутри цикла'

	* Такие шаги помечаются специальной пометкой когда они объявляются в epf файлах.
	* Они также выделяются фиолетовым цветом в дереве известных шагов Vanessa Automation.
	* Вот некоторые примеры таких шагов циклов.
		И я делаю подсветку текста в редакторе VA в режиме обучения с 9 по 24 строку подсценарий "Примеры использования циклов"

	* Второй момент. Есть специальные шаги, которые позволяют прервать выполнение цикла или продолжить выполнениеи цикла.
	* Этот шаг позволяет продолжить выполнение цикла.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'Тогда я продолжаю цикл' 'Продолжение выполнение цикла'
	* Он является аналогом оператора Продолжить из встроенного языка 1С.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'Тогда я продолжаю цикл' 'Аналог оператора "Продолжить"'

	* Также есть специальный шаг, который прерывает выполнение цикла.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'Тогда я прерываю цикл' 'Прерывание выполнение цикла'
	* Это аналог оператора Прервать из встроенного языка 1С.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'Тогда я прерываю цикл' 'Аналог оператора "Прервать"'

	* Важный момент. Использование циклов в тексте сценария должно быть обосновано.
	* Стоит избегать использование циклов там, где без них можно обойтись.

	* На этом всё, переходи к следующему уроку интерактивной справки.
