// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title PixelRegistry
/// @notice Label to owner registry.
/// @custom:kind registry
contract PixelRegistry {
    mapping(bytes32 => address) public ownerOf;

    event Registered(bytes32 indexed key, address indexed account);
    event Transferred(bytes32 indexed key, address indexed from, address indexed to);

    function register(string calldata label) external {
        bytes32 key = keccak256(bytes(label));
        require(ownerOf[key] == address(0), "already registered");
        ownerOf[key] = msg.sender;
        emit Registered(key, msg.sender);
    }

    function transfer(string calldata label, address to) external {
        bytes32 key = keccak256(bytes(label));
        require(ownerOf[key] == msg.sender, "not owner");
        require(to != address(0), "zero address");
        ownerOf[key] = to;
        emit Transferred(key, msg.sender, to);
    }

    /// @notice Returns the contract version.
    function version() external pure returns (string memory) {
        return "1.0.0";
    }

    /// @notice Returns the ETH balance held by this contract.
    function selfBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
