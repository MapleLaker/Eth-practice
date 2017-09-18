
contract owned {
//记录了creator的账户
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}

contract Coin is owned{
//关键字“public”使变量能从合约外部访问。
    address public minter;
    mapping (address => uint) public balances;

//事件让轻客户端能高效的对变化做出反应。
    event Sent(address from, address to, uint amount);

//这个构造函数的代码仅仅只在合约创建的时候被运行。
    function Coin() {
        owner = msg.sender;
    }
    
    //直接替换代码
    function mint(address receiver, uint amount) onlyOwner{
        //if (msg.sender != owner) return;
        balances[receiver] += amount;
    }
    
    function send(address receiver, uint amount) {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        
        //事件通知
        Sent(msg.sender, receiver, amount);
    }
}
