# notatki

## budowanie i uruchamianie obrazów

budowanie obrazu (trwa długo, zrobić wcześniej):

```bash
./build.sh
```

bazowa komenda uruchamiania dockera

```bash
docker run \
-it \
--rm \
--net=host \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=$DISPLAY \
--privileged \
<nazwa_obrazu>
```

obs jest w folderze `/obs-studio/build/rundir/RelWithDebInfo/bin/64bit`

uruchamiać będąc w tym folderze bo wyszukuje po relatywnych ścieżkach

## obrazy dla poszczególnych narzędzi

### cppcheck

Obraz: `obs-gcc-base`

uruchomić obraz i w osobnym terminalu

```bash
docker cp obs-gcc-base:/obs-studio .
```

### clang-tidy

Obraz: `obs-clang-tidy`

W folderze `logs` są logi z `clang-tidy`

### perf

Obraz: `obs-clang-tidy` lub `obs-gcc-base`

w WSL nie wszystkie eventy są dostępne, co najmniej te działają:

```bash
perf record \
-e branch-instructions,\
branch-misses,\
bus-cycles,\
cache-misses,\
cache-references,\
cpu-cycles,\
instructions \
<program>
```

### valgrind

Obraz: `obs-gcc-base`

### sanitizers

Obraz: `obs-sanitizers`

### coverage

Obraz: `obs-coverage`

uruchomić obs, bo zamknięciu uruchomić:

```bash
lcov \
--capture \
--directory build \
--no-external \
--output-file coverage/coverage.info

genhtml -o coverage coverage/coverage.info
```

w osobnym terminalu

```bash
docker cp obs-coverage:/obs-studio .
```

## przydatne linki

- <http://cppcheck.net>
- <https://clang.llvm.org/extra/clang-tidy/>
- <https://perf.wiki.kernel.org>
- <https://valgrind.org>
- <https://gcc.gnu.org/onlinedocs/gcc/Gcov.html>
- <https://github.com/linux-test-project/lcov>

## zadania

### 1

Zmień konfiguracje clang-tidy w Dockerfile (lub utwórz kolejny Dockerfile), dzięki, któremu wywołana zostaną wyłącznie checki powiązane z CppCoreGuidelines. Przejrzyj wyniki.

### 2

Uruchom narzędzie drd z valgrind z opcją `--log-file="filename"`. Przejrzyj wyniki.

Prawdopodobnie zatrzyma się na "Initializing OpenGl",

Docker ps, docker cp plik logów, docker kill

### 3

Zmień konfigurację sanitizerów na thread, zbuduj, uruchom. Porównaj z wynikami z zadania 2

### 4

Valgrind, ale cachegrind, krótka analiza wyników

### dodatkowe

Uruchom `perf stat` dla `wget https://wordpress.org/latest.zip`

W przypadku VM można spróbować bez ograniczeń na tylko niektóre eventy
