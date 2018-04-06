PImage img[] = new PImage[8];//arreglo de imagenes
int coorx[] = new int[8];//arreglo de coordenadas coorx[i]
int tam[] = new int[8];//tamaño de imagen
int enfrente[] = new int[3];//arreglo de indices de imagenes de enfrente

void setup()
{
  size(900,500,P3D);
  InicializarImages();
  InicializarValores();
}

void draw()
{
  // println(coorx[i],tam[i]);
  background(0);
  for(int i=0;i<8;i++)
  {
    if(coorx[i]<55)
    {
      coorx[i]=56;
      tam[i]=0;
    }
    if(coorx[i]>810)
    {
      coorx[i]=809;
      tam[i]=0;
    }
  }
  
  if(mouseX>width/2)//Movimiento Izquierda
  {
    for(int i=0;i<8;i++)
    {
        tint(80);
        if(tam[i]<0)
        {
          if(coorx[i]>160&&coorx[i]<740)
            Izquierda_Atras(i);
          if(coorx[i]<=160&&coorx[i]>=54)
            Izquierda_Izquierda(i);
          if(coorx[i]>=740&&coorx[i]<810)
            Izquierda_Derecha(i);
        }
        noTint();
    }
    //enfrente
    for(int i=0;i<8;i++)
    {
        if(tam[i]>=0)
        {
          if(coorx[i]<=160&&coorx[i]>=54)
            Izquierda_Izquierda(i);
          if(coorx[i]>=740&&coorx[i]<=810)
            Izquierda_Derecha(i);
          if(coorx[i]>160&&coorx[i]<740)
            Izquierda_Enfrente(i);
        }

    }
  }
  else
  {
    for(int i=0;i<8;i++)
    {
        tint(80);
        if(tam[i]<0)
        {
          if(coorx[i]>160&&coorx[i]<740)
            Derecha_Atras(i);
          if(coorx[i]<=160&&coorx[i]>=54)
            Derecha_Izquierda(i);
          if(coorx[i]>=740&&coorx[i]<=810)
            Derecha_Derecha(i);
        }
        noTint();
    }
    //enfrente
    for(int i=0;i<8;i++)
    {
        if(tam[i]>=0)
        {
          if(coorx[i]<=160&&coorx[i]>=54)
            Derecha_Izquierda(i);
          if(coorx[i]>=740&&coorx[i]<=810)
            Derecha_Derecha(i);
          if(coorx[i]>160&&coorx[i]<740)
            Derecha_Enfrente(i);
        }

    }
  }

  
}

/*    Izquierda    */

void Izquierda_Izquierda(int i)
{
    if(coorx[i]==160&&tam[i]>0)
      tam[i]=108;
      
      if(tam[i]>=0)
      {
        if(coorx[i]%4==0)
        {
         image(img[i],coorx[i]--,180,tam[i]--,200);
         tam[i]=tam[i]-3;
        }
        else
          image(img[i],coorx[i]--,180,tam[i],200);
      }
      else
      {
        if(coorx[i]%4==0)
        {
         tint(80);//azul
         image(img[i],coorx[i]++,170,tam[i]--,190);
         noTint();
         tam[i]=tam[i]-3;
        }
        else
        {
          tint(80);
          image(img[i],coorx[i]++,170,tam[i],190);
          noTint();
        }
      }
      if(coorx[i]==54)
      tam[i]=0;
      

      
}

/*    Muestra  imagen recorrido izquierda del lado derecho*/
void Izquierda_Derecha(int i)
{

      
  if(coorx[i]==740&&tam[i]<0)
    tam[i]=-68;
      if(tam[i]>=0)//adelante
      {
        if(coorx[i]%4==0)
        {
         image(img[i],coorx[i]--,180,tam[i],200);
         tam[i]=tam[i]+4;
        }
        else
          image(img[i],coorx[i]--,180,tam[i],200);
      }//atras
      else
      {
        if(coorx[i]%4==0)
        {
         tint(80);//azul
         image(img[i],coorx[i]++,170,tam[i],190);
         noTint();
         tam[i]=tam[i]+4;
        }
        else
        {
          tint(80);
          image(img[i],coorx[i]++,170,tam[i],190);
          noTint();
        }
      }
      if(coorx[i]==810)
      tam[i]=0;

}

void Izquierda_Atras(int i)
{
      
       if(coorx[i]<=330&&coorx[i]>160)
      {
        if(coorx[i]%4==0)
          image(img[i],coorx[i]++,170,tam[i]--,190);
        else
          image(img[i],coorx[i]++,170,tam[i],190);
      }
      else if(coorx[i]>=430&&coorx[i]<740)
      {
        if(coorx[i]%4==0)
          image(img[i],coorx[i]++,170,tam[i]++,190);
        else
          image(img[i],coorx[i]++,170,tam[i],190);
      }
      else
      {
        image(img[i],coorx[i]++,170,tam[i],190);
      }

}

