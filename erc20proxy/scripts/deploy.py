from brownie import accounts, Token

if __name__ == '__main__':
    acc = accounts[0]
    print(acc.address)
    resp = acc.deploy(Token)
    print(resp)