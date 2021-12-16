/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void redArmyDraw(PApplet appc, GWinData data) { //_CODE_:redArmyWindow:656596:
  appc.background(230);
} //_CODE_:redArmyWindow:656596:

public void redPauseButtonClicked(GButton source, GEvent event) { //_CODE_:redPauseButton:387524:
  if(play) {
        loop();
        play = false;
        redPauseButton.setText("Pause");
  }
  else {
        noLoop();
        play = true;
        redPauseButton.setText("Resume");
  }
} //_CODE_:redPauseButton:387524:

public void redTerrainButtonClicked(GButton source, GEvent event) { //_CODE_:redTerrainButton:647294:
  if(play) {
    return;
  }  
  if(isGrass) {
      isGrass = false;
      currentTerrain = mudTerrain;
  }
  else {
      isGrass = true;
      currentTerrain = grassTerrain;
  }
} //_CODE_:redTerrainButton:647294:

// These change the next wave's composition.
public void redLightInfSliderChanged(GSlider source, GEvent event) { //_CODE_:redLightInfSlider:205749:
  redLInf = redLightInfSlider.getValueI();
} //_CODE_:redLightInfSlider:205749:

public void redHeavyInfSliderChanged(GSlider source, GEvent event) { //_CODE_:redHeavyInfSlider:469569:
  redHInf = redHeavyInfSlider.getValueI();
} //_CODE_:redHeavyInfSlider:469569:

public void redLightCavSliderChanged(GSlider source, GEvent event) { //_CODE_:redLightCavSlider:768036:
  redLCav = redLightCavSlider.getValueI();
} //_CODE_:redLightCavSlider:768036:

public void redHeavyCavSliderChanged(GSlider source, GEvent event) { //_CODE_:redHeavyCavSlider:590363:
  redHCav = redHeavyCavSlider.getValueI();
} //_CODE_:redHeavyCavSlider:590363:

public void redLightArtSliderChanged(GSlider source, GEvent event) { //_CODE_:redLightArtSlider:782337:
  redLArt = redLightArtSlider.getValueI();
} //_CODE_:redLightArtSlider:782337:

public void redHeavyArtSliderChanged(GSlider source, GEvent event) { //_CODE_:redHeavyArtSlider:467037:
  redHArt = redHeavyArtSlider.getValueI();
} //_CODE_:redHeavyArtSlider:467037:

public void redSniperSliderChanged(GSlider source, GEvent event) { //_CODE_:redSniperSlider:321004:
  redSniper = redSniperSlider.getValueI();
} //_CODE_:redSniperSlider:321004:

public void reinforcementSliderChanged(GSlider source, GEvent event) { //_CODE_:reinforcementSlider:943239:
  setRedTime = reinforcementSlider.getValueI() * 30;
  redTimeUntilNextWave = setRedTime;
} //_CODE_:reinforcementSlider:943239:

synchronized public void blueArmyDraw(PApplet appc, GWinData data) { //_CODE_:blueArmyWindow:946729:
  appc.background(230);
} //_CODE_:blueArmyWindow:946729:

public void blueChangeTerrainButtonPressed(GButton source, GEvent event) { //_CODE_:blueChangeTerrainButton:266375:
  // If currently paused, stop execution.
  if(play) {
    return;
  }  
  if(isGrass) {
      isGrass = false;
      currentTerrain = mudTerrain;
  }
  else {
      isGrass = true;
      currentTerrain = grassTerrain;
  }
} //_CODE_:blueChangeTerrainButton:266375:

public void bluePauseButtonPressed(GButton source, GEvent event) { //_CODE_:bluePauseButton:356837:
  // if paused, unpause.
  if(play) {
        loop();
        play = false;
        bluePauseButton.setText("Pause");
  }
  // else pause.
  else {
        noLoop();
        play = true;
        bluePauseButton.setText("Resume");
  }
} //_CODE_:bluePauseButton:356837:

public void blueReinforcementSliderChanged(GSlider source, GEvent event) { //_CODE_:blueReinforcementSlider:296174:
  setBlueTime = blueReinforcementSlider.getValueI() * 30;
  blueTimeUntilNextWave = setBlueTime;
} //_CODE_:blueReinforcementSlider:296174:

public void blueLightInfSliderChanged(GSlider source, GEvent event) { //_CODE_:blueLightInfSlider:439661:
  blueLInf = blueLightInfSlider.getValueI();
} //_CODE_:blueLightInfSlider:439661:

