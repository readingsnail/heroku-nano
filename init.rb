require 'heroku/helpers'
require 'heroku/command'
require 'heroku/command/run'

class Heroku::Command::Nano < Heroku::Command::Run

  # nano
  # 
  # Run bash on heroku with nano
  #  
  def index
    run_attached(nano_cmd)
  end

  protected

  def nano_cmd
    <<-CMD
mkdir nano
curl https://github.com/readingsnail/heroku-nano/raw/main/heroku-nano/nano.tar.gz --location --silent | tar xz -C nano
export PATH=$PATH:/app/nano
bash
    CMD
  end

end