#include <stdio.h>
#include <conio.h>

void ordena  (int *, int);
void muestra (int *);

void main (void)
{
int i, vec[10]={7,9,2,10,6,5,1,3,8,4};
ordena(&vec[0],10);
muestra(&vec[0]);
}

void ordena (int *vec, int c)
{
int cambio, pasada=0, aux, i;
do
{
cambio=0;
pasada++;
for (i=0; i<c-pasada; i++)
    {
    if(*(vec+i)>*(vec+i+1))
      {
      aux=*(vec+i);
      *(vec+i)=*(vec+i+1);
      *(vec+i+1)=aux;
      cambio=1;
      }
    }
}
while (cambio !=0);
}

void muestra (int *vec)
{
int i;
clrscr();
printf("Muestro el vector\n");
for(i=0; i<10; i++)
   {
   printf("Posicion: %d, valor: %d\n", i+1, *(vec+i));
   }
getch();
}