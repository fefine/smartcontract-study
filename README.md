安装依赖
````
npm install @openzeppelin/contracts
npm install @truffle/hdwallet-provider
npm install -D truffle-plugin-verify
````

运行
````
truffle init
truffle compile
# 部署
truffle migrate --network rinkeby
# 上传contract info到etherscan
truffle run verify SampleOnlyOwner --network rinkeby
# 安装waffle
npm install --save-dev ethereum-waffle
# 安装flatten
npx waffle flatten
````

参考:
https://www.trufflesuite.com/tutorials/using-infura-custom-provider

https://github.com/rkalis/truffle-plugin-verify

https://ethereum-waffle.readthedocs.io/en/latest/getting-started.html

contract地址:
SampleOnlyOwner: 0x70924f71829A5e5A1311F875a1C3D9720CA677Bf