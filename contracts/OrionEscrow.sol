// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OrionEscrow
/// @notice Three-party escrow.
/// @custom:kind escrow
contract OrionEscrow {
    address public immutable payer;
    address public immutable payee;
    address public immutable arbiter;
    bool public settled;

    event Funded(address indexed account, uint256 amount);
    event Released(address indexed account, uint256 amount);
    event Refunded(address indexed account, uint256 amount);

    constructor(address _payee, address _arbiter) payable {
        require(_payee != address(0) && _arbiter != address(0), "zero address");
        payer = msg.sender;
        payee = _payee;
        arbiter = _arbiter;
        emit Funded(msg.sender, msg.value);
    }

    function release() external {
        require(msg.sender == payer || msg.sender == arbiter, "unauthorized");
        require(!settled, "already settled");
        settled = true;
        uint256 amount = address(this).balance;
        (bool ok, ) = payee.call{value: amount}("");
        require(ok, "transfer failed");
        emit Released(payee, amount);
    }

    function refund() external {
        require(msg.sender == payee || msg.sender == arbiter, "unauthorized");
        require(!settled, "already settled");
        settled = true;
        uint256 amount = address(this).balance;
        (bool ok, ) = payer.call{value: amount}("");
        require(ok, "transfer failed");
        emit Refunded(payer, amount);
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }
}
