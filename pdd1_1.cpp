#include<iostream>
#include<vector>
using namespace std;
void findRowOfMost1 (vector< vector<int> > v) {
    int p = v[0].size();
    for (; p > 0 && v[0][p - 1] != 0; p--) {}
    for (int i = 1; i < v.size(); i++) {
        if (v[i][p] == 0)        //这行1比较少
            continue;
        if (p == 0)             //这行向左到头
            break;
        if (v[i][p - 1] == 0)         //这行1一样多
            continue;
        for (; p > 0 && v[i][p - 1] != 0; p--) {}
    }        //得到最多的1的数量，n-p
    for (int i = 0; i < v.size(); i++) {
        if (v[i][p] == 1)
            cout << '[' << i + 1 << ','
                 << v[0].size() - p << ']' << endl;
    }
}
int main() {
    vector< vector<int> > v1 = { { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 },
        { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1 },
        { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 },
        { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 },
        { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1 }

    };
    findRowOfMost1 (v1);
    return 0;
}
