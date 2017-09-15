// gifAnimationライブラリを読み込む
import gifAnimation.*;

// GifMakerクラスを呼ぶ
GifMaker gifExport;

ArrayList<ParticleSystem> systems;

boolean cut;

float waiting;
float backCol;

void setup() {
  size(400, 300);
  frameRate(50);
  waiting = 0;
  cut = true;
  backCol = -30;
  systems = new ArrayList<ParticleSystem>();
    systems.add(new ParticleSystem(new PVector(width + 20, 50), new PVector(-4, -3), new PVector(-1, -1)));
    systems.add(new ParticleSystem(new PVector(-20, 50), new PVector(1, 0), new PVector(4, -3)));
  
  // GIFアニメ出力の設定
  gifExport = new GifMaker(this, "export.gif"); // GifMakerオブジェクトを作る、第2引数にファイル名
  gifExport.setRepeat(0); // エンドレス再生
  gifExport.setQuality(10); // クオリティ(デフォルト10)
  gifExport.setDelay(20); // アニメーションの間隔を20ms(50fps)に
}

void draw() {
  
  println(frameCount);
  back();
  for (ParticleSystem ps : systems) {
    ps.run();
  }

  if (cut) {
    backCol+=0.7;
    if (backCol > 300) {
      flip(false);
    }
  } else {
    backCol-=0.9;
    if (backCol < -30) {
      flip(true);
    }
  }
  
  
  // GIFアニメ出力用のコード
  // 50fps * 3、つまり丸3秒録画する
  if(frameCount <= 900){
    gifExport.addFrame(); // フレームを追加
  } else {
    gifExport.finish(); // 終了してファイル保存
  }
  
}

void back() {
  background(backCol);
  noStroke();
  fill(255, 0, 0, 100);
  beginShape();
  vertex(100, 100);
  vertex(150, 100);
  vertex(150, 50);
  vertex(250, 50);
  vertex(250, 100);
  vertex(300, 100);
  vertex(300, 200);
  vertex(250, 200);
  vertex(250, 250);
  vertex(150, 250);
  vertex(150, 200);
  vertex(150, 200);
  vertex(100, 200);
  endShape(CLOSE);
}

void flip(boolean cut_) {
  cut = cut_;
  for (ParticleSystem ps : systems) {
    ps.cut = cut_;
  }
}