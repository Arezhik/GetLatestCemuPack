#!/bin/bash

githubURL="https://github.com"

function GetLatestAVUrl() {
	curl -s https://github.com/slashiee/cemu_graphic_packs/releases/latest | grep -Po 'http.?://[^"]+'
}

echo -e "\\n[Getting Latest AppVeyor Version URL]"
echo -e "Success: $(GetLatestAVUrl)"

function downloadEndUrlString() {
	curl -s "$(GetLatestAVUrl)" | grep -Pom 1 '\/slashiee\/.*.zip'
}

zipFileStringUrl=$(downloadEndUrlString)

downloadString=$"$githubURL$zipFileStringUrl"
zipFileName=$(echo $downloadString | grep -Po '([^\/]+$)')
echo "$zipFileName"
echo -e "\\n\\n[Getting Zip File Download Link]\\n"
echo -e "Success: $downloadString\\n\\n"
echo -e "[Downloading]"
wget -nc --show-progress "$downloadString"

# Make function to create a temp folder to extract files.
# Backup previous graphicsPack files.

function ExtractNewPacks() {
	unzip -- "$zipFileName" "$1*/*" -d graphicPacks |
		awk '{ print $2 }' |
		grep -Po '(?<=\/).*?(?=\/)' |
		uniq
	echo "DONE!"
}

function BackupCurrentPacks() {
	mkdir graphicPacks_BACKUP
	sleep 1;
	mv graphicPacks/"$1"* graphicPacks_BACKUP/
	echo "DONE!"
}

function AskUserForExtractionPreference() {
	PS3='What would you like to extract: '
	options=("AllPacks" "Bayonetta" "BreathOfTheWild" "HyruleWarriors" "MarioKart8" "TwilightPrincessHD" "WindWakerHD" "XenobladeX")
	# TODO ADD LATER "AquaTV" "BatmanArkham" "Ben10Omniverse" "Brunswick" "CaptainToad" "ChimpuzzlePro" "ChompyChompChompParty"
	# "CitizensOfEarth" "ColorSplash" "DevilsThird" "DuckTalesRemastered" "ElectronicSuperJoyGrooveCity" "FamilyTennisSP"
	# "FASTRacingNEO" "FistoftheNorthStar" "FrenchyBird" "GhostBladeHD" "GhostlyAdventures" "Guacamelee" "HyruleWarriors"
	# "InfinityRunner" "KamenRider" "KickandFennick" "KirbyRainbowCurse" "KungFuPanda" "LEGOCityUndercover" "MarioParty10"
	# "MarioSonicRio" "MarioSonicSochi" "MarioTennis" "MinecraftStory" "MonsterHunter3Ultimate" "NBA2K13" "NewSuperMarioBrosU"
	# "AdventureTime" "AmiiboFestival" "NinjaGaiden3RE" "NintendoLand" "NSMBU" "OnePiece" "PaperMonstersRecut"  )

	select opt in "${options[@]}"; do
		case $opt in
		AllPacks)
			echo "Extracting $opt"
			break
			;;
		BreathOfTheWild)
			echo -e "\\n\\n[Making Backup Of Old $opt Packs]"
			BackupCurrentPacks "$opt"
			echo -e "\n[Extracing New $opt Packs To graphicPacks/ Folder]"
			ExtractNewPacks "$opt"
			break
			;;
		MarioKart8)
			break
			;;

		WindWakerHD)
			break
			;;

		XenobladeX)
			break
			;;
		HyruleWarriors)
			break
			;;
		TwilightPrincessHD)
			break
			;;
		Bayonetta)
			break
			;;
		*) echo -e "\\n\\nNo choice given, try again?"
			;;
		esac

	done
}
AskUserForExtractionPreference
