class GameSoundEffect {

  //Sound Objekte Deklarieren
  SoundFile soundEffect; //File da abgespielt wird
  String soundPath; //Relativer Pfad in dem das Soundfile hinterlegt ist
  File soundPathFile; //Um Files aus dem Ordner zu laden
  String[] soundEffectList; //Liste in dem die File namen abgelegt werden

  GameSoundEffect(String tempPath) {

  }

  void soundStart() {
    soundEffect.play();
  }

  void soundStartSpecific(String tempSoundEffect) {
    soundEffect.stop();

  }

  void soundNext() {

  }

  void soundStop() {
    soundEffect.stop();
  }

  void soundRandom() {

  }

}
