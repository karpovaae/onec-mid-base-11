#Область ПрограммныйИнтерфейс

//Добавление поля КонтактноеЛицо на форму документов
Процедура ДополнитьФорму(Форма) Экспорт
	// {{Карпова А.Е. 06.05.2025
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		ДобавитьПолеСогласованнаяСкидка(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
	КонецЕсли;
	// Карпова А.Е. 06.05.2025}}
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

//Добавление поля КонтактноеЛицо в форму документов
Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	// {{Карпова А.Е. 06.05.2025
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Д_КонтактноеЛицо";
	// Карпова А.Е. 06.05.2025}}
КонецПроцедуры

//Добавление поля КонтактноеЛицо в форму документов
Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма)
	// {{Карпова А.Е. 06.05.2025
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), ,Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Д_КонтактноеЛицо";
	// Карпова А.Е. 06.05.2025}}
КонецПроцедуры

Процедура ДобавитьПолеСогласованнаяСкидка(Форма)
	// {{Карпова А.Е. 06.05.2025
	ГруппаСогласованнаяСкидка = Форма.Элементы.Вставить("ГруппаСогласованнаяСкидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ГруппаСогласованнаяСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаСогласованнаяСкидка);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Д_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "ПриИзмененииСогласованнаяСкидка");
	
	Команда = Форма.Команды.Добавить("Пересчитать");
	Команда.Действие = "КомандаПересчитать";
	
	КнопкаФормы = Форма.Элементы.Добавить ("Пересчитать", Тип("КнопкаФормы"), Форма.Элементы.ГруппаСогласованнаяСкидка);
	КнопкаФормы.ИмяКоманды = "Пересчитать";
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	// Карпова А.Е. 06.05.2025}}
КонецПроцедуры

#КонецОбласти
