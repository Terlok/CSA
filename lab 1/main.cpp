#include <iostream>
using namespace std;

int a, b, num;
void task_4();

void task_1(){
    cout<<"---Task 1--- \nEnter numbers A&B:\n";
    cin>>a>>b;
    cout<<"a - b = "<<a-b<<"\na * b = "<<a*b<<"\n";
}
void task_2(){
    cout<<"\n---Task 2--- \nEnter a number:\n";
    cin>>a;
    if (a % 2 == 0){
        cout<<"This number is even\n"; } else { cout<<"This number is odd\n"; }
}
void task_3(){
    cout<<"\n---Task 3--- \nEnter the task number\n";
    cin>>num;
    switch (num) {
        case 1:
            task_1();
            break;
        case 2:
            task_2();
            break;
        case 3:
            task_4();
            break;
    }
}
void task_4(){
    cout<<"\n---Task 4--- \nGlobal variables A,B and num have the following values:\n";
    cout<<"A: "<<a<<"\nB: "<<b<<"\nnum: "<<num<<"\n";
}
void task_5(){
    int c;
    cout<<"\n ---Task 5--- \nEnter a number:\n";
    cin>>c;
    for(int i=1; i<c+1; i++){
        cout<<i;
    }
    cout<<endl;
}
void task_7(){
    cout<<"\n---Task 7---\n";
    int arr[5] = {34,56,32,12};
    cout<< arr[3];
}


int main() {    
    task_1();
    task_2();
    task_3();
    task_4();
    task_5();
    task_7();
    return 0;
}




// g++ -O3 -o output_program main.cpp