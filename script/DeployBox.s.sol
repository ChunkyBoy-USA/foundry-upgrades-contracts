// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { Script } from "lib/forge-std/src/Script.sol";
import { BoxV1 } from "src/BoxV1.sol";
import { ERC1967Proxy } from "lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";


contract DeployBox is Script {
    function run() external returns(address) {
        return deployBox();
    }

    function deployBox() public returns(address) {
        vm.startBroadcast();
        BoxV1 box = new BoxV1(); // implementation (Logic)
        ERC1967Proxy proxy = new ERC1967Proxy(address(box), abi.encodeWithSelector(BoxV1.initialize.selector));
        vm.stopBroadcast();
        return address(proxy);
    }
}