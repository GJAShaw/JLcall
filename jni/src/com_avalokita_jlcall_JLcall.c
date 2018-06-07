/*
 * com_avalokita_jlcall_JLcall.c
 * Source for class com_avalokita_jlcall_JLcall
 */

#include <stdio.h>
#include "com_avalokita_jlcall_JLcall.h"

JNIEXPORT void JNICALL Java_com_avalokita_jlcall_JLcall_hello
  (JNIEnv *env, jclass thisClass)
{
	puts("Native object for JLcall says hello!");
	return;
}

