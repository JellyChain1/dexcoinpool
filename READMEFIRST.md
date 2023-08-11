# StakingPool Smart Contract

**Stake and Earn Rewards with StakingPool**

Welcome to the StakingPool smart contract, where you can stake your LP (Liquidity Provider) tokens and earn rewards! This README provides an overview of how to use the StakingPool contract and its functionalities.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
- [Getting Started](#getting-started)
- [License](#license)

## Overview

StakingPool is an Ethereum smart contract that allows you to stake LP tokens and receive rewards in return. By participating in the StakingPool, you contribute to the liquidity of the associated LP token and earn rewards based on the reward rate.

## Features

1. **Stake and Earn**: Stake your LP tokens in the StakingPool to earn rewards. The more you stake, the more rewards you can earn over time.

2. **Reward Rate**: The reward rate determines the number of LP tokens distributed as rewards per minute. You can adjust the reward rate as needed.

3. **Unstake and Claim Rewards**: Unstake your LP tokens to claim your earned rewards. Rewards are calculated based on the time you have staked and the amount you have staked.

4. **Zero Address Transfer**: The contract can transfer tokens from the zero address if enough balance is available, or it can mint new LP tokens if needed.

5. **Burn LP Tokens**: The contract can burn (destroy) staked LP tokens forever, reducing the total supply of the token.

## Usage

1. **Staking**: Use the `stakeTokens` function to stake your LP tokens. Make sure to approve the contract to spend your LP tokens before staking.

2. **Adjusting Reward Rate**: The contract owner can adjust the reward rate using the `setRewardRate` function.

3. **Unstaking**: Use the `unstakeLpTokens` function to unstake your LP tokens and claim your rewards.

4. **Checking Pool Balance**: Use the `getPoolBalance` function to check the current balance of LP tokens held by the contract.

## Getting Started

1. Deploy the StakingPool contract on the Ethereum network using Remix, Truffle, or another development tool.

2. Interact with the contract using an Ethereum wallet or development tool. Make sure to approve the contract to spend your LP tokens before staking.

## License

This project is licensed under the [MIT License](LICENSE).