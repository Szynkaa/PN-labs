docker build -t obs-base ./base

docker build -t obs-gcc-base ./gcc-base # depends on obs-base

docker build -t obs-clang-tidy ./clang-tidy # depends on obs-base

docker build -t obs-coverage ./coverage # depends on obs-base

docker build -t obs-cppcheck ./cppcheck # depends on obs-gcc-base

docker build -t obs-sanitizers ./sanitizers # depends on obs-base
