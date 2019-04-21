FROM phusion/passenger-ruby25:1.0.5

ENV HOME /root

CMD ["/sbin/my_init"]

# phusion/passenger run Ubuntu...
RUN apt-get update && apt-get install -y -o Dpkg::Options::="--force-confold" netcat
RUN apt-get install -y -o Dpkg::Options::="--force-confold" tzdata

# Enable nginx with passenger
RUN rm -f /etc/service/nginx/down

RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

ADD Gemfile Gemfile.lock /tmp/
RUN bundle config --global silence_root_warning 1
WORKDIR /tmp
RUN bundle install

COPY . /home/brakk/labs/learning-rails
RUN usermod -u 1000 app
RUN chown -R app:app /home/brakk/labs/learning-rails
WORKDIR /home/brakk/labs/learning-rails

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
