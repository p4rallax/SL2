#include<pthread.h>
#include<semaphore.h>
#include<stdlib.h>
#include<stdio.h>

int readcount;
sem_t sem_wsem;
sem_t sem_mutex;


void *reader()
{
	
   		printf("Reader is trying to enter \n\n");
		wait(&sem_mutex);
		readcount++;
		
		if(readcount==1)
		wait(&sem_wsem);
		printf("Reader is reading\n\n");
		signal(&sem_mutex);
		
		
		wait(&sem_mutex);
		sleep(1);
    	wait(&sem_mutex);
		readcount--;
		if(readcount==0);
		{
		signal(&sem_wsem);
		}
		signal(&sem_mutex);
		printf("Reader is leaving\n\n");
	
}
void *writer()
{
	
	
		printf("Writer is trying to enter\n\n");
		wait(&sem_wsem);
		printf("Writer is writing\n\n");
    	sleep(1);
		
		signal(&sem_wsem);
		printf("Writer is leaving\n\n");
	
}


int main()
{
	pthread_t th1,th2,th3,th4;
	
	
	sem_init(&sem_mutex,0,1);
	sem_init(&sem_wsem,0,1);
	pthread_create(&th1,NULL,reader,NULL);
	pthread_create(&th2,NULL,writer,NULL);
	pthread_create(&th3,NULL,reader,NULL);
	pthread_create(&th4,NULL,writer,NULL);
	pthread_join(th1,NULL);
	pthread_join(th2,NULL);
	pthread_join(th3,NULL);
	pthread_join(th4,NULL);
	
	

}

		
