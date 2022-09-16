//SPDX-License-Identifier:MIT

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

interface dummy{
    function transfer(address to, uint256 amount) external returns (bool) ;
    function balanceOf(address account) external view  returns (uint256);
}

contract my721Token is ERC721, Ownable {
    uint NFTsMinted = 0;
    uint mintedNFTs = 0;
    

    dummy public ERC20contractAddress;


    mapping(uint => address) public NFT_Owners;
    mapping(address => uint) public NFT;

    constructor() ERC721("Vaithi", "YT") {}

    function safeMint(address to, uint256 tokenId) external onlyOwner {
        require(NFT[to] < 1, "Not Allowed to access multiple NFT's");
        require(NFTsMinted < 5, "You have reached your limit");
        _safeMint(to, tokenId);
        NFTsMinted += 1;
        NFT[to] += 1;
        NFT_Owners[NFTsMinted] = to;
    }
    
    function withdrawTokens() public payable onlyOwner {
        require(NFTsMinted == 5, "Mint all the NFT's");
        for (uint i = 1; i <= NFTsMinted; i++) {
            dummy(ERC20contractAddress).transfer(NFT_Owners[i] , 10);
          
        }
    } 
    function ERC20inERC721() public view returns(uint256){
        return(dummy(ERC20contractAddress)).balanceOf(address(this));
       
    }

    function updateContractAddress(address contractAddress) public onlyOwner{
        ERC20contractAddress = dummy(contractAddress);
    }


    function balanceOfERC20(address NFTownerAddressses) public view returns (uint256){
        return (dummy(ERC20contractAddress).balanceOf(NFTownerAddressses));
    }

    
}

contract ERC20token is ERC20 {
    constructor() ERC20("Pytorch", "PT") {
        _mint(msg.sender, 1000);
    }

}
