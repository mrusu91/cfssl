FROM alpine

RUN apk add --update ca-certificates openssl && update-ca-certificates

ENV VERSION R1.2
ENV ARCH linux-amd64

RUN wget https://pkg.cfssl.org/$VERSION/cfssl-bundle_$ARCH -O /bin/cfssl-bundle && chmod +x /bin/cfssl-bundle \
  && wget https://pkg.cfssl.org/$VERSION/cfssl-certinfo_$ARCH -O /bin/cfssl-certinfo && chmod +x /bin/cfssl-certinfo \
  && wget https://pkg.cfssl.org/$VERSION/cfssl-newkey_$ARCH -O /bin/cfssl-newkey && chmod +x /bin/cfssl-newkey \
  && wget https://pkg.cfssl.org/$VERSION/cfssl-scan_$ARCH -O /bin/cfssl-scan && chmod +x /bin/cfssl-scan \
  && wget https://pkg.cfssl.org/$VERSION/cfssl_$ARCH -O /bin/cfssl && chmod +x /bin/cfssl \
  && wget https://pkg.cfssl.org/$VERSION/cfssljson_$ARCH -O /bin/cfssljson && chmod +x /bin/cfssljson \
  && wget https://pkg.cfssl.org/$VERSION/mkbundle_$ARCH -O /bin/mkbundle && chmod +x /bin/mkbundle \
  && wget https://pkg.cfssl.org/$VERSION/multirootca_$ARCH -O /bin/multirootca && chmod +x /bin/multirootca

VOLUME /etc/cfssl
WORKDIR /etc/cfssl
EXPOSE 8888
ENTRYPOINT ["/bin/cfssl"]
CMD ["--help"]
