# AS-Convert-Russian

**Version 0.4 adds ability to choose fields/tags to convert**. Thanks to Teodor Zlatanov.

Here's a situation: you have a bunch of MP3s of Russian (or Cyrillic in general) songs that you decided to drag-and-drop add to your iTunes library.  No problem with that, except every once in awhile you end up with songs/artists/albums named using "birds language" instead of proper Cyrillic letters.

I have once in the past stumbled onto a small AppleScript solution that fixed that, but I was unable to trace it down again.  I have, therefore, decided to "scratch this particular itch" and build one myself.

## Installation

Simply drop `*.scpt` file into `~/Library/Scripts/Applications/iTunes` folder

on newer macOS versions drop it into `~/Library/iTunes/Scripts` folder instead. If `Scripts` does not exist — create it.

----

**Версия 0.4 добавила возможность выбирать какие поля/теги конвертировать**. Спасибо Теодору Златанову.

Проблема: ваша коллекция MP3 была создана на Windows или по какой–либо иной причине ID3 тэги были записаны в кодировке cp-1251 (a.k.a. win-1251 или ms-cyrillic).  Вы наконец купили Мак и только что перетащили все это "собрание сочинений" в iTunes.  О, ужас — вместо нормальных названий исполнителей и песен, вы видите кучу непонатных символов.

Вот тут–то `as-convert-russian` и может вам помочь.  Он транслирует _extended ASCII_ символы из кодировки Mac Latin (поскольку именно в эту кодировку они попали) в Unicode, в котором они замечательно будут сохранены в iTunes.

## Как поставить

Скопируйте файл `*.scpt` в папку `~/Library/Scripts/Applications/iTunes`.

Последние версии macOS изменили место хранения сценариев на `~/Library/iTunes/Scripts`. Если директория `Scripts` не существует — создайте её.

----

Automatically exported from code.google.com/p/as-convert-russian
