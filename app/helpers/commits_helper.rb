module CommitsHelper

  def format_time(time)
    time.localtime.strftime("%l:%M:%S").strip
  end
end
