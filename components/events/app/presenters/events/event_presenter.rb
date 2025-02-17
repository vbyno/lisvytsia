module Events
  class EventPresenter < Core::BasePresenter
    presents :event

    def start_time
      str_time(super)
    end

    def end_time
      str_time(super)
    end

    def dates
      Calendars::DateFormatter.to_period(event.start_time, event.end_time)
    end

    def info_blocks
      event.info_blocks || []
    end

    private

    def str_time(time)
      time.strftime('%Y-%m-%d')
    end
  end
end
