﻿# language: ru

Функциональность: Примеры циклов.

Сценарий: Примеры циклов.

	* Шаги, которые созданы как циклы

		Дано для каждой строки таблицы "ИмяТаблицы" я выполняю
			И Пауза 1
			//какие-то действия

		Затем я делаю 10 раз
			// какие-то действия

		Когда в течение 100 секунд я выполняю
			// какие-то действия
			Тогда я продолжаю цикл
			// какие-то действия

		И пока выражение встроенного языка 'УсловиеНаВстроенномЯзыке' истинно я выполняю
			// какие-то действия
			Тогда я прерываю цикл
			// какие-то действия
