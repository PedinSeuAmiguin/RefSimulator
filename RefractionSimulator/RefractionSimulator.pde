float angI = 40;
float angR = 25;
float n1 = 2.0, n2 = 2.3;
boolean mode = true, menu = true;

void setup() {
  size(700, 700);
  background(225);
  frameRate(15);
}

void draw() {
  background(225);
  Menu m1 = new Menu(this.menu, this.mode);
  m1.drawMenu();
  this.menu = m1.menu;
  this.mode = m1.mode;

  //criação do meio 2
  if (!menu) {
    fill(126);
    line(0, height/2, width, height/2);
    fill(175);
    noStroke();
    rect(0, height/2, width, height/2);

    //criação dos raios
    Ray r1 = new Ray(this.angI, this.angR, this.n1, this.n2, this.mode);  
    r1.raios();

    stroke(126);  
    fill(255);

    //botão Config
    rect(10, 10, 60, 25);

    //caixas de modificação dos ângulos
    rect(width-150, 10, 140, 135);

    //caixas de modificação dos índices de refração
    if (this.mode) {
      rect(width-150, 155, 140, 55);
      rect(10, height/2 + 155, 140, 55);
    } else {
      rect(width-150, 155, 140, 175);
      rect(10, height/2 + 155, 140, 175);
    }

    fill(245);
    //botões de aumento e redução (angulo de incidência)
    rect(width-75, 65, 55, 30);
    rect(width-75, 105, 55, 30);
    rect(width-140, 65, 55, 30);
    rect(width-140, 105, 55, 30);

    fill(255);
    rect(width-150, height/2+10, 140, 55);
    if (this.mode) {
      rect(10, height/2 + 10, 140, 135);
      //botôes de aumento e redução (angulo de refração)
      fill(245);
      rect(20, height/2+65, 55, 30);
      rect(20, height/2+105, 55, 30);
      rect(85, height/2+65, 55, 30);
      rect(85, height/2+105, 55, 30);
    } else {
      rect(width-140, 210, 55, 30);
      rect(width-140, 250, 55, 30);
      rect(width-140, 290, 55, 30);
      rect(width-75, 210, 55, 30);
      rect(width-75, 250, 55, 30);
      rect(width-75, 290, 55, 30);

      rect(10, height/2 + 10, 140, 55);
      //botões de aumento e redução (n refratado)
      rect(20, height/2+210, 55, 30);
      rect(20, height/2+250, 55, 30);
      rect(20, height/2+290, 55, 30);
      rect(85, height/2+210, 55, 30);
      rect(85, height/2+250, 55, 30);
      rect(85, height/2+290, 55, 30);
    }

    fill(126);
    textSize(14);
    textAlign(CENTER, CENTER);

    text("Menu", 40, 20);
    text("Ângulo de\nincidência: " + this.angI + "°", width-80, 35); //título do bloco de edição de ângulo de incidência

    //texto dos botões
    fill(0, 150, 0);
    text("+1", width-45, 78);
    text("+5", width-45, 118);

    fill(150, 0, 0);
    text("-1", width-110, 78);
    text("-5", width-110, 118);

    fill(126);
    text("Ângulo de\nrefração: " + nf(r1.angleR, 2, 2) + "°", 80, height/2+35); //título do bloco de edição de ângulo de refração

    if (this.mode) {
      // texto dos botões
      fill(150, 0, 0);
      text("-1", 50, height/2+78);
      text("-5", 50, height/2+118);
      fill(0, 150, 0);
      text("+1", 115, height/2+78);
      text("+5", 115, height/2+118);
      fill(126);
      text("Modo:\nEdição de ângulo", width-77, width/2 + 37);//texto do botão de modo (ângulo)
    } else {
      fill(126);
      text("Modo:\nEdição de refração", width-77, width/2 + 37);//texto do botão de modo (refração)
    }

    fill(126);
    text("N incidente: " + nf(r1.nMedia1, 1, 2), width-80, 180); //título do bloco de edição do n incidente
    //título do bloco de edição do n refratado
    if (this.angI > 1 && this.angR < 0.01) {
      text("Não ocorre\nrefração", 80, height/2+180);
    } else {
      text("N refratado: " + nf(r1.nMedia2, 1, 2), 80, height/2+180);
    }

    //texto dos botões
    if (!this.mode) {
      fill(150, 0, 0);
      text("-0.1", width-112, 223);
      text("-0.5", width-112, 263);
      text("-0.01", width-112, 303);
      fill(0, 150, 0);
      text("+0.1", width-48, 223);
      text("+0.5", width-48, 263);
      text("+0.01", width-48, 303);

      fill(150, 0, 0);
      text("-0.1", 50, height/2+223);
      text("-0.5", 50, height/2+263);
      text("-0.01", 50, height/2+303);
      fill(0, 150, 0);
      text("+0.1", 115, height/2+223);
      text("+0.5", 115, height/2+263);
      text("+0.01", 115, height/2+303);
    }
    //reta normal
    fill(126);
    textSize(15);
    textAlign(NORMAL);
    text("Reta normal", width/2 + 10, 20);
    text("Superfície que separa os meios", 10, height/2-10);
    stroke(126);
    strokeWeight(3);
    line(width/2, 0, width/2, height);
  }
}

