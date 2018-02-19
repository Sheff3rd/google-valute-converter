# google-valute-converter

Converter requies valute to convert from and valute to convert

```ruby
Converter.new("USD", "UAH").convert #=> <Converter::Currency:0x000055eb86dcde40 @value=27.17, @course=27.17, @currency="UAH">
Converter.new("UAH", "USD", 28).convert #=> <Converter::Currency:0x000056481930a900 @value=1.03, @course=0.0368, @currency="USD">
```
