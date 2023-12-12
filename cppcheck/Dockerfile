FROM obs-gcc-base

RUN mkdir cppcheck_dir

# TODO tutaj zmieniać
RUN cppcheck . \
--enable=all \
--project=build/compile_commands.json \
--cppcheck-build-dir=cppcheck_dir \
--xml \
-i deps \
2> cppcheck_dir/cppcheck_error.xml \
| tee logs/cppcheck.log

RUN cppcheck-htmlreport \
--file cppcheck_dir/cppcheck_error.xml \
--report-dir=cppcheck_report \
--source-dir=.
