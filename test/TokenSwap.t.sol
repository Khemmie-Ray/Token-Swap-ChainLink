// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

// import "forge-std/src/Test.sol";
import "../lib/forge-std/src/Test.sol";
import "../src/Interface/ITokenSwap.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract TokenSwapTest is Test {
    ITokenSwap tokenSwapContract;
    IERC20 DAI;
    IERC20 LINK;
    IERC20 ETH;

    address ETH_ADDRESS = address(0x7b79995e5f793A07Bc00c21412e50Ecae098E7f9);
    address DAI_ADDRESS = address(0x3e622317f8C93f7328350cF0B56d9eD4C620C5d6);
    address LINK_ADDRESS = address(0x779877A7B0D9E8603169DdbD7836e478b4624789);

     function setUp() public {
        DAI =  IERC20(0xe902aC65D282829C7a0c42CAe165D3eE33482b9f);
        LINK =  IERC20(0x779877A7B0D9E8603169DdbD7836e478b4624789);
        ETH =  IERC20(0x3e622317f8C93f7328350cF0B56d9eD4C620C5d6);
        tokenSwapContract = ITokenSwap(0xd2226f68D64daBcD18A49b66a6268055FE8dA14a);
    }

    // function prank(address) external virtual;

    // function testSwapEthToDai() public {
    //     vm.prank(DAI_ADDRESS);
    //     uint256 balance= DAI.balanceOf(DAI_ADDRESS);
    //     console.log(balance);
    // }

      function testSwapEthToDai() public {
        uint256 ethAmount = 1 ether; // Amount of ETH to swap
        ETH.approve(address(tokenSwapContract), ethAmount);
        uint256 initialDaiBalance = DAI.balanceOf(address(this));
        tokenSwapContract.swapEthToDai(ethAmount);
        uint256 finalDaiBalance = DAI.balanceOf(address(this));
        uint256 daiReceived = finalDaiBalance - initialDaiBalance;
        // Assert daiReceived or perform further checks
        assert(daiReceived > 0);
    }

}