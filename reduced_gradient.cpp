#include <iostream>
using namespace std;
void reduced_gradient();
int main()
{
  //reduced_gradient();
  float delta_hop = 0.001;
  float delta_t = 0.001;
  float decay_rate = 0.025;
    // return 0;
  cout << "jsd" << endl;
  float alpha = 1.0;
  float gamma = 0.4;
  int max_iter = 100;
  int max_outer_iter = 50;
  float eps = 0.001;
  double fx;
  double gx;
  double x = 0.001;
  double h = 0.001;
  float prime;
  double hop_conc = 32.5;


  prime = (fx*(x + h) - fx*(x - h))/(2 * h);
  cout << "What is fx?" << endl;
  cin >> fx;
  cout << "What is gx" << endl;
  cin >> gx;
  cout << "You've finished" << endl;


  return 0;
}
