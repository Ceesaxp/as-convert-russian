# AS-Convert-Russian

**Version 0.5 is macOS Catalina compatible (uses `Music` instead of `iTunes`). It will not work on older Macs, hence v0.4 is provided as a separate script**

I have tried to merge all tag operations within one script, but `album artist` tag kept on failing when iTunes dictionary is used and I could not come up with a way to overcome this issue. Hence there is a 0.4 that should work on pre-Catalina and 0.5 that works on Catalina onwards.

**Version 0.4 adds ability to choose fields/tags to convert**. Thanks to Teodor Zlatanov.

Here's a situation: you have a bunch of MP3s of Russian (or Cyrillic in general) songs that you decided to drag-and-drop add to your iTunes library.  No problem with that, except every once in awhile you end up with songs/artists/albums named using "birds language" instead of proper Cyrillic letters.

I have once in the past stumbled onto a small AppleScript solution that fixed that, but I was unable to trace it down again.  I have, therefore, decided to "scratch this particular itch" and build one myself.

## Installation

### Installation on macOS 11 Big Sur

Simply drop `*.scpt` file into `~/Library/Scripts/Applications/Music` folder.
Run Script Editor (bundled with macOS), select Script Editor > Preferences and enable "Show script menu..." option

### Installation on early macOS versions

Simply drop `*.scpt` file into `~/Library/Scripts/Applications/iTunes` folder
on newer macOS versions drop it into `~/Library/iTunes/Scripts` folder instead. If `Scripts` does not exist — create it.

----

**Версия 0.5 не будет работать на МакОСи <10.15: в ней используется обращение к приложению `Music` вместо `iTunes`. Поэтому 0.4 распространяется в виде отдельного скрипта.**

Я не смог найти способ в одном скрипте сохранить и расширенный набор тегов, и поддерживать версии ОС до 10.15: к сожалению iTunes не понимает тег `album artist` и как я не старался обернуть логику скрипта вокруг этой части -- ничего не получилось. Поэтому 0.4 распространяется отдельно от текущей версии -- там же в репо.

**Версия 0.4 добавила возможность выбирать какие поля/теги конвертировать**. Спасибо Теодору Златанову.

Проблема: ваша коллекция MP3 была создана на Windows или по какой–либо иной причине ID3 тэги были записаны в кодировке cp-1251 (a.k.a. win-1251 или ms-cyrillic).  Вы наконец купили Мак и только что перетащили все это "собрание сочинений" в iTunes.  О, ужас — вместо нормальных названий исполнителей и песен, вы видите кучу непонатных символов.

Вот тут–то `as-convert-russian` и может вам помочь.  Он транслирует _extended ASCII_ символы из кодировки Mac Latin (поскольку именно в эту кодировку они попали) в Unicode, в котором они замечательно будут сохранены в iTunes.


## Как поставить

### Как поставить macOS 11 Big Sur
Скопируйте файл `*.scpt` в папку `~/Library/Scripts/Applications/Music`
Запустите Script Editor (поставляется в составе macOS), выберите Script Editor > Preferences и поставьте чекбокс "Show script menu...".

### Ка поставить на более ранние версии macOS
Скопируйте файл `*.scpt` в папку `~/Library/Scripts/Applications/iTunes`.
Последние версии macOS изменили место хранения сценариев на `~/Library/iTunes/Scripts`. Если директория `Scripts` не существует — создайте её.