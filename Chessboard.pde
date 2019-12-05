/*
 * Draw a chessboard
 */
 
import processing.pdf.*;

final int INDEX_LEFT = 0;
final int INDEX_TOP = 1;
final int INDEX_RIGHT = 2;
final int INDEX_BOTTOM = 3;
 
//A3
//final int CANVAS_WIDTH = 1200;
//final int CANVAS_HEIGHT = 800;
//A4
//final int CANVAS_WIDTH = 800;
//final int CANVAS_HEIGHT = 600;
final int CANVAS_WIDTH = 1200;
final int CANVAS_HEIGHT = 800;

final boolean PDF_FILE = false;

final color COLOR_SQUARE_BLACK = color(0, 0, 0);
final color COLOR_SQUARE_WHITE = color(255, 255, 255);
//final color COLOR_BACKGROUND = color(0, 80, 80);
final color COLOR_BACKGROUND = color(255, 255, 255);

//---- da mm
final int DPI = 72;
final float SQUARE_WIDTH_MM = 35;
final float SQUARE_WIDTH = (SQUARE_WIDTH_MM / 25.4) * DPI;
//----

//final int SQUARE_WIDTH = 100;
final float SQUARE_HEIGHT = SQUARE_WIDTH;

final float BORDERS[] = {60, 40, 50, 10}; //left, top, right, bottom

final int SQUARE_COL_NUM = (int) ((CANVAS_WIDTH - BORDERS[INDEX_LEFT] - BORDERS[INDEX_RIGHT]) / SQUARE_WIDTH);
final int SQUARE_ROW_NUM = (int) ((CANVAS_HEIGHT - BORDERS[INDEX_TOP] - BORDERS[INDEX_BOTTOM]) / SQUARE_HEIGHT);
//pro test:
//final int SQUARE_COL_NUM = 1;
//final int SQUARE_ROW_NUM = 1;
                            
void setup() {
  if (PDF_FILE) size(CANVAS_WIDTH, CANVAS_HEIGHT, PDF, "chessboard.pdf");
  else size(CANVAS_WIDTH, CANVAS_HEIGHT);
  
  noLoop();
}

void draw() {
  float fRectX, fRectY;
  boolean startBlack;
  int numBlackToDraw;
  int colBlackToStart;

  //background
  background(COLOR_BACKGROUND);
  
  //squares
  println("SQUARE_COL_NUM: " + SQUARE_COL_NUM);
  println("SQUARE_ROW_NUM: " + SQUARE_ROW_NUM);
  
  for(int row = 1; row <= SQUARE_ROW_NUM; row++)
  {
    for(int col = 1; col <= SQUARE_COL_NUM; col++)
    {
      color colorSquare = (row % 2 == 0) ? ((col % 2 == 0) ? COLOR_SQUARE_BLACK : COLOR_SQUARE_WHITE) : ((col % 2 == 0) ? COLOR_SQUARE_WHITE : COLOR_SQUARE_BLACK);
      fill(colorSquare);
      fRectX = ((col - 1) * SQUARE_WIDTH) + BORDERS[INDEX_LEFT];
      fRectY = ((row - 1) * SQUARE_HEIGHT) + BORDERS[INDEX_TOP];
      rect(fRectX, fRectY, SQUARE_WIDTH, SQUARE_HEIGHT);
    }
  }

  if (!PDF_FILE) save("chessboard.tif");
  exit();
}
