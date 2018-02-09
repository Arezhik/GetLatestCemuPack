#!/bin/bash

PS3='What would you like to extract: '
options=("AllPacks" "BreathOfTheWild" "MarioKart8" "Tekken" "WindWakerHD" "AdventureTime" "AmiiboFestival"
	"AquaTV" "BatmanArkham" "Bayonetta" "Ben10Omniverse" "Brunswick" "CaptainToad" "ChimpuzzlePro" "ChompyChompChompParty"
	"CitizensOfEarth" "ColorSplash" "DevilsThird" "DuckTalesRemastered" "ElectronicSuperJoyGrooveCity" "FamilyTennisSP"
	"FASTRacingNEO" "FistoftheNorthStar" "FrenchyBird" "GhostBladeHD" "GhostlyAdventures" "Guacamelee" "HyruleWarriors"
	"InfinityRunner" "KamenRider" "KickandFennick" "KirbyRainbowCurse" "KungFuPanda" "LEGOCityUndercover" "MarioParty10"
	"MarioSonicRio" "MarioSonicSochi" "MarioTennis" "MinecraftStory" "MonsterHunter3Ultimate" "NBA2K13" "NewSuperMarioBrosU"
	"NinjaGaiden3RE" "NintendoLand" "NSMBU" "OnePiece" "PaperMonstersRecut" "XenobladeX")

select opt in "${options[@]}"; do
	case $opt in
	AllPacks)
		echo "Extracting $opt"
		break
		;;
	BreathOfTheWild)
		echo "Extracting BreathOfTheWild"
		break
		;;
	*) echo default
		;;
	esac

done
