// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

interface ITokenSwap {
    function swapEthToDai(uint _amount) external;
    function swapDaiToEth(uint _amount) external;
    function swapLinkToEth(uint _amount) external;
    function swapEthToLink(uint _amount) external;
    function swapLinkToDai(uint _amount) external;
    function swapDaiToLink(uint _amount) external;
    function getDerivedPrice(address _base, address _quote, uint8 _decimals) external view returns (int256);
    function scalePrice(int256 _price, uint8 _priceDecimals, uint8 _decimals) external pure returns (int256);
}