@echo off
echo "Cargo Build"
cargo build
echo "Copy dll to lib folder"
copy "C:\Users\TFI3080\ResilioSync\Dev2021\Projects\ld49-unstable\ld49-unstable\target\debug\ld49_unstable.dll" "C:\Users\TFI3080\ResilioSync\Dev2021\Projects\ld49-unstable\ld49-unstable\lib\x86_64-pc-windows-msvc"
