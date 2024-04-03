# Smart Contract Project in Solidity


## Install

1. Install [Truffle](https://github.com/trufflesuite/truffle)

   ```bash
   npm install -g truffle
   ```

## Initialize

1. Initialize Truffle in project folder

   ```bash
   truffle init
   ```

   After initialization, you will find two folders called `contracts` and `migrations`. Contracts go in the `contracts` folder while contract deployment settings go in `migrations`.

2. The "SmartContractProject" contract

   This is the "Smart Contract Project" contract in Solidity. 
   "SmartContractProject.sol" in `contracts` contains the following code:

   ```solidity
   // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.17;

    contract SmartContractProject {
    // Function that uses require statement
    function withdraw(uint256 _amount) public payable {
        require(_amount <= address(this).balance, "Insufficient balance");
        payable(msg.sender).transfer(_amount);
    }

    // Function that uses assert statement
    function assertExample(uint256 _value, uint256 _minValue) public pure returns (uint256) {
        uint256 result = _value + _minValue;
        assert(result >= _value);
        return result;
    }

    // Function that uses revert statement
    function revertExample(uint256 _input) public pure returns (uint256) {
        require(_input != 0, "Input should not be zero");
        return _input * 2;
    }
   }
 
   ```

3. Prepare the migration

   "2_deploy_migration.js" in `migrations` contains the following code:

   ```javascript
   var SmartContractProject = artifacts.require("SmartContractProject");
   module.exports = function(deployer) {
   deployer.deploy(SmartContractProject);
   }
   ```

4. Start Truffle console in development mode

   ```bash
   truffle develop
   ```

   In the Truffle console, execute

   ```bash
   compile
   migrate
   ```
   If you want to remigrate existing contracts, run `migrate --reset` instead of simply `migrate`.

5. Test your contract

   In the interactive Truffle console, run the following commands:

   ```javascript
   let instance = await SmartContractProject.deployed()
   instance.withdraw()
   instance.assertExample()
   instance.revertExample()
   ```
