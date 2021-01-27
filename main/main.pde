NeuralNetwork brain;
int TOTAL=10000000;
int ITERATION_PER_FRAME=1000;
int l_proc=-1;
void setup() {
  size(1000, 600);
  brain=new NeuralNetwork(2, 2, 1, 0.001);
  //brain=new NeuralNetwork(loadJSONObject("xor-nn-001.json"));
}
void draw() {
  background(45);
  float[][] in={{0, 0}, {0, 1}, {1, 0}, {1, 1}}, out={{0}, {1}, {1}, {0}};
  brain.train_multiple(in, out, ITERATION_PER_FRAME);
  translate(0, 0);
  graph_nn(brain, in[0], 500, 300);
  translate(500, 0);
  graph_nn(brain, in[1], 500, 300);
  translate(-500, 300);
  graph_nn(brain, in[2], 500, 300);
  translate(500, 0);
  graph_nn(brain, in[3], 500, 300);
  if (frameCount*ITERATION_PER_FRAME>=TOTAL) {
    noLoop();
  }
  if (int((float)frameCount*ITERATION_PER_FRAME/TOTAL*100)>l_proc) {
    l_proc=int((float)frameCount*ITERATION_PER_FRAME/TOTAL*100);
    println(int((float)frameCount*ITERATION_PER_FRAME/TOTAL*100)+"% complete");
  }
}




void run() {
  println("------XOR Gate------\n");
  float[][] v={{0, 0}, {0, 1}, {1, 0}, {1, 1}};
  for (int i=0; i<4; i++) {
    float d=brain.predict(v[i])[0];
    boolean s=false;
    if (d>0.5) {
      s=true;
    }
    println("A: "+v[i][0]+", B:", v[i][1]+" -> "+s+" ("+d+")" );
  }
}








//void train() {
//  brain=new NeuralNetwork(2, 2, 1, 0.001);
//  float[][] in={{0, 0}, {0, 1}, {1, 0}, {1, 1}}, out={{0}, {1}, {1}, {0}};
//  brain.train_multiple(in, out, 1000000);
//  saveJSONObject(brain.toJSON(), "data/xor-nn-###.json");
//}
