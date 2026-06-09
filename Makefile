SHELL := /bin/bash
GAME_ID := 29670
RASCRIPT_CLI := ~/Installs/rascript-cli/v1.0.1/v1.17.0/rascript-cli_v1.17.0_linux-x64
EMU_DIR := ~/Installs/RALibretro

compile:
	rm -f ${EMU_DIR}/RACache/Data/${GAME_ID}.json
	rm -f ${EMU_DIR}/RACache/Data/${GAME_ID}-User.txt
	rm -f ${EMU_DIR}/RACache/Data/${GAME_ID}-Rich.txt
	touch ${EMU_DIR}/RACache/Data/${GAME_ID}.json
	${RASCRIPT_CLI} -i ${GAME_ID}.rascript -o ${EMU_DIR}