FROM obs-base

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100

# TODO tutaj zmieniać
RUN echo "add_compile_options(-fsanitize=address -fno-omit-frame-pointer)" >> cmake/Modules/CompilerConfig.cmake
RUN echo "add_link_options(-fsanitize=address)" >> cmake/Modules/CompilerConfig.cmake

RUN cmake \
-E env CMAKE_EXPORT_COMPILE_COMMANDS=ON \
CMAKE_C_COMPILER_ID="Clang" \
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