void mouseClicked() {
  if (this.menu) {
    //evento dos botões da tela de escolha
    if (mouseX >= width/3 && mouseX <= width/1.5 && mouseY >= height/4+50 && mouseY <= height/4+90) {
      this.mode = true;
      this.menu = false;
      this.n1 = 1;
    }
    if (mouseX >= width/3 && mouseX <= width/1.5 && mouseY >= height/2+50 && mouseY <= height/2+100) {
      this.mode = false;
      this.menu = false;
    }
  } else {
    //botão Config
    if(mouseX >= 10 && mouseX <= 70 && mouseY >= 10 && mouseY <= 35) {
      this.menu = true;
    }

    //evento dos botôes de aumento e redução do ângulo de incidência
    if (mouseX >= width-75 && mouseX <= width-20 && mouseY >= 55 && mouseY <= 85) {
      this.angI += 1;
    }
    if (mouseX >= width-75 && mouseX <= width-20 && mouseY >= 105 && mouseY <= 135) {
      this.angI += 5;
    }
    if (mouseX >= width-140 && mouseX <= width-85 && mouseY >= 55 && mouseY <= 85) {
      this.angI -= 1;
    }
    if (mouseX >= width-140 && mouseX <= width-85 && mouseY >= 105 && mouseY <= 135) {
      this.angI -= 5;
    }

    //evento dos botões de aumento e redução do ângulo de refração
    if (this.mode) {
      if (mouseX >= 85 && mouseX <= 140 && mouseY >= height/2+55 && mouseY <= height/2+85) {
        this.angR += 1;
      }
      if (mouseX >= 85 && mouseX <= 140 && mouseY >= height/2+95 && mouseY <= height/2+125) {
        this.angR += 5;
      }
      if (mouseX >= 20 && mouseX <= 85 && mouseY >= height/2+55 && mouseY <= height/2+85) {
        this.angR -= 1;
      }
      if (mouseX >= 20 && mouseX <= 85 && mouseY >= height/2+95 && mouseY <= height/2+125) {
        this.angR -= 5;
      }
    } else {
      //evento dos botões de aumento e redução do índice de refração
      if (mouseX >= width-140 && mouseX <= width-85 && mouseY >= 210 && mouseY <= 240) {
        this.n1 -= 0.1;
      }
      if (mouseX >= width-140 && mouseX <= width-85 && mouseY >= 250 && mouseY <= 280) {
        this.n1 -= 0.5;
      }
      if (mouseX >= width-140 && mouseX <= width-85 && mouseY >= 290 && mouseY <= 320) {
        this.n1 -= 0.01;
      }
      if (mouseX >= width-75 && mouseX <= width-20 && mouseY >= 210 && mouseY <= 240) {
        this.n1 += 0.1;
      }
      if (mouseX >= width-75 && mouseX <= width-20 && mouseY >= 250 && mouseY <= 280) {
        this.n1 += 0.5;
      }
      if (mouseX >= width-75 && mouseX <= width-20 && mouseY >= 290 && mouseY <= 320) {
        this.n1 += 0.01;
      }

      if (mouseX >= 20 && mouseX <= 75 && mouseY >= height/2+210 && mouseY <= height/2+240) {
        this.n2 -= 0.1;
      }
      if (mouseX >= 20 && mouseX <= 75 && mouseY >= height/2+250 && mouseY <= height/2+280) {
        this.n2 -= 0.5;
      }
      if (mouseX >= 20 && mouseX <= 75 && mouseY >= height/2+290 && mouseY <= height/2+320) {
        this.n2 -= 0.01;
      }
      if (mouseX >= 85 && mouseX <= 140 && mouseY >= height/2+210 && mouseY <= height/2+240) {
        this.n2 += 0.1;
      }
      if (mouseX >= 85 && mouseX <= 140 && mouseY >= height/2+250 && mouseY <= height/2+280) {
        this.n2 += 0.5;
      }
      if (mouseX >= 85 && mouseX <= 140 && mouseY >= height/2+290 && mouseY <= height/2+320) {
        this.n2 += 0.01;
      }

      if (this.n1 < 1) {
        this.n1 = 1;
      }
      if (this.n2 < 1) {
        this.n2 = 1;
      }
      if (this.n1>10) {
        this.n1 = 10;
      }
      if (this.n2>10) {
        this.n2 = 10;
      }
    }

    //Parte do código que mantem o raio na área correta
    if (this.angI < 0) {
      this.angI = 0;
    }
    if (this.angI > 90) {
      this.angI = 90;
    }
    if (this.angR < 0) {
      this.angR = 0;
    }
    if (this.angR > 90) {
      this.angR = 90;
    }
    
    if (this.mode && this.angR > this.angI) {
      this.angR = angI;
    }
  }
}
