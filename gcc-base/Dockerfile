FROM obs-base

RUN cmake \
-E env CMAKE_EXPORT_COMPILE_COMMANDS=ON \
cmake \
-S . -B build -G Ninja \
-DCEF_ROOT_DIR="../obs-build-dependencies/cef_binary_5060_linux64" \
-DENABLE_PIPEWIRE=OFF \
-DENABLE_AJA=0 \
-DENABLE_WEBRTC=0 \
-DENABLE_BROWSER=OFF \
-DENABLE_NEW_MPEGTS_OUTPUT=OFF \
-DLINUX_PORTABLE=ON \
-DQT_VERSION=6

RUN cmake --build build -j | tee logs/build.log