void Izquierda_Enfrente(int i)
{

      
    if(coorx[i]==180)
    tam[i]=113;
  if(coorx[i]==380)
    tam[i]=150;
  if(coorx[i]==580)
    tam[i]=113;
    
  if(coorx[i]<=330&&coorx[i]>160)
    {
      if(coorx[i]%4==0)
        image(img[i],coorx[i]--,180,tam[i]--,200);
      else
        image(img[i],coorx[i]--,180,tam[i],200);
    }
    else if(coorx[i]>=430&&coorx[i]<740)
    {
      if(coorx[i]%4==0)
        image(img[i],coorx[i]--,180,tam[i]++,200);
      else
        image(img[i],coorx[i]--,180,tam[i],200);
    }
    else
    {
      image(img[i],coorx[i]--,180,tam[i],200);
    }
}

/*    Se inicializan los valores por default    */
void InicializarValores()
{
  tam[0]=113;
  tam[1]=150;
  tam[2]=113;
  tam[3]=24;
  tam[4]=-93;
  tam[5]=-138;
  tam[6]=-142;/////////////
  tam[7]=-44;
  
  coorx[0]=180;
  coorx[1]=380;
  coorx[2]=580;
  coorx[3]=780;
  coorx[4]=660;
  coorx[5]=480;
  coorx[6]=300;/////////////
  coorx[7]=100; 
}

/*    Derecha    */

void Derecha_Izquierda(int i)
{
    
    if(coorx[i]==160&&tam[i]<0)
      tam[i]=-104;
      
      if(tam[i]>=0)
      {
        if(coorx[i]%4==0)
        {
         image(img[i],coorx[i]++,180,tam[i]++,200);
         tam[i]=tam[i]+3;
        }
        else
          image(img[i],coorx[i]++,180,tam[i],200);
      }
      else
      {
        if(coorx[i]%4==0)
        {
         tint(80);//azul
         image(img[i],coorx[i]--,170,tam[i]++,190);
         noTint();
         tam[i]=tam[i]+3;
        }
        else
        {
          tint(80);
          image(img[i],coorx[i]--,170,tam[i],190);
          noTint();
        }
      }
      if(coorx[i]==54)
      tam[i]=0;
      

      
}

/*    Muestra  imagen recorrido izquierda del lado derecho*/
void Derecha_Derecha(int i)
{
  if(coorx[i]==740&&tam[i]>0)
    tam[i]=64;
      if(tam[i]>=0)//adelante
      {
        if(coorx[i]%4==0)
        {
         image(img[i],coorx[i]++,180,tam[i],200);
         tam[i]=tam[i]-4;
        }
        else
          image(img[i],coorx[i]++,180,tam[i],200);
      }//atras
      else
      {
        if(coorx[i]%4==0)
        {
         tint(80);//azul
         image(img[i],coorx[i]--,170,tam[i],190);
         noTint();
         tam[i]=tam[i]-4;
        }
        else
        {
          tint(80);
          image(img[i],coorx[i]--,170,tam[i],190);
          noTint();
        }
      }
      if(coorx[i]==810)
      tam[i]=0;

}

void Derecha_Atras(int i)
{
  if(coorx[i]==739&&tam[i]<0)
    tam[i]=-73;
    
       if(coorx[i]<=330&&coorx[i]>160)
      {
        if(coorx[i]%4==0)
          image(img[i],coorx[i]--,170,tam[i]++,190);
        else
          image(img[i],coorx[i]--,170,tam[i],190);
      }
      else if(coorx[i]>=430&&coorx[i]<740)
      {
        if(coorx[i]%4==0)
          image(img[i],coorx[i]--,170,tam[i]--,190);
        else
          image(img[i],coorx[i]--,170,tam[i],190);
      }
      else
      {
        image(img[i],coorx[i]--,170,tam[i],190);
      }

}

void Derecha_Enfrente(int i)
{
   if(coorx[i]==161)
    tam[i]=108;
    
    if(coorx[i]==180)
    tam[i]=113;
  if(coorx[i]==380)
    tam[i]=150;
  if(coorx[i]==580)
    tam[i]=113;
    
  if(coorx[i]<=330&&coorx[i]>160)
    {
      if(coorx[i]%4==0)
        image(img[i],coorx[i]++,180,tam[i]++,200);
      else
        image(img[i],coorx[i]++,180,tam[i],200);
    }
    else if(coorx[i]>=430&&coorx[i]<740)
    {
      if(coorx[i]%4==0)
        image(img[i],coorx[i]++,180,tam[i]--,200);
      else
        image(img[i],coorx[i]++,180,tam[i],200);
    }
    else
    {
      image(img[i],coorx[i]++,180,tam[i],200);
    }
}
/*    Se crea arreglo de imagenes    */
void InicializarImages()
{
  for(int i = 0; i<8;i++)
    img[i] = loadImage("img"+(i+1)+".jpg");
}