PImage imagen;
void setup() {
  size(800, 400);
  imagen = loadImage("imagen.jpg");
}

void draw() {
  
  background(255);
  image(imagen, 0, 0, 400, 400);
  stroke(0);
  
  //Bloque de diagonales numero 1
  //le paso que arranque X desde 420 porque si no se superpone con la imagen (esto pasa solo cuando las diagonales van al reves)
  drawDiagonalLineConditional(420,0,width,55,19,true);
  
  //Bloque de verticales numero 1
  drawVerticalLine(63,120);
  
  //Bloque de diagonales numero 2
  drawDiagonalLineConditional(400,140,width,260,19,false);
  
  //Bloque de verticales numero 2
  drawVerticalLine(270,326);
  
  //Bloque de diagonales numero 3
  drawDiagonalLineConditional(420,333,width,height,19,true);
  

}

void drawDiagonalLineConditional(int startX,int startY,int endX,int endY,int spacing,boolean diagonalLeft){
  
  //startX = es el valor donde va a arrancar el punto X
  //startY = es el valor donde va a arrancar el punto Y
  //endX = es el valor donde va a terminar el punto X
  //endY = es el valor donde va a terminar el punto Y
  //spacing = es el espaciado entre lineas. Cuanto menos espacio, más lineas van a entrar en la pantalla. Tenes que ir jugando con ese numero para que te queden las mismas rayas que la imagen. Yo lo dejé aproximado viste, que se yo
  //diagonalLeft = es la orientacion de la linea. Si vos le pasas true, la linea va a generarse como para la derecha, como en el primer bloque. Si le pasas false, se va a generar para el otro lado. Ponele un nombre mas claro a esto ,yo no supe cual xd
  
  
  //esta variable es la que va a manejar con los numeros si la linea se empieza a generar desde izquierda a derecha, o de derecha a izquierda
  int increment = 0;
  
 
 
  if(diagonalLeft == true){
    //si diagonalLeft es true, va a ser un numero positivo, y va a hacer que las lineas se vayan generando desde arriba y hacia la derecha
     increment = spacing;
  }else{
    //si es false entra al else, y hace que las lienas se generen desde abajo hacia arriba 
    increment = -spacing;
  }
  
  //ancho de la linea
  strokeWeight(5);
  //forma de la linea
  strokeCap(SQUARE);
  
  //el ciclo FOR arranca a ejecutarse con x = startX, osea el valor que le pasamos por parametro. Y termina cuando X es menor o igual a endX, el otro parametro que indica el final. 
  //Despues le suma el valor de spacing a X para ir recorriendo el eje X.
  for (int x=startX; x <= endX; x+=spacing) {
    //En el segundo for es exactamente lo mismo, pero para recorrer el eje Y
    for (int y=startY; y <= endY; y+=spacing) {
      
      //Incrementr tiene el mismo valor que spacing, pero positivo o negativo segun el lado que quieras que vaya (como explique arriba)
      // Si el valor de increment es positivo, hacemos que el segundo punto vaya mas atras del primero, entonces haces que la diagonal se genere para el otro lado. Por ejemplo, en la primer vuelta el primer punto es en x=420 y=0, y el segundo en x=401 y=19
      //Si el valor de increment es negativo,tecnicamente va a sumar porque - por - es +. Entonces, el primer punto va a estar atras del segundo. Para darte un ejemplo, en la primer vuelta del ciclo for, el primer punto es en x=420 y=0, y el segundo x=439 y=19
   
     // acá me pierdo un poco porque son muchas sumas de numeros seguidas para ir viendo linea por linea, entonces no entiendo bien como cubre toda la pantalla ;(
      line(x,y,x-increment,y+spacing);
    }
  }

}


void drawVerticalLine(int start, int end){
  
  //Acá solamente tenemos que ir manejando donde arranca y termina Y para ir separando el bloque. Osea, elegimos desde donde hasta donde abarca Y para que no se superponga nada :)
  
  //start = es donde arranca el punto Y
  //end = es donde termina el punto Y
  
  //ancho de la linea
   strokeWeight(10);
   //Acá no le pongo strokeCap porque ya si se ejecuta una vez todas las lineas toman el mismo estilo.
   // Por eso si repito strokeWeight, porque son distintas en cada ejecucion
   
   //recorremos el eje X desde 400, hasta el final de la pantalla (800). X va saltando de 19 en 19, entonces se genera la separación de las rayitas
   for (int x = 400; x <= width; x += 19) {
     //con este otro for recorremos el eje Y. De nuevo, con start y end elegimos donde empieza y donde termina
    for (int y = start; y <= end; y += 19) {
       // Dibuja una línea vertical desde (x, y) hasta (x, y + 19). En la primera vuelta (suponiendo que le pasamos 0 de inicio y 50 de finalizacion), la linea empezaria en x=400 y=0, y terminaria en x=400 y=19. 
      line(x, y, x, y + 19); 
    }
  }

}
