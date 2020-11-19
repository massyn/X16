::@echo off
:: A simple build script to assemble a provided file in the asm folder, and run it in Commander X16

:: Path to the VASM binary

SET VASM=c:\X16\vasm6502_oldstyle
SET X16=c:\x16\x16emu.exe
:: provide the filename (without .asm) that resides in the asm folder
set FILE=%1


%VASM%\win\win10\vasm6502_oldstyle.exe asm\%1.asm -c02 -dotdir -Fbin -o prg\%1.prg

:: Run this to emulate the entire ROM
::%X16% -rom prg\%1.prg

:: Run this to just run a basic assmbled program
%X16% -prg prg\%1.prg