public void blueHeavyCavSliderChanged(GSlider source, GEvent event) { //_CODE_:blueHeavyCavSlider:728299:
  blueHCav = blueHeavyCavSlider.getValueI();
} //_CODE_:blueHeavyCavSlider:728299:

public void blueLightCavSliderChanged(GSlider source, GEvent event) { //_CODE_:blueLightCavSlider:904030:
  blueLCav = blueLightCavSlider.getValueI();
} //_CODE_:blueLightCavSlider:904030:

public void blueHeavyInfSliderChanged(GSlider source, GEvent event) { //_CODE_:blueHeavyInfSlider:491497:
  blueHInf = blueHeavyInfSlider.getValueI();
} //_CODE_:blueHeavyInfSlider:491497:

public void blueLightArtSliderChanged(GSlider source, GEvent event) { //_CODE_:blueLightArtSlider:221937:
  blueLArt = blueLightArtSlider.getValueI();
} //_CODE_:blueLightArtSlider:221937:

public void blueHeavyArtSliderChanged(GSlider source, GEvent event) { //_CODE_:blueHeavyArtSlider:557177:
  blueHArt = blueHeavyArtSlider.getValueI();
} //_CODE_:blueHeavyArtSlider:557177:

public void blueSniperSliderChanged(GSlider source, GEvent event) { //_CODE_:blueSniperSlider:333950:
  blueSniper = blueSniperSlider.getValueI();
} //_CODE_:blueSniperSlider:333950:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("The Art of Warfare");
  redArmyWindow = GWindow.getWindow(this, "Red Army", 500, 500, 300, 300, JAVA2D);
  redArmyWindow.noLoop();
  redArmyWindow.setActionOnClose(G4P.KEEP_OPEN);
  redArmyWindow.addDrawHandler(this, "redArmyDraw");
  redPauseButton = new GButton(redArmyWindow, 20, 10, 80, 30);
  redPauseButton.setText("Pause");
  redPauseButton.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  redPauseButton.addEventHandler(this, "redPauseButtonClicked");
  redTerrainButton = new GButton(redArmyWindow, 200, 10, 80, 30);
  redTerrainButton.setText("Change Terrain");
  redTerrainButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  redTerrainButton.addEventHandler(this, "redTerrainButtonClicked");
  redLightInfSlider = new GSlider(redArmyWindow, 180, 70, 100, 40, 10.0);
  redLightInfSlider.setShowValue(true);
  redLightInfSlider.setLimits(0, 0, 20);
  redLightInfSlider.setShowTicks(true);
  redLightInfSlider.setNumberFormat(G4P.INTEGER, 0);
  redLightInfSlider.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  redLightInfSlider.setOpaque(true);
  redLightInfSlider.addEventHandler(this, "redLightInfSliderChanged");
  redHeavyInfSlider = new GSlider(redArmyWindow, 20, 130, 100, 40, 10.0);
  redHeavyInfSlider.setShowValue(true);
  redHeavyInfSlider.setLimits(0, 0, 10);
  redHeavyInfSlider.setShowTicks(true);
  redHeavyInfSlider.setNumberFormat(G4P.INTEGER, 0);
  redHeavyInfSlider.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  redHeavyInfSlider.setOpaque(true);
  redHeavyInfSlider.addEventHandler(this, "redHeavyInfSliderChanged");
  redLightCavSlider = new GSlider(redArmyWindow, 180, 130, 100, 40, 10.0);
  redLightCavSlider.setShowValue(true);
  redLightCavSlider.setLimits(0, 0, 10);
  redLightCavSlider.setShowTicks(true);
  redLightCavSlider.setNumberFormat(G4P.INTEGER, 0);
  redLightCavSlider.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  redLightCavSlider.setOpaque(true);
  redLightCavSlider.addEventHandler(this, "redLightCavSliderChanged");
  redHeavyCavSlider = new GSlider(redArmyWindow, 20, 190, 100, 40, 10.0);
  redHeavyCavSlider.setShowValue(true);
  redHeavyCavSlider.setLimits(0, 0, 10);
  redHeavyCavSlider.setShowTicks(true);
  redHeavyCavSlider.setNumberFormat(G4P.INTEGER, 0);
  redHeavyCavSlider.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  redHeavyCavSlider.setOpaque(true);
  redHeavyCavSlider.addEventHandler(this, "redHeavyCavSliderChanged");
  redLightArtSlider = new GSlider(redArmyWindow, 180, 190, 100, 40, 10.0);
  redLightArtSlider.setShowValue(true);
  redLightArtSlider.setLimits(0, 0, 10);
  redLightArtSlider.setShowTicks(true);
  redLightArtSlider.setNumberFormat(G4P.INTEGER, 0);
  redLightArtSlider.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  redLightArtSlider.setOpaque(true);
  redLightArtSlider.addEventHandler(this, "redLightArtSliderChanged");
  redHeavyArtSlider = new GSlider(redArmyWindow, 20, 250, 100, 40, 10.0);
  redHeavyArtSlider.setShowValue(true);
  redHeavyArtSlider.setLimits(0, 0, 10);
  redHeavyArtSlider.setShowTicks(true);
  redHeavyArtSlider.setNumberFormat(G4P.INTEGER, 0);
  redHeavyArtSlider.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  redHeavyArtSlider.setOpaque(true);
  redHeavyArtSlider.addEventHandler(this, "redHeavyArtSliderChanged");
  redSniperSlider = new GSlider(redArmyWindow, 180, 250, 100, 40, 10.0);
  redSniperSlider.setShowValue(true);
  redSniperSlider.setLimits(0, 0, 10);
  redSniperSlider.setShowTicks(true);
  redSniperSlider.setNumberFormat(G4P.INTEGER, 0);
  redSniperSlider.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  redSniperSlider.setOpaque(true);
  redSniperSlider.addEventHandler(this, "redSniperSliderChanged");
  reinforcementSlider = new GSlider(redArmyWindow, 20, 70, 100, 40, 10.0);
  reinforcementSlider.setShowValue(true);
  reinforcementSlider.setLimits(1, 1, 20);
  reinforcementSlider.setShowTicks(true);
  reinforcementSlider.setNumberFormat(G4P.INTEGER, 0);
  reinforcementSlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  reinforcementSlider.setOpaque(true);
  reinforcementSlider.addEventHandler(this, "reinforcementSliderChanged");
  redSniperLabel = new GLabel(redArmyWindow, 180, 230, 100, 20);
  redSniperLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redSniperLabel.setText("Sniper");
  redSniperLabel.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  redSniperLabel.setOpaque(true);
  redLightArtLabel = new GLabel(redArmyWindow, 180, 170, 100, 20);
  redLightArtLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redLightArtLabel.setText("Light Artillery");
  redLightArtLabel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  redLightArtLabel.setOpaque(true);
  redLightCavLabel = new GLabel(redArmyWindow, 180, 110, 100, 20);
  redLightCavLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redLightCavLabel.setText("Light Cavalry");
  redLightCavLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  redLightCavLabel.setOpaque(true);
  redHeavyArtLabel = new GLabel(redArmyWindow, 20, 230, 100, 20);
  redHeavyArtLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redHeavyArtLabel.setText("Heavy Artillery");
  redHeavyArtLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  redHeavyArtLabel.setOpaque(true);
  redHeavyCavLabel = new GLabel(redArmyWindow, 20, 170, 100, 20);
  redHeavyCavLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redHeavyCavLabel.setText("Heavy Cavalry");
  redHeavyCavLabel.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  redHeavyCavLabel.setOpaque(true);
  redHeavyInfLabel = new GLabel(redArmyWindow, 20, 110, 100, 20);
  redHeavyInfLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redHeavyInfLabel.setText("Heavy Infantry");
  redHeavyInfLabel.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  redHeavyInfLabel.setOpaque(true);
  redLightInfLabel = new GLabel(redArmyWindow, 180, 50, 100, 20);
  redLightInfLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redLightInfLabel.setText("Light Infantry");
  redLightInfLabel.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  redLightInfLabel.setOpaque(true);
  redReinforcementLabel = new GLabel(redArmyWindow, 20, 50, 100, 20);
  redReinforcementLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  redReinforcementLabel.setText("Reinforcement Time");
  redReinforcementLabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  redReinforcementLabel.setOpaque(true);
  blueArmyWindow = GWindow.getWindow(this, "blueArmy", 0, 0, 300, 300, JAVA2D);
  blueArmyWindow.noLoop();
  blueArmyWindow.setActionOnClose(G4P.KEEP_OPEN);
  blueArmyWindow.addDrawHandler(this, "blueArmyDraw");
  blueChangeTerrainButton = new GButton(blueArmyWindow, 200, 10, 80, 30);
  blueChangeTerrainButton.setText("Change Terrain");
  blueChangeTerrainButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  blueChangeTerrainButton.addEventHandler(this, "blueChangeTerrainButtonPressed");
  bluePauseButton = new GButton(blueArmyWindow, 20, 10, 80, 30);
  bluePauseButton.setText("Pause");
  bluePauseButton.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  bluePauseButton.addEventHandler(this, "bluePauseButtonPressed");
  blueReinforcementSlider = new GSlider(blueArmyWindow, 20, 70, 100, 40, 10.0);
  blueReinforcementSlider.setShowValue(true);
  blueReinforcementSlider.setLimits(1, 1, 20);
  blueReinforcementSlider.setShowTicks(true);
  blueReinforcementSlider.setNumberFormat(G4P.INTEGER, 0);
  blueReinforcementSlider.setOpaque(true);
  blueReinforcementSlider.addEventHandler(this, "blueReinforcementSliderChanged");
  blueLightInfSlider = new GSlider(blueArmyWindow, 180, 70, 100, 40, 10.0);
  blueLightInfSlider.setShowValue(true);
  blueLightInfSlider.setLimits(0, 0, 20);
  blueLightInfSlider.setShowTicks(true);
  blueLightInfSlider.setNumberFormat(G4P.INTEGER, 0);
  blueLightInfSlider.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  blueLightInfSlider.setOpaque(true);
  blueLightInfSlider.addEventHandler(this, "blueLightInfSliderChanged");
  blueHeavyCavSlider = new GSlider(blueArmyWindow, 20, 190, 100, 40, 10.0);
  blueHeavyCavSlider.setShowValue(true);
  blueHeavyCavSlider.setLimits(0, 0, 10);
  blueHeavyCavSlider.setShowTicks(true);
  blueHeavyCavSlider.setNumberFormat(G4P.INTEGER, 0);
  blueHeavyCavSlider.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  blueHeavyCavSlider.setOpaque(true);
  blueHeavyCavSlider.addEventHandler(this, "blueHeavyCavSliderChanged");
  blueLightCavSlider = new GSlider(blueArmyWindow, 180, 130, 100, 40, 10.0);
  blueLightCavSlider.setShowValue(true);
  blueLightCavSlider.setLimits(0, 0, 10);
  blueLightCavSlider.setShowTicks(true);
  blueLightCavSlider.setNumberFormat(G4P.INTEGER, 0);
  blueLightCavSlider.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  blueLightCavSlider.setOpaque(true);
  blueLightCavSlider.addEventHandler(this, "blueLightCavSliderChanged");
  blueHeavyInfSlider = new GSlider(blueArmyWindow, 20, 130, 100, 40, 10.0);
  blueHeavyInfSlider.setShowValue(true);
  blueHeavyInfSlider.setLimits(0, 0, 10);
  blueHeavyInfSlider.setShowTicks(true);
  blueHeavyInfSlider.setNumberFormat(G4P.INTEGER, 0);
  blueHeavyInfSlider.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  blueHeavyInfSlider.setOpaque(true);
  blueHeavyInfSlider.addEventHandler(this, "blueHeavyInfSliderChanged");
  blueLightArtSlider = new GSlider(blueArmyWindow, 180, 190, 100, 40, 10.0);
  blueLightArtSlider.setShowValue(true);
  blueLightArtSlider.setLimits(0, 0, 10);
  blueLightArtSlider.setShowTicks(true);
  blueLightArtSlider.setNumberFormat(G4P.INTEGER, 0);
  blueLightArtSlider.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  blueLightArtSlider.setOpaque(true);
  blueLightArtSlider.addEventHandler(this, "blueLightArtSliderChanged");
  blueHeavyArtSlider = new GSlider(blueArmyWindow, 20, 250, 100, 40, 10.0);
  blueHeavyArtSlider.setShowValue(true);
  blueHeavyArtSlider.setLimits(0, 0, 10);
  blueHeavyArtSlider.setShowTicks(true);
  blueHeavyArtSlider.setNumberFormat(G4P.INTEGER, 0);
  blueHeavyArtSlider.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  blueHeavyArtSlider.setOpaque(true);
  blueHeavyArtSlider.addEventHandler(this, "blueHeavyArtSliderChanged");
  blueSniperSlider = new GSlider(blueArmyWindow, 180, 250, 100, 40, 10.0);
  blueSniperSlider.setShowValue(true);
  blueSniperSlider.setLimits(0, 0, 10);
  blueSniperSlider.setShowTicks(true);
  blueSniperSlider.setNumberFormat(G4P.INTEGER, 0);
  blueSniperSlider.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  blueSniperSlider.setOpaque(true);
  blueSniperSlider.addEventHandler(this, "blueSniperSliderChanged");
  blueSniperLabel = new GLabel(blueArmyWindow, 180, 230, 100, 20);
  blueSniperLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueSniperLabel.setText("Sniper");
  blueSniperLabel.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  blueSniperLabel.setOpaque(true);
  blueHeavyArtLabel = new GLabel(blueArmyWindow, 20, 230, 100, 20);
  blueHeavyArtLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueHeavyArtLabel.setText("Heavy Artillery");
  blueHeavyArtLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  blueHeavyArtLabel.setOpaque(true);
  blueLightArtLabel = new GLabel(blueArmyWindow, 180, 170, 100, 20);
  blueLightArtLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueLightArtLabel.setText("Light Artillery");
  blueLightArtLabel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  blueLightArtLabel.setOpaque(true);
  blueHeavyCavLabel = new GLabel(blueArmyWindow, 20, 170, 100, 20);
  blueHeavyCavLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueHeavyCavLabel.setText("Heavy Cavalry");
  blueHeavyCavLabel.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  blueHeavyCavLabel.setOpaque(true);
  blueLightCavLabel = new GLabel(blueArmyWindow, 180, 110, 100, 20);
  blueLightCavLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueLightCavLabel.setText("Light Cavalry");
  blueLightCavLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  blueLightCavLabel.setOpaque(true);
  blueHeavyInfLabel = new GLabel(blueArmyWindow, 20, 110, 100, 20);
  blueHeavyInfLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueHeavyInfLabel.setText("Heavy Infantry");
  blueHeavyInfLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  blueHeavyInfLabel.setOpaque(true);
  blueLightInfLabel = new GLabel(blueArmyWindow, 180, 50, 100, 20);
  blueLightInfLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueLightInfLabel.setText("Light Infantry");
  blueLightInfLabel.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  blueLightInfLabel.setOpaque(true);
  blueReinforcementTimeLabel = new GLabel(blueArmyWindow, 20, 50, 100, 20);
  blueReinforcementTimeLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  blueReinforcementTimeLabel.setText("Reinforcement Time");
  blueReinforcementTimeLabel.setOpaque(true);
  redArmyWindow.loop();
  blueArmyWindow.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow redArmyWindow;
