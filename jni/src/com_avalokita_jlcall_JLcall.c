/*
 * com_avalokita_jlcall_JLcall.c
 * Source for class com_avalokita_jlcall_JLcall
 */

#include <stdio.h>
#include <stdlib.h>
#include "com_avalokita_jlcall_JLcall.h"

JNIEXPORT void JNICALL Java_com_avalokita_jlcall_JLcall_hello
  (JNIEnv *env, jclass this_class)
{
	puts("Native object for JLcall says hello!");
	return;
}

JNIEXPORT jboolean JNICALL Java_com_avalokita_jlcall_JLcall_integerIsEven
  (JNIEnv * env, jclass this_class, jint integer)
{
	return (integer % 2 == 0);
}

/* https://www3.ntu.edu.sg/home/ehchua/programming/java/JavaNativeInterface.html */
JNIEXPORT jint JNICALL Java_com_avalokita_jlcall_JLcall_alterIntArray
  (JNIEnv *env, jclass this_class, jintArray j_int_array)
{
	/* Convert the incoming JNI jintarray to C's jint[] */
	jint *in_C_array = (*env)->GetIntArrayElements(env, j_int_array, NULL);
	if (in_C_array == NULL)
		return 1;
	jsize length = (*env)->GetArrayLength(env, j_int_array);
	
	/* Say something */
	for (jsize i = 0; i < length; ++i)
		printf("%d\t", in_C_array[i]);
	puts("");
	
	/* Release resources */
	(*env)->ReleaseIntArrayElements(env, j_int_array, in_C_array, 0);
	
	/* return success */
	return 0;
}



