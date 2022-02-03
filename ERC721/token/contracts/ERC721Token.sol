pragma solidity ^0.5.16;

import './ERC721.sol';
import './SafeMath.sol';

contract ERC721Token is ERC721{

    using SafeMath for uint256;

    mapping(uint256 => address) private tokenOwner;

    mapping(address => uint256[]) private ownedTokens;

    function _mint(address _to, uint256 _tokenId) public{
        require( _to != address(0));
        require(tokenOwner[_tokenId] == address(0));


        tokenOwner[_tokenId]= _to;

        ownedTokens[_to].push(_tokenId);
        emit Transfer(address(0),_to,_tokenId);

    }

    function ownerOf(uint256 _tokenId) public view returns(address){

        address owner = tokenOwner[_tokenId];

        require(owner != address(0));

        return owner;

    }

    function balanceOf(address _owner) public view returns(uint256){

        return ownedTokens[_owner].length;

    }

    function tokensOf(address _owner) public view returns(uint256[] memory){
 
        return ownedTokens[_owner];

    }

    


}