GButton redPauseButton; 
GButton redTerrainButton; 
GSlider redLightInfSlider; 
GSlider redHeavyInfSlider; 
GSlider redLightCavSlider; 
GSlider redHeavyCavSlider; 
GSlider redLightArtSlider; 
GSlider redHeavyArtSlider; 
GSlider redSniperSlider; 
GSlider reinforcementSlider; 
GLabel redSniperLabel; 
GLabel redLightArtLabel; 
GLabel redLightCavLabel; 
GLabel redHeavyArtLabel; 
GLabel redHeavyCavLabel; 
GLabel redHeavyInfLabel; 
GLabel redLightInfLabel; 
GLabel redReinforcementLabel; 
GWindow blueArmyWindow;
GButton blueChangeTerrainButton; 
GButton bluePauseButton; 
GSlider blueReinforcementSlider; 
GSlider blueLightInfSlider; 
GSlider blueHeavyCavSlider; 
GSlider blueLightCavSlider; 
GSlider blueHeavyInfSlider; 
GSlider blueLightArtSlider; 
GSlider blueHeavyArtSlider; 
GSlider blueSniperSlider; 
GLabel blueSniperLabel; 
GLabel blueHeavyArtLabel; 
GLabel blueLightArtLabel; 
GLabel blueHeavyCavLabel; 
GLabel blueLightCavLabel; 
GLabel blueHeavyInfLabel; 
GLabel blueLightInfLabel; 
GLabel blueReinforcementTimeLabel; 
