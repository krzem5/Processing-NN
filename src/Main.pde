final int TOTAL=10000000;
final int ITERATION_PER_FRAME=1000;



NeuralNetwork nn;
int _lp=-1;



void setup(){
	size(1000,600);
	nn=new NeuralNetwork(2,2,1,0.001);
}



void draw(){
	background(45);
	float[][] in={{0,0},{0,1},{1,0},{1,1}},out={{0},{1},{1},{0}};
	nn.train_multiple(in,out,ITERATION_PER_FRAME);
	translate(0,0);
	nn.draw(in[0],500,300);
	translate(500,0);
	nn.draw(in[1],500,300);
	translate(-500,300);
	nn.draw(in[2],500,300);
	translate(500,0);
	nn.draw(in[3],500,300);
	if (frameCount*ITERATION_PER_FRAME>=TOTAL){
		println("------XOR Gate------\n");
		float[][] v={{0,0},{0,1},{1,0},{1,1}};
		for (int i=0;i<4;i++){
			float d=nn.predict(v[i])[0];
			boolean s=false;
			if (d>0.5){
				s=true;
			}
			println("A: "+v[i][0]+",B:",v[i][1]+" -> "+s+" ("+d+")" );
		}
		noLoop();
	}
	if (int((float)frameCount*ITERATION_PER_FRAME/TOTAL*100)>_lp){
		_lp=int((float)frameCount*ITERATION_PER_FRAME/TOTAL*100);
		println(int((float)frameCount*ITERATION_PER_FRAME/TOTAL*100)+"% complete");
	}
}
