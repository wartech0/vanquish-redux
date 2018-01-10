class garageDialog
{
  idd = 800;
  movingEnabled = false;
  enableSimulation = true;
  controlsBackground[] = { };
  objects[] = { };
  controls[] = { leftTabLand };

  class leftTabLand
  {
    idc = -1; // -1 unneeded
    type = CT_ACTIVETEXT;
    style = ST_PICTURE;
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryweapon_ca.paa";
    x = 0.75; y = 0.5;
    w = 0.2; h = 0.035;
    font = FontM;
    sizeEx = 0.024;
    color[] = { 1, 1, 1, 1 };
    colorBackground[] = { 0, 0, 0, 1};
    colorActive[] = { 1, 0.2, 0.2, 1 };
    colorText[] = { 1, 1, 1, 1};
    soundEnter[] = { "", 0, 1 };   // no sound
    soundPush[] = { "", 0, 1 };
    soundClick[] = { "", 0, 1 };
    soundEscape[] = { "", 0, 1 };
    default = true;
  };
};