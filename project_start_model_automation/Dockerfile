FROM nbulai/ruby-chromedriver:latest

COPY . /smartcontract_automation

WORKDIR /smartcontract_automation

RUN rm -f Gemfile.lock && ls -la .

COPY Gemfile ./

RUN gem install bundler
RUN bundle install

ENTRYPOINT ["bundle", "exec", "cucumber -p $PROFILE -p report"]