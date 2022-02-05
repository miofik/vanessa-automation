﻿# language: ru

@lessons

Функционал: Интерактивная справка. Как устроены шаги сценариев? Снипеты шагов.

Сценарий: Как устроены шаги сценариев? Снипеты шагов.

	* Привет! В этом уроке я расскажу тебе про то, что такое снипет шага сценария и что означает сообщение "Пустой адрес сн^ипета". Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения

	* И загр^узим тестовый пример.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Ложь"
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\ПримерСнипетыШагов.feature"

	* Давай немного поговорим о том, что такое снипет шага.
	* Снипет - это специальная служебная строка. Она вычисляется по определенному алгоритму.

	* Сначала отбрасывается ключевое слово в начале строк^и.
	* В данном случае это ключевое слово Дано
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения "Дано" 'Ключевое слово "Дано"'
		И Пауза 4
	* Затем из шага убираются все параметры.
	* В данном примере их два.
	* Первый параметр
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения '"Параметр1"' 'Первый параметр'
		И Пауза 4
	* И второй параметр
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения '"Параметр2"' 'Второй параметр'
		И Пауза 4
	* То что осталось от исходной строк^и называется снипетом шага.
	* В данном случае снипет будет выглядеть вот так
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения "ПримерШагаСПервымПараметромИВторымПараметром" 'Снипет шага'
		И Пауза 4

	* Далее важный момент. Каждый шаг, который использует Vanessa Automation находится в каком-то epf файле из доступной библиотеки шагов.
	* Когда шаг объявляется в библиотеке, то он сообщает системе, какому снипету он соответствует.
		И Я делаю подсветку элемента формы VA по имени "ГруппаКаталогиБиблиотек" "Библиотеки шагов"
	* Таким образом устанавливается соответствие между шагом сценария и конкретной процедурой кода на языке 1С, которая будет в итоге выполняться.
	* Если для данного сн^ипета не объявлено ни одного шага, то во время выполнения сценария будет выдано сообщение.
	* Пустой адрес сн^ипета у данного шага.
	* Давай запустим сценарий на выполнение, чтобы в этом убедиться.
		И Я запускаю сценарий VA в режиме обучения и жду окончания выполнения
		
	* Это сообщение означает, что для данной строк^и сценария не найден epf файл, который реализует выполнение шага, находящегося в этой строке.
		И я делаю подсветку в окне сообщений по части строки 'Пустой адрес снипета у шага' 'Сообщение: "Пустой адрес снипета у шага"'
	* Также в редакторе строка шага была раскрашена специальным цветом.
		И я делаю подсветку текста в редакторе VA в режиме обучения с 7 по 7 строку "Специальная раскраска цветом"
	* Обычно это значит, что либо шаг написан неверно, например с опечатками.
	* Либо не подкл^ючена библиотека шагов, в которой этот шаг реализован.

	* На этом всё, переходи к следующему уроку интерактивной справки.
