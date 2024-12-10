include .env

deploy:
	forge script --chain sepolia script/BlockfuseLabsNFT.s.sol:BlockfuseLabsNFTScript --rpc-url ${SEPOLIA_RPC_URL} --broadcast --verify --etherscan-api-key ${ETHERSCAN_API_KEY} -vvvv


