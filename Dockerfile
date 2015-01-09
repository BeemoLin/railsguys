FROM rails:onbuild

COPY . /usr/src/app
RUN bundle install

ENV RAILS_ENV production
EXPOSE 3000

CMD ["rails", "server"]
