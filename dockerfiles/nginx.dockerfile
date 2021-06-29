FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY ./nginx/nginx.conf ./default.conf
COPY ./nginx/nthung.vlvn.cf/ ./nthung.vlvn.cf/
COPY ./nginx/mksmart.nthung.vlvn.cf/ ./mksmart.nthung.vlvn.cf/
COPY ./nginx/electricity-bills.nthung.vlvn.cf/ ./electricity-bills.nthung.vlvn.cf/
COPY ./nginx/dx-phe-result.nthung.vlvn.cf/ ./dx-phe-result.nthung.vlvn.cf/
COPY ./nginx/pan-school.nthung.vlvn.cf/ ./pan-school.nthung.vlvn.cf/
COPY ./nginx/pan-image.nthung.vlvn.cf/ ./pan-image.nthung.vlvn.cf/
