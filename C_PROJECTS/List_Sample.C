#include <stdio.h>
#include <conio.h>
#include <alloc.h>
#include <process.h>
#define p printf
#define s scanf

typedef struct dato {
		    int precio;
		    char nombre[25];
		    };

typedef struct s_nodo {
		      dato d;
		      s_nodo *next;
		      }tnodo;

void place (tnodo*, tnodo**);
void show (tnodo*);

void main (void)
{
tnodo *nodo, *h=NULL;


do {
   clrscr();
   if (! (nodo = (tnodo*) malloc(sizeof(tnodo)) ) ) exit (1);
   p("Ingrese la descripcion del articulo\n");
   fflush(stdin);
   gets(nodo->d.nombre);
   p("Ingrese el precio\n");
   s("%d", &nodo->d.precio);
   if(nodo->d.precio>0)
     {
     place(nodo, &h);
     }
    else break;
    }
while (nodo->d.precio>0);
show(h);
}


void show (tnodo *h)
{
do {
p("\t\t%s\n", h->d.nombre);
p("\t\tPrecio: %d\n", h->d.precio);
h=h->next;
   }
while (h);
getch();
}


void place (tnodo* nodo, tnodo **h)
{
tnodo *anterior, *actual;
if(!h)
  {
  nodo->next=NULL;
  *h=nodo;
  }
else
  {
  anterior=*h;
  actual=*h;
  while (nodo->d.precio > actual->d.precio&&actual)
	{
	anterior=actual;
	actual=actual->next;
	}
  if (!actual)
     {
     anterior->next=nodo;
     nodo->next=NULL;
     }
  if(actual==anterior)
    {
    nodo->next=*h;
    *h=nodo;
    }
  else
     {
     anterior->next=nodo;
     nodo->next=actual;
     }
  }
}

   
 

