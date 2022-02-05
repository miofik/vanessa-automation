﻿# language: ru

@lessons

Функционал: Интерактивная справка. Как устроен feature файл? Секция Переменные.

Сценарий: Как устроен feature файл? Секция Переменные.

	* Привет! В этом уроке я расскажу тебе про то, для чего в фича файле нужна секция Переменные. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения

	* И загр^узим тестовый пример.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Ложь"
		И я отключаю показ строк подсценариев в редакторе VA в режиме обучения
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\ПримерКакУстроенФичаФайлСекцияПеременныеПростые.feature"
		И я позиционирую в центр строку редактора VA в режиме обучения 1

	* Данная секция позволяет описать переменные в виде одиночных простых переменных или в виде таблиц переменных.
		
	* Секция объявляется соответствующим ключевым словом
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'Переменные:' 'Ключевое слово Переменные'
	* Значения переменных могут быть простого типа, либо вычисляться через выражение.
	* Вот пример, когда объявлена простая переменная.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'Перем1 = "ПеременнаяТипаСтрокаВКавычках"' 'Объявление переменной'
	* Или вот
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий 'Перем2 = \'ПеременнаяТипаСтрокаВАпострофах\'' 'Объявление переменной'
	* Также можно объявлять многострочные строки, как в этом примере
		И я делаю подсветку текста в редакторе VA в режиме обучения с 9 по 14 строку "Многострочная переменная"
	* Если значение переменной нужно вычислить с помощью выражения на встроенном языке 1С, то для этого нужно использовать фигурные скобки.
	* В данном примере выражение будет вычисляться на стороне клиента.
		И я устанавливаю флаг настройки Vanessa Automation "ВычислятьВыраженияВФигурныхСкобках"
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий '\{Строка(1+1)\}' 'Выражение на клиенте'
	* А это в выражение будет вычисляться на стороне сервера, т.к. используется символ восклицательного знака.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий '\{!Строка(1+1)\}' 'Выражение на сервере'
	* Он указывается тут
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий '!' 'Признак выражения на сервере'

	* Также выражение в фигурных скобках можно использовать внутри других строк, как показано в этом примере
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий '"Значение=\{!Строка(1+1)\}."' 'Выражение внутри строки'

	* Важно понимать, что все выражения будут вычисляться на стороне менеджера тестирования, а не на стороне клиента тестирования.	
	
	* Все значения из секции Переменные будут проинициализированы перед запуском каждого сценария из ф^ичи.
		И я делаю подсветку текста в редакторе VA в режиме обучения с 7 по 17 строку "Переменные"
	* И важный нью^анс. Такие переменные можно передавать в шаги не указывая какие-либо спецсимволы.
	* Например как это сделано в этой строке.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий '"Перем1"' 'Передача переменной в шаг без символов $'
	* Также можно передать значение переменной внутри другой строк^и с помощью фигурных скобок как это показано тут.
		И я делаю подсветку фрагмента текста в редакторе VA в режиме обучения подсценарий '"Часть3\{Перем2\}Часть4"' 'Выражение внутри строки'

	* Ты можешь запустить данный сценарий на выполнение. Тогда в окне сообщений пользователя будут выведены значения всех переменных.
		И я делаю подсветку элементов VA "ЭтотСеанс" "Запустить сценарий на выполнение" UI Automation
			| 'Имя'                                  |
			| 'ПанельVanessaEditorВыполнитьСценарии' |

	* На этом всё, переходи к следующему уроку интерактивной справки.

