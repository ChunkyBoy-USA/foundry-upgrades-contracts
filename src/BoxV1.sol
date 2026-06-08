// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { UUPSUpgradeable } from "lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import { Initializable } from "lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import { OwnableUpgradeable } from "lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

// storage is stored in the proxy, NOT the implementation

// Proxy (borrowing funcs) -> implementation (number = 1)

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender); // sets owner to: owner = msg.sender
        // __UUPSUpgradeable_init(); // Deprecated since OpenZeppelin 5.x.x
    }

    function getNumber() external view returns(uint256) {
        return number;
    }

    function version() external pure returns(uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {

    }


}
