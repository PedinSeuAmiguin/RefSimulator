class Menu {
  boolean menu;
  boolean mode;
  Menu(boolean me, boolean mo){
    this.menu = me;
    this.mode = mo;
  }
  void drawMenu() {
    if (this.menu) {
      strokeWeight(2);
      stroke(126);  
      fill(255);
      rect(50, height/12+50, width-100, height-200);

      if(mouseX >= width/3 && mouseX <= width/1.5 && mouseY >= height/4+50 && mouseY <= height/4+90) {
        fill(254, 230, 230);
        rect(width/3, height/4+50, width-width/1.5, 40);
      } else {
        fill(251);
        rect(width/3, height/4+50, width-width/1.5, 40);
      }

      if (mouseX >= width/3 && mouseX <= width/1.5 && mouseY >= height/2+50 && mouseY <= height/2+100) {
        fill(254, 230, 230);
        rect(width/3, height/2+50, width-width/1.5, 50);
      } else {
        fill(251);
        rect(width/3, height/2+50, width-width/1.5, 50);
      }

      fill(126);
      textSize(20);
      textAlign(CENTER, CENTER);
      text("SELECIONE O MODO DE EXECUÇÃO", width/2, height/9+80);

      textSize(16);
      text("Modo de edição de ângulo", width/2, height/4+68);
      text("Modo de edição de\níndice de refração", width/2, height/2+73);
      textSize(12);
      text("Nota: Neste modo, o usuário irá inserir os valores de ângulo\npara então receber o valor do índice de refração do segundo meio", width/2, height/4+120);
      text("Nota: Neste modo, o usuário irá inserir os valores de índice\n de refração do segundo meio e o ângulo\nde incidência para então receber o ângulo de refração", width/2, height/2+140);

      textSize(40);
      text("REFRACTION SIMULATOR", width/2, 50);

      textSize(15);
      text("Desenvolvido por: José Pedro Fernandes Couto e Rômulo Costa de Menezes Junior", width/2, height-20);
    }
  }
}
