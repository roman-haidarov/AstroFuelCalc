# Установка
1. Клонировать репозиторий: git clone https://github.com/roman-haidarov/astro_fuel_calc.git
2. Перейти в директорию проекта: cd astro_fuel_calc
3. Установить зависимости: bundle install
# Запуск
Запустить приложение: bundle exec puma

# Использование
После запуска приложение будет доступно по адресу http://localhost:9292.

# Расчет топлива
Endpoint: /calculate_fuel

# Метод: POST

# Пример запроса:

json
Copy code
```
{
  "mass": 1000,
  "flight_route": [
		["launch", 9.807], 
		["land", 1.62],
		["launch", 1.62], 
		["land", 9.807]
	]
}
```
# Пример ответа:

json
Copy code
```
{
	"fuel_amount": 38222
}
```
# Параметры запроса
* mass (обязательный): масса объекта
* flight_route (обязательный): описание маршрута полета
# Параметры ответа
fuel_amount: количество топлива, рассчитанное для заданных параметров
# Тестирование
Запустить тесты: rspec spec/
# Зависимости
* Sinatra
* Puma
* Pry
* Rack-test