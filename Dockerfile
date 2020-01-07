FROM amd64/alpine

RUN apk add --no-cache \
	ca-certificates \
	# .NET Core dependencies - see https://github.com/dotnet/dotnet-docker/blob/master/3.0/runtime-deps/alpine3.10/amd64/Dockerfile
	krb5-libs \
	libgcc \
	libintl \
	libssl1.1 \
	libstdc++ \
	zlib

ENV ASPNETCORE_URLS=http://+:5000 \
	# Enable detection of running in a container
	DOTNET_RUNNING_IN_CONTAINER=true \
	# Set the invariant mode since icu_libs isn't included (see https://github.com/dotnet/announcements/issues/20)
	DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true

COPY bin/Release/PublishOutput/Linux/AsposeAlpineTest /app
COPY convert/ /convert

USER root

# Needed by Aspose - https://forum.aspose.com/t/aspose-cells-net-core-2-1-saving-workbook-as-pdf-fails-on-linux-box/179541 + https://stackoverflow.com/questions/53113157/create-custom-docker-alpine-image ?
RUN apk add libgdiplus --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add libc6-compat # Is this really needed?
RUN ln -s libgdiplus.so /app/gdiplus.dll
RUN apk add --no-cache msttcorefonts-installer fontconfig
RUN update-ms-fonts

WORKDIR /app

CMD ["./AsposeAlpineTest"]
