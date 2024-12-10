// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

import {BlockfuseLabsNFT} from "../src/BlockfuseLabsNFT.sol";

contract BlockfuseLabsNFTScript is Script {
    BlockfuseLabsNFT public nft;

    function setUp() public {}

    function run() public {
        uint pvKey = vm.envUint("PRIVATE_KEY");
        address owner = 0x845a4Dccd2D4cCD796BC7cDe1D82E858C5A2A950;
        vm.startBroadcast(pvKey);
        nft = new BlockfuseLabsNFT(owner);
        vm.stopBroadcast();
    }
}
