// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {ERC1155Burnable} from "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
error NO_TRANSFER_ALLOWED();

interface Faucet {
    function getTokenId() external view returns (uint);
}

contract BlockfuseLabsNFT is ERC1155, Ownable, ERC1155Burnable {
    address faucetAddress;

    constructor(address initialOwner) ERC1155("") Ownable(initialOwner) {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function setFaucetAddress(address new_address) external onlyOwner {
        require(new_address != address(0), "INVALID_ADDRESS");
        faucetAddress = new_address;
    }

    function mint(address account, uint256 amount, bytes memory data) public {
        Faucet faucet = Faucet(faucetAddress);
        uint tokenId = faucet.getTokenId();
        require(balanceOf(msg.sender, tokenId) == 0, "ALREADY_MINTED");
        _mint(account, tokenId, amount, data);
    }

    function mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) public onlyOwner {
        _mintBatch(to, ids, amounts, data);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 value,
        bytes memory data
    ) public pure override {
        revert NO_TRANSFER_ALLOWED();
    }

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    ) public pure override {
        revert NO_TRANSFER_ALLOWED();
    }
}
