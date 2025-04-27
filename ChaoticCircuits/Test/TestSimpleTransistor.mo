within ChaoticCircuits.Test;
model TestSimpleTransistor "Test the simple small signal transistor model"
  extends Modelica.Icons.Example;
  Components.SimpleTransistor npn(Vth=0.001,
                                  vBE(start=0))
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor r11(R=11) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,20})));
  Modelica.Electrical.Analog.Basic.Resistor r12(R=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-20})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltagesupply(V=12)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,0})));
  Modelica.Electrical.Analog.Sources.SineVoltage vIn(V=1, f=10) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-20})));
  Modelica.Electrical.Analog.Basic.Resistor rC(R=5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,22})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={10,-20})));
equation
  connect(ground.p, npn.E)
    annotation (Line(points={{-10,-40},{-10,-6}},
                                                color={0,0,255}));
  connect(ground.p, r12.n)
    annotation (Line(points={{-10,-40},{-40,-40},{-40,-30}}, color={0,0,255}));
  connect(r12.p, r11.n)
    annotation (Line(points={{-40,-10},{-40,10}}, color={0,0,255}));
  connect(r11.n, npn.B)
    annotation (Line(points={{-40,10},{-40,0},{-30,0}}, color={0,0,255}));
  connect(ground.p, constantVoltagesupply.n)
    annotation (Line(points={{-10,-40},{-80,-40},{-80,-10}}, color={0,0,255}));
  connect(constantVoltagesupply.p, r11.p) annotation (Line(points={{-80,10},{
          -80,40},{-40,40},{-40,30}}, color={0,0,255}));
  connect(ground.p, vIn.n)
    annotation (Line(points={{-10,-40},{-60,-40},{-60,-30}}, color={0,0,255}));
  connect(npn.B, vIn.p)
    annotation (Line(points={{-30,0},{-60,0},{-60,-10}}, color={0,0,255}));
  connect(npn.C, rC.n)
    annotation (Line(points={{-10,6},{0,6},{0,12}}, color={0,0,255}));
  connect(constantVoltagesupply.p, rC.p) annotation (Line(points={{-80,10},{-80,
          40},{0,40},{0,32}}, color={0,0,255}));
  connect(ground.p, vOut.n)
    annotation (Line(points={{-10,-40},{10,-40},{10,-30}}, color={0,0,255}));
  connect(npn.C, vOut.p)
    annotation (Line(points={{-10,6},{10,6},{10,-10}}, color={0,0,255}));
  annotation (experiment(
      Interval=0.0001,
      Tolerance=1e-06), Diagram(graphics={Text(
          extent={{20,30},{80,20}},
          textColor={0,0,255},
          textString="vCE has to be kept > 0")}));
end TestSimpleTransistor;
