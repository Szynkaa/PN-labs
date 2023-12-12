FROM ubuntu

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y git
RUN apt-get install -y vim

# obs deps
RUN apt-get install -y cmake ninja-build pkg-config clang clang-format build-essential curl ccache git zsh
RUN apt-get install -y libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libswresample-dev libswscale-dev libx264-dev libcurl4-openssl-dev libmbedtls-dev libgl1-mesa-dev libjansson-dev libluajit-5.1-dev python3-dev libx11-dev libxcb-randr0-dev libxcb-shm0-dev libxcb-xinerama0-dev libxcb-composite0-dev libxcomposite-dev libxinerama-dev libxcb1-dev libx11-xcb-dev libxcb-xfixes0-dev swig libcmocka-dev libxss-dev libglvnd-dev libgles2-mesa libgles2-mesa-dev libwayland-dev libsrt-openssl-dev libpci-dev libpipewire-0.3-dev libqrcodegencpp-dev
RUN apt-get install -y qt6-base-dev qt6-base-private-dev libqt6svg6-dev qt6-wayland qt6-image-formats-plugins
RUN apt-get install -y libasound2-dev libfdk-aac-dev libfontconfig-dev libfreetype6-dev libjack-jackd2-dev libpulse-dev libsndio-dev libspeexdsp-dev libudev-dev libv4l-dev libva-dev libvlc-dev libvpl-dev libdrm-dev nlohmann-json3-dev libwebsocketpp-dev libasio-dev
RUN apt-get install -y libvpl2

# perf
RUN apt-get install -y linux-tools-generic
RUN cd /usr/bin && find /usr/lib/ -name perf -exec ln -fs {} \;
RUN sysctl -w kernel.perf_event_paranoid=0

# tools
RUN apt-get install -y lcov
RUN apt-get install -y cppcheck
RUN apt-get install -y clang-tidy
RUN apt-get install -y valgrind

# clone obs
RUN git clone --recursive https://github.com/obsproject/obs-studio.git /obs-studio
WORKDIR /obs-studio

RUN mkdir logs

CMD ["/bin/bash"]
