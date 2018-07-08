#include "iostream"
#include "Windows.h"

bool isLeft = false;
bool isRight = false;

void main()
{
	while (true)
	{
		//Если F8 нажата меняет значение переменной isLeft на истину
		Sleep(3000);
		if (GetAsyncKeyState(VK_F8) != 0)
		{
			if (isLeft == false) {isLeft = true;}
			//else{isPressed = false;}
		};
		
		//Если F10 нажата меняет значение переменной isRight на истину
		if (GetAsyncKeyState(VK_F10))
		{
			if (isRight == false) {isRight = true;}
			//else {isCliked = false;}
		};
		
		//Если isLeft равно истине - зажимает ЛКМ
		while (isLeft != false)
		{
			mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0);
			//mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0);
			Sleep(10);
			if (GetAsyncKeyState(VK_F8)) {isLeft = false; mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0); break;}; //Если F8 нажата еще раз меняет значение переменной isLeft на ложь, и выходит из цыкла
		}
		//Если isRight равно истине - зажимает ПКМ
		while (isRight)
		{
			mouse_event(MOUSEEVENTF_RIGHTDOWN,0,0,0,0);
			Sleep(10);
			if (GetAsyncKeyState(VK_F10)) {isRight = false; mouse_event(MOUSEEVENTF_RIGHTUP,0,0,0,0); break;}; //Если F10 нажата еще раз меняет значение переменной isRight на ложь, и выходит из цыкла
		}
	}

}
