// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function mint(address account, uint256 amount) external returns (bool);
}

contract StakingPool {
    IERC20 public lpToken;
    uint256 public rewardRate; // LP tokens per minute
    uint256 public lastRewardTime;
    mapping(address => uint256) public stakedBalances;

    constructor(address _lpTokenAddress, uint256 _rewardRate) {
        lpToken = IERC20(_lpTokenAddress);
        rewardRate = _rewardRate;
        lastRewardTime = block.timestamp;
    }

    function setRewardRate(uint256 _rewardRate) external {
        rewardRate = _rewardRate;
    }

    function stakeTokens(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        
        stakedBalances[msg.sender] += amount;
        
        lpToken.transferFrom(msg.sender, address(this), amount);
        
        _mintLpTokens(msg.sender, amount);
    }

    function unstakeLpTokens() external {
        uint256 stakedAmount = stakedBalances[msg.sender];
        require(stakedAmount > 0, "No staked balance");
        
        stakedBalances[msg.sender] = 0;
        
        uint256 rewards = _calculateRewards(stakedAmount);
        
        _burnLpTokens(stakedAmount);
        
        lpToken.transfer(msg.sender, rewards);
    }

    function _mintLpTokens(address account, uint256 amount) internal {
        uint256 zeroBalance = lpToken.balanceOf(address(0));
        if (zeroBalance >= amount) {
            // Transfer from the 0 address if enough balance
            require(lpToken.transferFrom(address(0), account, amount), "Transfer from 0 address failed");
        } else {
            // Otherwise, mint new LP tokens
            require(lpToken.mint(account, amount), "Mint failed");
        }
    }
    
    function _burnLpTokens(uint256 amount) internal {
        // Burn the staked amount (destroy it forever)
        // Implement the burning logic here
        // For example:
        require(lpToken.transfer(address(0), amount), "Burn failed");
    }

    function _calculateRewards(uint256 stakedAmount) internal view returns (uint256) {
        uint256 elapsedTime = block.timestamp - lastRewardTime;
        return rewardRate * elapsedTime * stakedAmount / 1 minutes;
    }

    function getPoolBalance() external view returns (uint256) {
        return lpToken.balanceOf(address(this));
    }
}
