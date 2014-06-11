require "active_support/all"

class YouCal
  attr_reader :birthday

  def initialize(birthday)
    @birthday = to_date(birthday)
    @dates = {}
    @age_years = 0
    @age_days = 1
    @next_year = @birthday + 1.year
  end

  def today
    date(Date.today)
  end

  def date(date)
    date = to_date(date)
    day = @dates.keys.last
    if !day or date > day
      day ||= birthday
      while day <= date
        @dates[day] = "%02d-%03d" % [@age_years, @age_days]
        day += 1.day
        if day == @next_year
          @next_year += 1.year
          @age_years += 1
          @age_days = 1
        else
          @age_days += 1
        end
      end
    end
    @dates[date]
  end

  def dates
    today
    @dates
  end

  protected

  def to_date(value)
    if value.is_a?(String)
      Date.parse(value)
    else
      value.to_date
    end
  end

end

you_cal = YouCal.new(ARGV[0])
you_cal.dates.each do |date, label|
  puts "#{date.strftime("%Y-%m-%d")} : #{label}"
end
