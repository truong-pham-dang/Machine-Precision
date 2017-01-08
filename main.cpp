#include <iostream>

using namespace std;

extern"C" {
	void TESTF( double *eps );
}

int main()
{
	double *eps;
	double temp = 10.0;
	eps = &temp;
	TESTF( eps );
	
	std::cout<< "Machine precision = " << eps << std::endl;
	return 0;
}