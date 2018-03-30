#include <iostream>
#include <string>
#include <stack>
using namespace std;
bool isExpression (string& str) {
	int len = str.size();
	stack< char > s;
	int bracketLevel = 0;			//4.记录括号等级，避免{} 和 []
	for (int i = 0; i < len; i++) {
		char c = str[i];
		switch (c) {
			case '{': {
				if (s.empty() || (!s.empty()) && s.top() == '{') {	//5.大括号可以连续嵌套
					s.push (str[i]);
					bracketLevel = 2;
				} else return false;
			}
			break;
			case '[': {
				if (s.empty() || (!s.empty()) && s.top() == '{') {	//3.括号嵌套优先级
					s.push (str[i]);
					bracketLevel = 1;
				} else return false;
			}
			break;
			case '(': {
				if (s.empty() || (!s.empty()) && (s.top() == '[')) {
					s.push (str[i]);
					bracketLevel = 0;
				} else return false;
			}
			break;
			case '}': {
				if (s.empty() || bracketLevel) return false;
				if (s.top() == '{') 							//2.左右括号匹配
					s.pop();
				else return false;
			}
			break;
			case ']': {
				if (s.empty() || bracketLevel) return false;
				if (s.top() == '[')
					s.pop();
				else return false;
			}
			break;
			case ')': {
				if (s.empty() || bracketLevel) return false;
				if (s.top() == '(')
					s.pop();
				else return false;
			}
			break;
			default:
				;
		}
	}
	return (s.empty()) ? true : false;		//1.s不空说明右边符号不够用
}

int main() {
	char cs[100000];
	gets_s (cs);
	string str (cs);
	bool legal = isExpression (str);
	cout << legal;
	return 0;
}
