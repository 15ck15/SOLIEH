// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title PhoenixAuction
/// @notice English auction with pull refunds.
/// @custom:kind auction
contract PhoenixAuction {
    address public seller;
    uint256 public endTime;
    address public highestBidder;
    uint256 public highestBid;
    bool public ended;
    mapping(address => uint256) public pendingReturns;

    event BidPlaced(address indexed bidder, uint256 amount);
    event AuctionEnded(address indexed winner, uint256 amount);

    constructor(uint256 duration) {
        seller = msg.sender;
        endTime = block.timestamp + duration;
    }

    function bid() external payable {
        require(block.timestamp < endTime, "auction over");
        require(msg.value > highestBid, "bid too low");
        if (highestBidder != address(0)) {
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit BidPlaced(msg.sender, msg.value);
    }

    function withdraw() external returns (bool) {
        uint256 amount = pendingReturns[msg.sender];
        require(amount > 0, "nothing to withdraw");
        pendingReturns[msg.sender] = 0;
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "transfer failed");
        return true;
    }

    function endAuction() external {
        require(block.timestamp >= endTime, "too early");
        require(!ended, "already ended");
        ended = true;
        (bool ok, ) = seller.call{value: highestBid}("");
        require(ok, "transfer failed");
        emit AuctionEnded(highestBidder, highestBid);
    }

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }

    /// @notice Returns the smaller of two values.
    function minOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a < b ? a : b;
    }

    /// @notice Returns the larger of two values.
    function maxOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a > b ? a : b;
    }

    /// @notice Returns the ETH balance held by this contract.
    function selfBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
