module CommitsHelper

  def format_time(time)
    time.in_time_zone('Eastern Time (US & Canada)').strftime("%l:%M:%S").strip
  end
end
