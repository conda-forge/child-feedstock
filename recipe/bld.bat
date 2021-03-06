setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir src/build
cd src/build

:: Configure using the CMakeFiles
cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      %SRC_DIR%/src
if errorlevel 1 exit 1

:: Build!
nmake
if errorlevel 1 exit 1

:: Install!
nmake install
if errorlevel 1 exit 1

