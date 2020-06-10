FROM cypress/browsers:chrome69

# ADD YOUR CORPORATE CERTIFICATE

WORKDIR /source

COPY ./package*.json ./.npmrc ./
RUN npm ci

COPY . /source

# adding corporate proxy
ARG PROXY="http://my-proxy.org:3128"
ARG NO_PROXY="my-internal-url.org,localhost"
ENV no_proxy="${NO_PROXY}" NO_PROXY="${NO_PROXY}"
ENV http_proxy="${PROXY}" https_proxy="${PROXY}" HTTP_PROXY="${PROXY}" HTTPS_PROXY="${PROXY}"

# adding corporate root ca certiciate
ENV NODE_EXTRA_CA_CERTS="/etc/ssl/certs/ca-bundle.crt"
ENV NODE_TLS_REJECT_UNAUTHORIZED=0
ENV DEBUG="cypress:*"

# test internal endpoint successfully
RUN curl -L my-internal-url.org

ENTRYPOINT []