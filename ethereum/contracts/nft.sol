// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-solidity/contracts/utils/Counters.sol";

contract NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("NFT", "nft") {}

    function _baseURI() internal pure override returns (string memory) {
        //ngrok address generated from ngrok after installing that and running the commands "ngrok authtoken "tokenAddressFromNgrok"" and "ngrok http 3000"
        return "https://00f2-125-209-125-202.ngrok.io/api/erc721/[id].js";
    }

    function mint(address to)
        public returns (uint256)
    {
        require(_tokenIdCounter.current() < 3); 
        _tokenIdCounter.increment();
        _safeMint(to, _tokenIdCounter.current());

        return _tokenIdCounter.current();
    }
}