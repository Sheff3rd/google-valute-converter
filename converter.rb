require 'net/http'

class Converter
  class Currency
    attr_accessor :value, :course, :currency

    def initialize(currency, amout)
      @value = (currency.to_f * amout).round(2)
      @course = currency.to_f
      @currency = /[a-zA-Z]+/.match(currency)[0]
    end
  end

  def initialize(from, to, amout = 1)
    @from = from
    @to = to
    @amout = amout
  end

  def convert
    span = /<span class=bld>(.*)<\/span>/.match(response).captures[0]
    Currency.new(span, @amout)
  end

  private

  def response
    Net::HTTP.get(uri)
      .encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
  end

  def url
    "https://finance.google.com/finance/converter?a=1&from=#{@from}&to=#{@to}"
  end

  def uri
    URI(url)
  end
end
