class Ray {
  float angleI, angleR, posIy, posIx, posFx, posFy, radAngI, radAngR, nMedia1, nMedia2;
  boolean mode;//true = Modo Edição de Ângulo, false = Modo Edição de Índice
  
  Ray(float a1, float a2, float n1,float n2, boolean m) {
    this.nMedia1 = n1;
    this.nMedia2 = n2;
    this.angleI = a1;
    this.angleR = a2;
    this.radAngI = radians(a1);
    this.radAngR = radians(a2);
    this.mode = m;
    
    calcRayByAng();
  }

  //Controle da linha através ângulo
  void calcRayByAng () {
    if (this.angleI == 90) {
      this.posFx = width;
      this.posFy = height/2;
      this.posIx = 0;
      this.posIy = height/2;
      this.angleR = 90;
      this.radAngR = radians(90);
    } else if (this.angleI > 45) {
      this.posIy = width/2 - (width * tan(HALF_PI-this.radAngI))/2;
      this.posIx = 0;
    } else {
      this.posIx = width/2 - (width * tan(this.radAngI))/2;
      this.posIy = 0;
    } 
    
    if (this.angleI == 90) {
      
    }
    else if (this.angleR < 45) {
      this.posFx = height/2 + (height * tan(radAngR))/2;
      this.posFy = height;
    } else {
      this.posFy = width/2 + (width * tan(HALF_PI-radAngR))/2;
      this.posFx = width; //<>//
    }
  }

  float snellLawA (float iang, float n1, float n2) {
    float angSnellR = asin(n1*sin(iang)/n2);
    return angSnellR;
  }
  
  float snellLawR (float iang, float angR) {
    float indexSnellR = sin(iang)/sin(angR);
    return indexSnellR;
  }
  
  float limitAng (float n1, float n2) {
    float lAng = n2/n1;
    return degrees(asin(lAng));
  }

  void raios() {
    strokeWeight(2);
    stroke(255, 0, 0);
    fill(255);
    arc(width/2, width/2, 50, 50, PI+(HALF_PI-radAngI), HALF_PI+PI);
    line(this.posIx, this.posIy, width/2, height/2);

    if (mode) {
      this.nMedia2 = snellLawR(this.radAngI, this.radAngR);
      strokeWeight(2);
      stroke(255, 0, 0);
      calcRayByAng();
      arc(width/2, width/2, 50, 50, HALF_PI-radAngR, HALF_PI);
      line(width/2, height/2, this.posFx, this.posFy);
    } else {
      this.radAngR = snellLawA(this.radAngI, this.nMedia1, this.nMedia2);
      this.angleR = degrees(this.radAngR);
      strokeWeight(2);
      stroke(255, 0, 0);
      calcRayByAng();
      arc(width/2, width/2, 50, 50, HALF_PI-radAngR, HALF_PI);
      line(width/2, height/2, this.posFx, this.posFy);
      
      if (this.angleI > limitAng(this.nMedia1,this.nMedia2)) {
        stroke(255, 0, 0);
        arc(width/2, width/2, 50, 50, HALF_PI+PI, PI+(HALF_PI+radAngI));
        line(width - this.posIx, this.posIy, width/2, height/2);
        print(limitAng(this.nMedia1,this.nMedia2)+ "\n");
        this.angleR = this.angleI;
      }
    }
  }
}
