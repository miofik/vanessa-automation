﻿# language: ru

@lessons

Функционал: Интерактивная справка. Подсценарии.

Сценарий: Подсценарии.

	* Привет! В этом уроке я расскажу тебе про то, как работать с подсценариями. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения

	* И загр^узим тестовый пример.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Истина"
		И я устанавливаю опцию VA в режиме обучения "ПоказыватьСтрокиПодсценариевVanessaEdittor" "Ложь"
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\Экспорт\ЭкспортныеСценарииПростые.feature"
		И я позиционирую в центр строку редактора VA в режиме обучения 1
	
	* Для того, чтобы сценарии данной ф^ичи можно было вызывать из других сценариев - надо в секции тегов указать специальный тег.
	* Это тэг Export Scen^arios.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "@ExportScenarios" 'Тэг @ExportScenarios'

	* Если данный тэг указан в фиче, то все сценарии из неё можно будет вызывать в других сценариях.
	* Вот пример объявления такого сценария.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий "Я вызываю подсценарий без параметров" 'Объявление сценария'

	* В данный сценарии нельзя передать параметры, т.к. они в нём не объявлены.
	* А вот пример сценария, в который можно будет передать параметр.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'Я вызываю подсценарий с параметром "Парам1"' 'Cценарий с параметром'
	* Вот так происходит объявление, что сценарий может принимать параметр.
		И Я делаю подсветку фрагмента текста в редакторе VA в строке в режиме обучения подсценарий 15 '"Парам1"' 'Объявление параметра'

	* Чтобы переданное значение параметра попало в шаги подсценария, нужно чтобы такая же строка передавалась в его шаги.
	* Например вот так.
		И Я делаю подсветку фрагмента текста в редакторе VA в строке в режиме обучения подсценарий 17 '"Парам1"' 'Параметр передан в шаг'

	* Также параметр можно передать как часть параметра шага.
	* Например вот так.
		И Я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий '[Парам1]' 'Параметр передан внутри строки'

	* Теперь посмотрим кап происходит вызов этого подсценария из других сценариев. Откроем тестовый пример.
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\ПримерПодсценарии1.feature"

	* Чтобы вызвать подсценарий надо написать любое ключевое слово из языка Gherkin и затем имя сценария.
	* Вот пример вызова первого подсценария.
		И Я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'И я вызываю подсценарий без параметров' 'Вызов подсценария'

	* А вот  вызов второго подсценария с передачей в него параметра
		И Я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'И я вызываю подсценарий с параметром "ЗначениеПараметра"' 'Вызов подсценария с параметром'

	* Как не трудно заметить вызов подсценария мало чем отличается от вызова обычного шага сценария.
	* Чтобы обозначить вызов подсценария редактор подчеркивает такие строки одной чертой.

	* Ты можешь запустить данный сценарий на выполнение. Тогда в окне сообщений пользователя будут выведены значения всех переменных.
		И я делаю подсветку элементов VA "ЭтотСеанс" "Запустить сценарий на выполнение" UI Automation
			| 'Имя'                                  |
			| 'ПанельVanessaEditorВыполнитьСценарии' |


	* На этом всё, переходи к следующему уроку интерактивной справки.


