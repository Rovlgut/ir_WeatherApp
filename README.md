# Описание

iRacing Weather Browser App

Показывает "влажность трека" и "осадки"

Осадки это насколько идет дождь. Я подозреваю что тоже и радар. Не шанс дождя. Но замечал различия с радаром. Так что оно что-то показывает, но не знаю что точно.

# Установка

- Создать папку на которую Kapps следает ссылку
(Рекомендую сделать в документах iRacing папку CustomApps, чтобы не потерять)

- Извлечь приложения в папку. Две папки: приложения WeatherApp и libs.
    Должно выглядить как: Documents\iRacing\CustomApps\WeatherApp. В "WeatherApp" папки 'css' и 'fonts'; файлы 'app.coffee' и 'index.html'

- Запустить Kapps от администратора (Kapps нужно создать симлинк). Во вкладке 'App' открыть 'Settings'. Добавить папку в 'App Folder'. Нужно выбрать ту что создали на первом шаге (CustomApps). И сохранить 'Save'
    Чтобы проверить что сработало, перейти в `%AppData%\Kapps\iRacingBrowserApps`. Там должен быть ярлык 'apps', который ведет в нашу папку.

- Перейти в 'Racing Overlay'. Пролестать вниз и добавить 'Add Custom Overlay'. Ввести имя, путь и поставить нужные галки ('not in iRacing' наверняка)
    - Название может быть любым
    - URL должно быть 'http://127.0.0.1:8182/WeatherApp/'

Теперь можно открыть оверлей и настроить новый квадратик.


# Discription

iRacing Weather Browser App

Shows 'track wetness' and 'precipiration'

Precipiration is how much its rains. My guess its mirrors radar. Not a chance of rain. But notice some difference with radar. So its showing something, but don't know what exactly.

# Istall

- Make folder that Kapps will make link.
(Recomment in iRacing document make folder CustomApps, so not to lost it.)

- Extract app to folder. ЕцTwo folders: app WeatherApp and libs.
    Should look like: Documents\iRacing\CustomApps\WeatherApp. In WeatherApp should be folders 'css' and 'fonts'; files 'app.coffee' and 'index.html'
    
- Run Kapps with admin (Kapps need to create symlink). In tab 'App' open 'Settings'. Add folder to 'App Folder'. Need to select folder that in first step (CustomApps). And 'Save'
    To check if it worked, got to folder `%AppData%\Kapps\iRacingBrowserApps`. There should be shortcut 'apps' that leads to our folder.

- Go to 'Racing Overlay'. Scroll down and 'Add Custom Overlay'. Enter name, url and tick boxes what needed ('not in iRacing' for sure)
    - Name can be any.
    - URL must be 'http://127.0.0.1:8182/WeatherApp/'

Now you can open overlay in edit new box.

--------
Author: Rovlgut