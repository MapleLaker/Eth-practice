# Eth-practice
1. Coin.
说明： 在某帐号的状态下，去操作以DAPP。 DAPP在创建时刻，会记录下账户地址。对于某些高级别权限，DAPP会首先比对是否为“创建者帐号”-该帐号具有最高权限。
“address”-"UNIT"的MAP，用来记录各个帐号的数据余额。
mint()是央行，负责发行货币。将货币直接付给各个账户。
send()，各个账户，各自花各自的钱。

2. inherit-coin
说明：增加#身份权限管理#Module.需要该功能的module 只要集成该Module就可以。sol 以太坊编程模型中，主要使用#账户#， 去做权限的验证。
在子类中，曾加#onlyOwner#关键字即可。

3. MINIMUM VIABLE TOKEN
说明：一个最基本,可以运行的Token
