// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {BlockfuseLabsNFT} from "../src/BlockfuseLabsNFT.sol";

contract BlockfuseLabsNFTTest is Test {
    BlockfuseLabsNFT public nft;

    function setUp() public {
        nft = new BlockfuseLabsNFT(msg.sender);
    }
}
