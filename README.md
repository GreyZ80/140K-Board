# Exploration for Xerox 140K70271 control PCB

RANK XEROX 8M6 manufactured by FUJI XEROX\
82/499/EEC

Board name: 140K70271 TPB-S.V0

<img width="1000" alt="Board topview" src="https://github.com/user-attachments/assets/2d3c9ad9-d57c-4bf6-bfac-502e86ff09b9" />


## Status Feb. 2026

I copied the EPROM content to a .bin file. This file was run through a Z180 disassembler.\
In order to do some tracing I used a TRS-80 Model II emulator (https://48k.ca/trs80gp.html).\

First change was enable RAM starting at 8000H using a debug directive.

The disassembly has only started and is not complete.\
Parts cleaned are:
- Text Message area (texts are in Dutch)
- LCD character font area

  
The .txt file is the first part of the trace.

No work has been done on the 68HC11 processor (except for a dump of the EPROM).
