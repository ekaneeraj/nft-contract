// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @title A Basic NFT Contract
 * @author Neeraj Singh
 * @notice This contract is for minting a basic ERC721 NFT
 *  @dev Implements Openzeppelin ERC721
 */

contract BasicNFT is ERC721 {
    /* State variables */
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    /* Functions */
    constructor() ERC721("Basic NFT", "BNT") {
        s_tokenCounter = 0;
    }

    function mintNFT(string calldata _tokenURI) public {
        s_tokenIdToUri[s_tokenCounter] = _tokenURI;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[_tokenId];
    }
}
