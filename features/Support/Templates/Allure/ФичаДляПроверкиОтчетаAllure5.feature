# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA25_Макеты_для_отчетов_о_выполнении

@IgnoreOnCIMainBuild

#report.feature=УровеньFeature

Функциональность: Тестовая фича, проверяющая генерацию отчета Allure часть 5
 


Сценарий: Story. Выполнение первого простого сценария.
	Когда я выполняю простой шаг
	И я выполняю ещё простой шаг
	Тогда я вызываю исключение "Ошибка в сценари."
	