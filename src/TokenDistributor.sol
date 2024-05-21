// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.19;

import "@openzeppelin/token/ERC20/ERC20.sol";
import "@openzeppelin/access/Ownable.sol";
import "@openzeppelin/utils/Address.sol";

contract TokenDistributor is Ownable {
    ERC20 public immutable TOKEN_TO_DISTRIBUTE;
    uint256 public immutable ETH_WEI_PER_TOKEN_WEI;

    error NotEnoughTokensInDistributor();

    constructor(ERC20 tokenToDistribute_, uint256 ethWeiPerTokenWei_) Ownable() {
        TOKEN_TO_DISTRIBUTE = tokenToDistribute_;
        ETH_WEI_PER_TOKEN_WEI = ethWeiPerTokenWei_;
    }

    receive() external payable {
        Address.sendValue(payable(owner()), msg.value);

        uint256 tokenAmtToSend = msg.value / ETH_WEI_PER_TOKEN_WEI;
        if (TOKEN_TO_DISTRIBUTE.balanceOf(address(this)) < tokenAmtToSend) revert NotEnoughTokensInDistributor();

        TOKEN_TO_DISTRIBUTE.transfer(tx.origin, tokenAmtToSend);
    }
}
