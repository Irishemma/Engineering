#include<iostream>
#include<vector>
using namespace std;
void findRowOfMost1 (vector< vector<int> > v) {
	int p = v[0].size();
	vector<int> maxRow;
	for (; p > 0 && v[0][p - 1] != 0; p--) {}
	if (p != v[0].size())
		maxRow.push_back (0);
	for (int i = 1; i < v.size() ; i++) {
		if (v[i][p] == 0)
			continue;
		if (p == 0) {
			maxRow.push_back (i);
			continue;
		}
		if (v[i][p - 1] == 0) {
			maxRow.push_back (i);
			continue;
		}
		maxRow.swap (vector<int>());
		maxRow.push_back (i);
		for (; p > 0 && v[i][p - 1] != 0; p--) {}
	}
	for (int i = 0; i < maxRow.size() ; i++) {
		cout << '[' << maxRow[i] + 1 << ','
		     << v[0].size() - p << ']' << endl;
	}
}
int main() {
	vector< vector<int> > v1 = { { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 },
		{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1},
		{0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1},
		{0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1},
		{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1}

	};
	findRowOfMost1 (v1);
	return 0;
}
